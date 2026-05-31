DROP TABLE fact_borrowing CASCADE CONSTRAINTS;
DROP TABLE fact_book_sale CASCADE CONSTRAINTS;
DROP TABLE fact_facility_booking CASCADE CONSTRAINTS;
DROP TABLE fact_fines CASCADE CONSTRAINTS;
DROP TABLE dim_book CASCADE CONSTRAINTS;
DROP TABLE dim_facility CASCADE CONSTRAINTS;
DROP TABLE dim_date CASCADE CONSTRAINTS;
DROP TABLE dim_member CASCADE CONSTRAINTS;

-- Dimension Tables

CREATE TABLE dim_member (
    member_surrogate_key    NUMBER         NOT NULL,
    member_id               VARCHAR2(10)   NOT NULL,
    name                    VARCHAR2(28)   NOT NULL,
    city                    VARCHAR2(20)   NOT NULL,
    state                   VARCHAR2(18)   NOT NULL,
    postcode                VARCHAR2(9)    NOT NULL,
    date_of_birth           DATE           NOT NULL,
    registration_date       DATE           NOT NULL,
    member_type_name        VARCHAR2(10)   NOT NULL    CHECK(member_type_name IN ('STANDARD', 'SILVER', 'PREMIUM', 'GOLD')),
    borrow_limit            NUMBER(2)      NOT NULL    CHECK(borrow_limit > 0),
    loan_period_limit       NUMBER(2)      NOT NULL    CHECK(loan_period_limit > 0),                                                                                                             
    membership_status       VARCHAR2(10)   NOT NULL    CHECK(membership_status IN ('ACTIVE', 'INACTIVE', 'EXPIRED')),
    effective_start_date    DATE           NOT NULL,
    effective_end_date      DATE           DEFAULT TO_DATE('9999-12-31','YYYY-MM-DD') NOT NULL, 
    is_current_flag         CHAR(1)        DEFAULT 'Y' NOT NULL CHECK(is_current_flag IN ('Y', 'N')),
    CONSTRAINT dim_member_pk PRIMARY KEY (member_surrogate_key),
    CONSTRAINT dim_member_fk FOREIGN KEY (member_id) REFERENCES member (member_id)
);

CREATE TABLE dim_date (
    date_key               NUMBER          NOT NULL,
    cal_date               DATE            NOT NULL,
    full_desc              VARCHAR2(30)    NOT NULL,
    day_week               NUMBER(1)       NOT NULL,
    day_num_month          NUMBER(2)       NOT NULL,
    day_num_year           NUMBER(3)       NOT NULL,
    last_day_ind           CHAR(1)         NOT NULL,
    cal_week_end_date      DATE            NOT NULL,
    cal_week_year          NUMBER(2)       NOT NULL,
    cal_month_name         VARCHAR2(9)     NOT NULL,
    cal_month_year         NUMBER(2)       NOT NULL,
    cal_year_month         CHAR(7)         NOT NULL,
    cal_quarter            CHAR(2)         NOT NULL,
    cal_year_quarter       CHAR(7)         NOT NULL,
    cal_year               NUMBER(4)       NOT NULL,
    holiday_ind            CHAR(1)         NOT NULL,
    weekend_ind            CHAR(1)         NOT NULL,
    festive_event          VARCHAR2(22)    NOT NULL,
    CONSTRAINT dim_date_pk PRIMARY KEY (date_key)
);

CREATE TABLE dim_facility (
    facility_key           NUMBER          NOT NULL,
    facility_id            VARCHAR2(7)     NOT NULL,
    facility_name          VARCHAR2(50)    NOT NULL,
    facility_type          VARCHAR2(18)    NOT NULL,
    capacity               NUMBER(2)       NOT NULL     CHECK(capacity > 0),
    resources_available    VARCHAR2(40)    NOT NULL,
    floor_number           NUMBER(1)       NOT NULL     CHECK(floor_number BETWEEN 1 AND 3),
    room_number            VARCHAR2(5)     NOT NULL,
    effective_start_date   DATE            NOT NULL,
    effective_end_date     DATE            DEFAULT TO_DATE('9999-12-31','YYYY-MM-DD') NOT NULL,
    is_current_flag        CHAR(1)         DEFAULT 'Y' NOT NULL CHECK(is_current_flag IN ('Y', 'N')),
    CONSTRAINT dim_facility_id_pk PRIMARY KEY (facility_key),
    CONSTRAINT dim_facility_id_fk FOREIGN KEY (facility_id) REFERENCES facility (facility_id)
);

