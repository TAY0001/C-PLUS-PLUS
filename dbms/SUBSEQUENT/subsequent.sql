-- dim_member
CREATE OR REPLACE PROCEDURE load_dim_member AS
BEGIN
    INSERT INTO dim_member (
        member_surrogate_key, 
        member_id, 
        name, 
        city, 
        state, 
        postcode,
        date_of_birth, 
        registration_date, 
        member_type_name,
        borrow_limit, 
        loan_period_limit, 
        membership_status,
        effective_start_date, 
        effective_end_date, 
        is_current_flag
    )
    SELECT dim_member_seq.NEXTVAL,
           m.member_id,
           UPPER(TRIM(m.name)),
           UPPER(TRIM(m.city)),
           UPPER(TRIM(m.state)),
           m.postcode,
           m.date_of_birth,
           m.registration_date,
           UPPER(TRIM(t.type_name)),
           t.borrow_limit,
           t.loan_period,
           UPPER(v.member_status),
           v.start_date,
           NVL(v.end_date, DATE '9999-12-31'),
           'Y'
    FROM member m
    JOIN membership_type t 
      ON m.type_id = t.type_id
    JOIN membership_validity v 
      ON m.member_id = v.member_id
    WHERE NOT EXISTS (
        SELECT 1 
        FROM dim_member d 
        WHERE d.member_id = m.member_id
    );

    COMMIT;
END;
/

-- dim_facility
CREATE OR REPLACE PROCEDURE load_dim_facility AS
BEGIN
    INSERT INTO dim_facility (
        facility_key, 
        facility_id, 
        facility_name, 
        facility_type, 
        capacity,
        resources_available, 
        floor_number, 
        room_number, 
        effective_start_date, 
        effective_end_date, 
        is_current_flag
    )
    SELECT dim_facility_seq.NEXTVAL,
           f.facility_id,
           UPPER(TRIM(f.facility_name)),
           UPPER(TRIM(f.facility_type)),
           f.capacity,
           NVL(f.resources_available,'NONE'),
           f.floor_number,
           f.room_number,
           SYSDATE,
           DATE '9999-12-31',
           'Y'
    FROM facility f
    WHERE NOT EXISTS (
        SELECT 1
        FROM dim_facility d
        WHERE d.facility_id = f.facility_id
    );

    COMMIT;
END;
/

-- dim_book
CREATE OR REPLACE PROCEDURE load_dim_book AS
BEGIN
    INSERT INTO dim_book (
        book_key, 
        book_id, 
        title, 
        author, 
        publisher, 
        genre_name, 
        language,
        page_number, 
        total_copies, 
        borrowing_copies, 
        damaged_copies, 
        lost_copies,
        reserved_copies, 
        popularity_scores, 
        effective_start_date, 
        effective_end_date,
        is_current_flag
    )
    SELECT
        dim_book_seq.NEXTVAL,
        b.book_id,
        b.title,
        a.first_name || ' ' || a.last_name AS author,
        p.name AS publisher,
        b.genre_name,
        b.language,
        b.page_number,
        b.total_copies,
        CASE WHEN c.copy_status = 'BORROWED' THEN 1 ELSE 0 END AS borrowing_copies,
        CASE WHEN c.copy_status = 'DAMAGED' THEN 1 ELSE 0 END AS damaged_copies,
        CASE WHEN c.copy_status = 'LOST' THEN 1 ELSE 0 END AS lost_copies,
        CASE WHEN c.copy_status = 'RESERVED' THEN 1 ELSE 0 END AS reserved_copies,
        b.popularity_scores,
        SYSDATE,
        DATE '9999-12-31',
        'Y'
    FROM books b
    JOIN books_copies c ON b.book_id = c.book_id
    JOIN author a ON b.author_id = a.author_id
    JOIN publisher p ON b.publisher_id = p.publisher_id
    WHERE NOT EXISTS (
        SELECT 1
        FROM dim_book d
        WHERE d.book_id = b.book_id
    );

    COMMIT;
END;
/

