-- Dimension Tables

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
JOIN membership_type t ON m.type_id = t.type_id
JOIN membership_validity v ON m.member_id = v.member_id;

DECLARE
    -- Define the start and end date for the loop
    v_start_date DATE := DATE '2016-01-01';
    v_end_date   DATE := DATE '2026-12-31';

    -- Variables to hold calculated calendar attributes
    v_date              DATE;
    v_full_desc         VARCHAR2(40);
    v_day_week          NUMBER(1);
    v_day_num_month     NUMBER(2);
    v_day_num_year      NUMBER(3);
    v_last_day_ind      CHAR(1);
    v_cal_week_end_date DATE;
    v_cal_week_year     NUMBER(2);
    v_cal_month_name    VARCHAR2(9);
    v_cal_month_year    NUMBER(2);
    v_cal_year_month    CHAR(7);
    v_cal_quarter       CHAR(2);
    v_cal_year_quarter  CHAR(7);
    v_cal_year          NUMBER(4);
    v_holiday_ind       CHAR(1);
    v_weekend_ind       CHAR(1);
    v_festive_event     VARCHAR2(50);
BEGIN
    v_date := v_start_date;
    WHILE v_date <= v_end_date LOOP
        v_full_desc := TO_CHAR(v_date, 'FMDay, DD FMMonth YYYY');
        --  of week (1=Monday..7=Sunday)
        v_day_week := TO_CHAR(v_date, 'D');
        v_day_num_month := TO_NUMBER(TO_CHAR(v_date,'DD'));
        v_day_num_year  := TO_NUMBER(TO_CHAR(v_date,'DDD'));
        v_last_day_ind := CASE WHEN v_date = LAST_DAY(v_date) THEN 'Y' ELSE 'N' END;
        v_cal_week_end_date := v_date + (7 - v_day_week);
        v_cal_week_year := TO_NUMBER(TO_CHAR(v_date,'WW'));
        v_cal_month_name := TO_CHAR(v_date,'Month');
        v_cal_month_year := TO_NUMBER(TO_CHAR(v_date,'MM'));
        v_cal_quarter := 'Q' || TO_CHAR(v_date,'Q');
        v_cal_year := TO_NUMBER(TO_CHAR(v_date,'YYYY'));
        v_cal_year_month   := TO_CHAR(v_date,'YYYY') || '-' || TO_CHAR(v_date,'MM');
        v_cal_year_quarter := TO_CHAR(v_date,'YYYY') || '-' || v_cal_quarter;
        v_holiday_ind := 'N';
        v_weekend_ind := CASE WHEN v_day_week IN (1,7) THEN 'Y' ELSE 'N' END;
        v_festive_event := 'NONE';

        -- Festive events
        IF TO_CHAR(v_date,'MM-DD') = '01-01' THEN
            v_holiday_ind := 'Y'; v_festive_event := 'NEW YEAR';
        ELSIF TO_CHAR(v_date,'MM-DD') BETWEEN '01-29' AND '01-30' THEN
            v_holiday_ind := 'Y'; v_festive_event := 'CHINESE NEW YEAR';
        ELSIF TO_CHAR(v_date,'MM-DD') = '05-01' THEN
            v_holiday_ind := 'Y'; v_festive_event := 'LABOUR DAY';
        ELSIF TO_CHAR(v_date,'MM-DD') = '08-31' THEN
            v_holiday_ind := 'Y'; v_festive_event := 'NATIONAL DAY';
        ELSIF TO_CHAR(v_date,'MM-DD') = '09-16' THEN
            v_holiday_ind := 'Y'; v_festive_event := 'MALAYSIA DAY';
        ELSIF TO_CHAR(v_date,'MM-DD') = '12-25' THEN
            v_holiday_ind := 'Y'; v_festive_event := 'CHRISTMAS';
        ELSIF TO_CHAR(v_date,'MM-DD') BETWEEN '04-01' AND '04-02' THEN
            v_holiday_ind := 'Y'; v_festive_event := 'HARI RAYA AIDILFITRI';
        ELSIF TO_CHAR(v_date,'MM-DD') = '06-06' THEN
            v_holiday_ind := 'Y'; v_festive_event := 'HARI RAYA HAJI';
        ELSIF TO_CHAR(v_date,'MM-DD') = '07-27' THEN
            v_holiday_ind := 'Y'; v_festive_event := 'AWAL MUHARRAM';
        ELSIF TO_CHAR(v_date,'MM-DD') = '09-05' THEN
            v_holiday_ind := 'Y'; v_festive_event := 'MAULIDUR RASUL';
        ELSIF TO_CHAR(v_date,'MM-DD') = '05-12' THEN
            v_holiday_ind := 'Y'; v_festive_event := 'WESAK';
        ELSIF TO_CHAR(v_date,'MM-DD') = '01-14' THEN
            v_holiday_ind := 'Y'; v_festive_event := 'THAIPUSAM';
        ELSIF TO_CHAR(v_date,'MM-DD') = '10-20' THEN
            v_holiday_ind := 'Y'; v_festive_event := 'DEEPAVALI';
        END IF;

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
        ) VALUES (
            dim_date_seq.NEXTVAL,
            v_date,
            v_full_desc,
            v_day_week,
            v_day_num_month,
            v_day_num_year,
            v_last_day_ind,
            v_cal_week_end_date,
            v_cal_week_year,
            v_cal_month_name,
            v_cal_month_year,
            v_cal_year_month,
            v_cal_quarter,
            v_cal_year_quarter,
            v_cal_year,
            v_holiday_ind,
            v_weekend_ind,
            v_festive_event
        );

        v_date := v_date + 1;
    END LOOP;

    COMMIT;