CREATE TABLE dim_book (
    book_key               NUMBER          NOT NULL,
    book_id                VARCHAR2(10)    NOT NULL,
    title                  VARCHAR2(40)    NOT NULL,
    author                 VARCHAR2(30)    NOT NULL,
    publisher              VARCHAR2(38)    NOT NULL,
    genre_name             VARCHAR2(20)    NOT NULL,
    language               VARCHAR2(13)    NOT NULL,
    page_number            NUMBER(3)       NOT NULL    CHECK(page_number > 49),
    total_copies           NUMBER(2)       NOT NULL    CHECK(total_copies > 0),
    borrowing_copies       NUMBER(2)       NOT NULL    CHECK(borrowing_copies >= 0),
    damaged_copies         NUMBER(2)       NOT NULL    CHECK(damaged_copies >= 0),
    lost_copies            NUMBER(2)       NOT NULL    CHECK(lost_copies >= 0),
    reserved_copies        NUMBER(2)       NOT NULL    CHECK(reserved_copies >= 0),
    popularity_scores      NUMBER(2,1)     NOT NULL    CHECK(popularity_scores > 0),
    effective_start_date   DATE            NOT NULL,
    effective_end_date     DATE            DEFAULT TO_DATE('9999-12-31','YYYY-MM-DD') NOT NULL,   
    is_current_flag        CHAR(1)         DEFAULT 'Y' NOT NULL CHECK(is_current_flag IN ('Y', 'N')),
    CONSTRAINT dim_book_pk PRIMARY KEY (book_key),
    CONSTRAINT dim_book_fk FOREIGN KEY (book_id) REFERENCES books (book_id)
);

-- Fact Tables

CREATE TABLE fact_fines (
    member_surrogate_key    NUMBER        NOT NULL,
    fine_date_key           NUMBER        NOT NULL,
    fine_id                 VARCHAR2(10)  NOT NULL,
    fine_amount             NUMBER(6,2)   NOT NULL    CHECK(fine_amount > 0),
    payment_status          VARCHAR2(18)  NOT NULL    CHECK(payment_status IN ('PAID', 'UNPAID')),
    fine_type               VARCHAR2(12)  NOT NULL    CHECK(fine_type IN ('LATE_RETURN', 'LOST_BOOK', 'DAMAGED')),
    CONSTRAINT fact_fines_pk PRIMARY KEY (member_surrogate_key, fine_date_key, fine_id),
    CONSTRAINT fact_fines_member_fk FOREIGN KEY (member_surrogate_key) REFERENCES dim_member (member_surrogate_key),
    CONSTRAINT fact_fines_date_fk FOREIGN KEY (fine_date_key) REFERENCES dim_date (date_key),
    CONSTRAINT fact_fines_fk FOREIGN KEY (fine_id) REFERENCES fines (fine_id)
);

CREATE TABLE fact_facility_booking (
    facility_key          NUMBER          NOT NULL,
    member_surrogate_key  NUMBER          NOT NULL,
    booking_date_key      NUMBER          NOT NULL,
    facility_booking_id   VARCHAR2(10)    NOT NULL,
    fee                   NUMBER(2)       NOT NULL   CHECK(fee > 0),
    CONSTRAINT fact_fbooking_pk PRIMARY KEY (facility_key, member_surrogate_key, booking_date_key, facility_booking_id),
    CONSTRAINT fact_fbooking_facility_pk FOREIGN KEY (facility_key) REFERENCES dim_facility(facility_key),
    CONSTRAINT fact_fbooking_member_pk FOREIGN KEY (member_surrogate_key) REFERENCES dim_member(member_surrogate_key),
    CONSTRAINT fact_fbooking_date_pk FOREIGN KEY (booking_date_key) REFERENCES dim_date(date_key),
    CONSTRAINT fact_fbooking_fk FOREIGN KEY (facility_booking_id) REFERENCES facility_booking (facility_booking_id)
);