-- fact_borrowing
CREATE OR REPLACE PROCEDURE load_fact_borrowing AS
BEGIN
    INSERT INTO fact_borrowing (
        member_surrogate_key, 
        book_key, 
        borrow_date_key,
        original_due_date_key, 
        new_due_date_key,
        return_date_key, 
        reserved_date_key, 
        borrowing_id,
        is_returned, 
        is_overdue, 
        is_extended, 
        was_reserved, 
        days_overdue
    )
    SELECT dm.member_surrogate_key,
           db.book_key,
           dd_borrow.date_key,
           dd_due.date_key,
           dd_newdue.date_key,
           dd_return.date_key,
           dd_res.date_key,
           br.borrowing_id,
           CASE WHEN br.return_date IS NOT NULL THEN 'Y' ELSE 'N' END,
           CASE WHEN NVL(br.days_overdue,0) > 0 THEN 'Y' ELSE 'N' END,
           br.is_extension,
           CASE WHEN r.reservation_id IS NOT NULL THEN 'Y' ELSE 'N' END,
           NVL(br.days_overdue,0)
    FROM borrowing_returning br
    JOIN member m ON br.member_id = m.member_id
    JOIN dim_member dm ON dm.member_id = m.member_id AND dm.is_current_flag = 'Y'
    JOIN books_copies c ON br.copy_id = c.copy_id
    JOIN books b ON c.book_id = b.book_id
    JOIN dim_book db ON db.book_id = b.book_id AND db.is_current_flag = 'Y'
    JOIN dim_date dd_borrow ON dd_borrow.cal_date = br.borrow_date
    JOIN dim_date dd_due ON dd_due.cal_date = br.due_date
    LEFT JOIN dim_date dd_newdue ON dd_newdue.cal_date = br.new_due_date
    LEFT JOIN dim_date dd_return ON dd_return.cal_date = br.return_date
    LEFT JOIN reservations r ON r.copy_id = br.copy_id AND r.member_id = br.member_id
    LEFT JOIN dim_date dd_res ON dd_res.cal_date = r.reservation_date
    WHERE NOT EXISTS (
        SELECT 1 FROM fact_borrowing fb WHERE fb.borrowing_id = br.borrowing_id
    );

    COMMIT;
END;
/

-- fact_fines
CREATE OR REPLACE PROCEDURE load_fact_fines AS
BEGIN
    INSERT INTO fact_fines (
        member_surrogate_key, 
        fine_date_key, 
        fine_id,
        fine_amount, 
        payment_status, 
        fine_type
    )
    SELECT dm.member_surrogate_key,
           dd.date_key,
           f.fine_id,
           f.fine_amount,
           UPPER(TRIM(f.payment_status)),
           UPPER(TRIM(f.type))
    FROM fines f
    JOIN dim_member dm ON dm.member_id = f.member_id AND dm.is_current_flag = 'Y'
    JOIN dim_date dd ON dd.cal_date = f.fine_date
    WHERE NOT EXISTS (
        SELECT 1 FROM fact_fines ff WHERE ff.fine_id = f.fine_id
    );

    COMMIT;
END;
/

-- fact_facility_booking
CREATE OR REPLACE PROCEDURE load_fact_facility_booking AS
BEGIN
    INSERT INTO fact_facility_booking (
        facility_key, 
        member_surrogate_key, 
        booking_date_key,
        facility_booking_id, 
        fee
    )
    SELECT df.facility_key,
           dm.member_surrogate_key,
           dd.date_key,
           fb.facility_booking_id,
           f.fee
    FROM facility_booking fb
    JOIN facility f ON fb.facility_id = f.facility_id
    JOIN dim_facility df ON df.facility_id = f.facility_id
    JOIN member m ON fb.member_id = m.member_id
    JOIN dim_member dm ON dm.member_id = m.member_id
    JOIN dim_date dd ON dd.cal_date = fb.booking_date
    WHERE NOT EXISTS (
        SELECT 1 
        FROM fact_facility_booking ff
        WHERE ff.facility_booking_id = fb.facility_booking_id
    );

    COMMIT;
END;
/

-- fact_book_sales
CREATE OR REPLACE PROCEDURE load_fact_book_sale AS
BEGIN
    INSERT INTO fact_book_sale (
        book_key, 
        member_surrogate_key, 
        sale_date_key, 
        sales_id, 
        unitprice, 
        quantitysold, 
        discount_percentage,
        totalamount
    )
    SELECT db.book_key,
           dm.member_surrogate_key,
           dd.date_key,
           s.sales_id,
           b.unitprice,
           COUNT(c.copy_id) AS quantitysold,
           d.discount_percentage,
           ROUND(b.unitprice * COUNT(c.copy_id) * (1 - (d.discount_percentage/100)),1) AS totalamount
    FROM book_sales s
    JOIN book_sales_details d ON s.sales_id = d.sales_id
    JOIN books_copies c ON d.copy_id = c.copy_id
    JOIN books b ON c.book_id = b.book_id
    JOIN dim_book db ON db.book_id = b.book_id
    JOIN member m ON s.member_id = m.member_id
    JOIN dim_member dm ON dm.member_id = m.member_id
    JOIN dim_date dd ON dd.cal_date = s.sales_date
    WHERE NOT EXISTS (
        SELECT 1 
        FROM fact_book_sale f 
        WHERE f.sales_id = s.sales_id
    )
    GROUP BY db.book_key, dm.member_surrogate_key, dd.date_key, s.sales_id, b.unitprice, d.discount_percentage;

    COMMIT;