END;
/

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
       NVL(f.resources_available, 'NONE'),
       f.floor_number,
       f.room_number,
       DATE '2016-01-01',
       DATE '9999-12-31',
       'Y'
FROM facility f;

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
SELECT dim_book_seq.NEXTVAL,
       b.book_id,
       UPPER(TRIM(b.title)) AS title,
       UPPER(a.first_name || ' ' || a.last_name) AS author,
       UPPER(TRIM(p.name)) AS publisher,
       UPPER(TRIM(b.genre_name)) AS genre_name,
       UPPER(TRIM(b.language)) AS language,
       b.page_number,
       b.total_copies,
       bc.borrowing_copies,
       bc.damaged_copies,
       bc.lost_copies,
       bc.reserved_copies,
       b.popularity_scores,
       DATE '2016-01-01',
       DATE '9999-12-31',
       'Y' AS is_current_flag
FROM books b
JOIN author a ON b.author_id = a.author_id
JOIN publisher p ON b.publisher_id = p.publisher_id
JOIN (
    SELECT book_id,
           SUM(CASE WHEN copy_status = 'BORROWED' THEN 1 ELSE 0 END) AS borrowing_copies,
           SUM(CASE WHEN copy_status = 'DAMAGED' THEN 1 ELSE 0 END) AS damaged_copies,
           SUM(CASE WHEN copy_status = 'LOST' THEN 1 ELSE 0 END) AS lost_copies,
           SUM(CASE WHEN copy_status = 'RESERVED' THEN 1 ELSE 0 END) AS reserved_copies
    FROM books_copies
    GROUP BY book_id
) bc ON b.book_id = bc.book_id;

-- Fact Tables

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
JOIN dim_member dm ON dm.member_id = f.member_id
JOIN dim_date dd ON dd.cal_date = f.fine_date;

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
JOIN dim_date dd ON dd.cal_date = fb.booking_date;

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
       SUM(d.total_amount) AS totalamount
FROM book_sales s
JOIN book_sales_details d ON s.sales_id = d.sales_id
JOIN books_copies c ON d.copy_id = c.copy_id
JOIN books b ON c.book_id = b.book_id
JOIN dim_book db ON db.book_id = b.book_id
JOIN member m ON s.member_id = m.member_id
JOIN dim_member dm ON dm.member_id = m.member_id
JOIN dim_date dd ON dd.cal_date = s.sales_date
GROUP BY db.book_key, dm.member_surrogate_key, dd.date_key, s.sales_id, b.unitprice, d.discount_percentage;

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
       CASE WHEN br.return_date IS NOT NULL THEN 'Y' ELSE 'N' END AS is_returned,
       CASE WHEN NVL(br.days_overdue,0) > 0 THEN 'Y' ELSE 'N' END AS is_overdue,
       br.is_extension AS is_extended,
       CASE WHEN r.reservation_id IS NOT NULL THEN 'Y' ELSE 'N' END AS was_reserved,
       NVL(br.days_overdue,0) AS days_overdue
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
LEFT JOIN dim_date dd_res ON dd_res.cal_date = r.reservation_date;