CREATE TABLE fact_book_sale (
    book_key               NUMBER        NOT NULL,
    member_surrogate_key   NUMBER        NOT NULL,
    sale_date_key          NUMBER        NOT NULL,
    sales_id               VARCHAR2(7)   NOT NULL,
    unitprice              NUMBER(4,1)   NOT NULL,
    QuantitySold           NUMBER(1)     NOT NULL    CHECK(QuantitySold > 0),
    discount_percentage    NUMBER(3)     NOT NULL    CHECK(discount_percentage > 0),  
    TotalAmount            NUMBER(5,2)   NOT NULL    CHECK(TotalAmount > 0),
    CONSTRAINT fact_sale_pk PRIMARY KEY (book_key, member_surrogate_key, sale_date_key, sales_id),
    CONSTRAINT fact_sale_book_fk FOREIGN KEY (book_key) REFERENCES dim_book (book_key),
    CONSTRAINT fact_sale_member_fk FOREIGN KEY (member_surrogate_key) REFERENCES dim_member (member_surrogate_key),
    CONSTRAINT fact_sale_date_fk FOREIGN KEY (sale_date_key) REFERENCES dim_date (date_key),
    CONSTRAINT fact_sale_fk FOREIGN KEY (sales_id) REFERENCES book_sales (sales_id)
);

CREATE TABLE fact_borrowing (
    member_surrogate_key    NUMBER        NOT NULL,
    book_key                NUMBER        NOT NULL,
    borrow_date_key         NUMBER        NOT NULL,
    original_due_date_key   NUMBER        NOT NULL,
    new_due_date_key        NUMBER,
    return_date_key         NUMBER,
    reserved_date_key       NUMBER,
    borrowing_id            VARCHAR2(8)   NOT NULL,
    is_returned             CHAR(1)       NOT NULL     CHECK(is_returned IN ('Y', 'N')),
    is_overdue              CHAR(1)       NOT NULL     CHECK(is_overdue IN ('Y', 'N')),
    is_extended             CHAR(1)       NOT NULL     CHECK(is_extended IN ('Y', 'N')),
    was_reserved            CHAR(1)       NOT NULL     CHECK(was_reserved IN ('Y', 'N')),
    days_overdue            NUMBER        NOT NULL     CHECK(days_overdue >= 0),
    CONSTRAINT fact_borrowing_pk PRIMARY KEY (member_surrogate_key, book_key, borrow_date_key, borrowing_id),
    CONSTRAINT fact_borrowing_member_fk FOREIGN KEY (member_surrogate_key) REFERENCES dim_member (member_surrogate_key),
    CONSTRAINT fact_borrowing_book_fk FOREIGN KEY (book_key) REFERENCES dim_book (book_key),
    CONSTRAINT fact_borrowing_date_fk FOREIGN KEY (borrow_date_key) REFERENCES dim_date (date_key),
    CONSTRAINT fact_borrowing_originaldue_fk FOREIGN KEY (original_due_date_key) REFERENCES dim_date (date_key),
    CONSTRAINT fact_borrowing_newdue_fk FOREIGN KEY (new_due_date_key) REFERENCES dim_date (date_key),
    CONSTRAINT fact_borrowing_return_fk FOREIGN KEY (return_date_key) REFERENCES dim_date (date_key),
    CONSTRAINT fact_borrowing_reserved_fk FOREIGN KEY (reserved_date_key) REFERENCES dim_date (date_key),
    CONSTRAINT fact_borrowing_fk FOREIGN KEY (borrowing_id) REFERENCES borrowing_returning (borrowing_id)
);