END;
/

-- dim_date
CREATE OR REPLACE PROCEDURE load_dim_date AS
    v_start_date DATE := DATE '2016-01-01';
    v_end_date   DATE := DATE '2027-12-31';
    v_date       DATE := v_start_date;
    v_count      NUMBER;
BEGIN
    WHILE v_date <= v_end_date LOOP
        -- Check if date already exists using PL/SQL syntax
        SELECT COUNT(*) INTO v_count
        FROM dim_date 
        WHERE cal_date = v_date;
        
        IF v_count = 0 THEN
            INSERT INTO dim_date (
                date_key, 
                cal_date, 
                full_desc, 
                day_week, 
                day_num_month, 
                day_num_year,
                last_day_ind, 
                cal_week_end_date, 
                cal_week_year, 
                cal_month_name, 
                cal_month_year,
                cal_year_month, 
                cal_quarter, 
                cal_year_quarter, 
                cal_year, 
                holiday_ind, 
                weekend_ind, 
                festive_event
            )
            VALUES (
                dim_date_seq.NEXTVAL,
                v_date,
                TO_CHAR(v_date, 'FMDay, DD FMMonth YYYY'),
                TO_CHAR(v_date, 'D'),
                TO_NUMBER(TO_CHAR(v_date,'DD')),
                TO_NUMBER(TO_CHAR(v_date,'DDD')),
                CASE WHEN v_date = LAST_DAY(v_date) THEN 'Y' ELSE 'N' END,
                NEXT_DAY(v_date, 'SATURDAY'),
                TO_NUMBER(TO_CHAR(v_date,'WW')),
                TO_CHAR(v_date,'Month'),
                TO_NUMBER(TO_CHAR(v_date,'MM')),
                TO_CHAR(v_date,'YYYY') || '-' || TO_CHAR(v_date,'MM'),
                'Q' || TO_CHAR(v_date,'Q'),
                TO_CHAR(v_date,'YYYY') || '-' || 'Q' || TO_CHAR(v_date,'Q'),
                TO_NUMBER(TO_CHAR(v_date,'YYYY')),
                'N',
                CASE WHEN TO_CHAR(v_date,'D') IN ('1','7') THEN 'Y' ELSE 'N' END,
                'NONE'
            );
        END IF;
        v_date := v_date + 1;
    END LOOP;
    COMMIT;
END load_dim_date;
/

-- Insert new members
DECLARE
    v_member_seq_val1 VARCHAR2(10);
    v_member_seq_val2 VARCHAR2(10);
    v_validity_seq_val1 VARCHAR2(10);
    v_validity_seq_val2 VARCHAR2(10);
BEGIN
    v_member_seq_val1 := 'M' || LPAD(member_seq.NEXTVAL, 4, '0');
    INSERT INTO member (member_id, type_id, name, email, city, postcode, state, date_of_birth, registration_date) 
    VALUES (v_member_seq_val1, 'MT002', 'Jane Lo', 'janelo@gmail.com', 'Sibu', 96000, 'Sarawak', TO_DATE('1999-01-01','YYYY-MM-DD'), TO_DATE('2025-09-01','YYYY-MM-DD'));

    v_validity_seq_val1 := 'V' || LPAD(member_seq.CURRVAL, 4, '0');
    INSERT INTO membership_validity (validity_id, member_id, type_id, start_date, end_date, member_status)
    VALUES (v_validity_seq_val1, v_member_seq_val1, 'MT002', TO_DATE('2025-09-01','YYYY-MM-DD'), TO_DATE('2026-09-01','YYYY-MM-DD'), 'Active');

    v_member_seq_val2 := 'M' || LPAD(member_seq.NEXTVAL, 4, '0');
    INSERT INTO member (member_id, type_id, name, email, city, postcode, state, date_of_birth, registration_date) 
    VALUES (v_member_seq_val2, 'MT004', 'Shereen Foo', 'shereenfoo@gmail.com', 'Kluang', 86000, 'Johor', TO_DATE('1992-11-13','YYYY-MM-DD'), TO_DATE('2025-09-03','YYYY-MM-DD'));

    v_validity_seq_val2 := 'V' || LPAD(member_seq.CURRVAL, 4, '0');
    INSERT INTO membership_validity (validity_id, member_id, type_id, start_date, end_date, member_status)
    VALUES (v_validity_seq_val2, v_member_seq_val2, 'MT004', TO_DATE('2025-09-03','YYYY-MM-DD'), TO_DATE('2026-09-03','YYYY-MM-DD'), 'Active');

    COMMIT;
END;
/

-- Insert new facilities
BEGIN
    INSERT INTO facility (facility_id, facility_name, facility_type, capacity, resources_available, floor_number, room_number, availability_status, fee) 
    VALUES ('FC041', 'Individual Study Room 11', 'Study Room', 1, NULL, 3, 'SR11', 'Available', 5);

    INSERT INTO facility (facility_id, facility_name, facility_type, capacity, resources_available, floor_number, room_number, availability_status, fee) 
    VALUES ('FC042', 'Discussion Room 21', 'Discussion Room', 8, 'Two Desktop Computer', 1, 'DR21', 'Available', 18);

    COMMIT;
END;
/

-- Insert new books and copies
DECLARE
    v_book_id1 VARCHAR2(10);
    v_copy_id1 VARCHAR2(7);
    v_book_id2 VARCHAR2(10);
    v_copy_id2 VARCHAR2(7);
BEGIN
    v_book_id1 := 'B' || LPAD(books_seq.NEXTVAL, 5, '0');
    INSERT INTO books (book_id, author_id, publisher_id, genre_name, title, language, page_number, total_copies, available_copies, popularity_scores, unitprice) 
    VALUES (v_book_id1, 'A0100', 'P020', 'Historical Fiction', 'The Underground Railroad', 'English', 250, 2, 2, 9.5, 80);

    v_copy_id1 := 'C' || LPAD(copies_seq.NEXTVAL, 5, '0');
    INSERT INTO books_copies (copy_id, book_id, barcode, location, copy_status, is_available, is_reserved, is_lost, is_damaged) 
    VALUES (v_copy_id1, v_book_id1, '291142669', 'Shelf D1', 'AVAILABLE', 'Y', 'N', 'N', 'N');

    v_book_id2 := 'B' || LPAD(books_seq.NEXTVAL, 5, '0');
    INSERT INTO books (book_id, author_id, publisher_id, genre_name, title, language, page_number, total_copies, available_copies, popularity_scores, unitprice) 
    VALUES (v_book_id2, 'A0085', 'P012', 'Adventure', 'Fantastic Mr Fox', 'English', 150, 2, 2, 9.2, 85);

    v_copy_id2 := 'C' || LPAD(copies_seq.NEXTVAL, 5, '0');
    INSERT INTO books_copies (copy_id, book_id, barcode, location, copy_status, is_available, is_reserved, is_lost, is_damaged) 
    VALUES (v_copy_id2, v_book_id2, '291142670', 'Shelf K1', 'AVAILABLE', 'Y', 'N', 'N', 'N');

    COMMIT;
END;
/

-- Insert borrowing and fines
DECLARE
    v_borrowing_id1 VARCHAR2(14);
    v_borrowing_id2 VARCHAR2(14);
    v_fine_id1      VARCHAR2(10);
    v_fine_id2      VARCHAR2(10);
BEGIN
    v_borrowing_id1 := 'R' || LPAD(borrowing_seq.NEXTVAL, 6, '0');
    v_fine_id1      := 'FN' || LPAD(fines_seq.NEXTVAL, 5, '0');
    INSERT INTO borrowing_returning (borrowing_id, member_id, copy_id, borrow_date, due_date, return_date, is_extension, new_due_date, days_overdue, borrowing_status)
    VALUES (v_borrowing_id1, 'M2863', 'C15001', TO_DATE('2025-09-02','YYYY-MM-DD'), TO_DATE('2025-09-08','YYYY-MM-DD'), TO_DATE('2025-09-06','YYYY-MM-DD'), 'N', NULL, NULL, 'RETURNED_DAMAGED');
    INSERT INTO fines (fine_id, member_id, borrowing_id, fine_amount, fine_date, payment_status, type) 
    VALUES (v_fine_id1, 'M2863', v_borrowing_id1, 80, TO_DATE('2025-09-06','YYYY-MM-DD'), 'Paid', 'DAMAGED');

    v_borrowing_id2 := 'R' || LPAD(borrowing_seq.NEXTVAL, 6, '0');
    v_fine_id2      := 'FN' || LPAD(fines_seq.NEXTVAL, 5, '0');
    INSERT INTO borrowing_returning (borrowing_id, member_id, copy_id, borrow_date, due_date, return_date, is_extension, new_due_date, days_overdue, borrowing_status)
    VALUES (v_borrowing_id2, 'M2889', 'C15002', TO_DATE('2025-09-03','YYYY-MM-DD'), TO_DATE('2025-09-12','YYYY-MM-DD'), TO_DATE('2025-09-10','YYYY-MM-DD'), 'N', NULL, NULL, 'RETURNED_DAMAGED');
    INSERT INTO fines (fine_id, member_id, borrowing_id, fine_amount, fine_date, payment_status, type) 
    VALUES (v_fine_id2, 'M2889', v_borrowing_id2, 85, TO_DATE('2025-09-10','YYYY-MM-DD'), 'Unpaid', 'DAMAGED');

    UPDATE books b
    SET available_copies = b.total_copies - (
        SELECT COUNT(*)
        FROM books_copies c
        JOIN borrowing_returning br ON br.copy_id = c.copy_id
        WHERE c.book_id = b.book_id
          AND br.borrowing_status IN ('RETURNED_DAMAGED','LOST_BOOK')
    )
    WHERE EXISTS (
        SELECT 1
        FROM books_copies c
        JOIN borrowing_returning br ON br.copy_id = c.copy_id
        WHERE c.book_id = b.book_id
          AND br.borrowing_status IN ('RETURNED_DAMAGED','LOST_BOOK')
    );

    COMMIT;
END;
/

-- Insert facility bookings
DECLARE
    v_booking_id1 VARCHAR2(10);
    v_booking_id2 VARCHAR2(10);
BEGIN
    v_booking_id1 := 'FB' || LPAD(booking_seq.NEXTVAL, 6, '0');
    v_booking_id2 := 'FB' || LPAD(booking_seq.NEXTVAL, 6, '0');

    INSERT INTO facility_booking (facility_booking_id, facility_id, member_id, reservation_date, booking_date)
    VALUES (v_booking_id1, 'FC002', 'M1000', TO_DATE('2025-09-02','YYYY-MM-DD'), TO_DATE('2025-09-04','YYYY-MM-DD'));

    INSERT INTO facility_booking (facility_booking_id, facility_id, member_id, reservation_date, booking_date)
    VALUES (v_booking_id2, 'FC031', 'M2000', TO_DATE('2025-09-02','YYYY-MM-DD'), TO_DATE('2025-09-04','YYYY-MM-DD'));

    COMMIT;
END;
/

-- Insert book sales
DECLARE
    v_sales_id1   VARCHAR2(7);
    v_sales_id2   VARCHAR2(7);
    v_details_id1 VARCHAR2(10);
    v_details_id2 VARCHAR2(10);
BEGIN
    v_sales_id1 := 'S' || LPAD(sales_seq.NEXTVAL, 5, '0');
    INSERT INTO book_sales (sales_id, member_id, sales_date, total_price)
    VALUES (v_sales_id1, 'M2994', TO_DATE('2025-09-02','YYYY-MM-DD'), 70.5);

    v_details_id1 := 'SD' || LPAD(sales_details_seq.NEXTVAL, 5, '0');
    INSERT INTO book_sales_details (details_id, sales_id, copy_id, discount_percentage, total_amount)
    VALUES (v_details_id1, v_sales_id1, 'C14998', 15, 70.5);

    v_sales_id2 := 'S' || LPAD(sales_seq.NEXTVAL, 5, '0');
    INSERT INTO book_sales (sales_id, member_id, sales_date, total_price)
    VALUES (v_sales_id2, 'M2996', TO_DATE('2027-09-05','YYYY-MM-DD'), 68.5);

    v_details_id2 := 'SD' || LPAD(sales_details_seq.NEXTVAL, 5, '0');
    INSERT INTO book_sales_details (details_id, sales_id, copy_id, discount_percentage, total_amount)
    VALUES (v_details_id2, v_sales_id2, 'C14997', 15, 77.9);

    COMMIT;
END;
/

BEGIN
    load_dim_date;
    load_dim_member;
    load_dim_facility;
    load_dim_book;
    load_fact_borrowing;
    load_fact_fines;
    load_fact_facility_booking;
    load_fact_book_sale;
END;
/