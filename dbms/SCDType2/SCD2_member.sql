CREATE OR REPLACE PROCEDURE prod_update_member_dim (
    v_member_id           IN VARCHAR2,
    v_name                IN VARCHAR2,
    v_city                IN VARCHAR2,
    v_state               IN VARCHAR2,
    v_postcode            IN VARCHAR2,
    v_date_of_birth       IN DATE,
    v_registration_date   IN DATE,
    v_member_type_name    IN VARCHAR2,
    v_borrow_limit        IN NUMBER,
    v_loan_period_limit   IN NUMBER,
    v_membership_status   IN VARCHAR2,
    v_validity_start      IN DATE,
    v_validity_end        IN DATE
)
IS
    v_current dim_member%ROWTYPE;
BEGIN
    BEGIN
        SELECT * INTO v_current
        FROM dim_member
        WHERE member_id = v_member_id AND is_current_flag = 'Y';

        -- Compare fields
        IF v_current.name != UPPER(TRIM(v_name)) OR
           v_current.city != UPPER(TRIM(v_city)) OR
           v_current.state != UPPER(TRIM(v_state)) OR
           v_current.postcode != v_postcode OR
           v_current.date_of_birth != v_date_of_birth OR
           v_current.registration_date != v_registration_date OR
           v_current.member_type_name != UPPER(TRIM(v_member_type_name)) OR
           v_current.borrow_limit != v_borrow_limit OR
           v_current.loan_period_limit != v_loan_period_limit OR
           v_current.membership_status != UPPER(TRIM(v_membership_status)) OR
           v_current.effective_start_date != v_validity_start OR
           v_current.effective_end_date != NVL(v_validity_end, DATE '9999-12-31')
        THEN
            UPDATE dim_member
            SET effective_end_date = SYSDATE,
                is_current_flag    = 'N'
            WHERE member_surrogate_key = v_current.member_surrogate_key AND is_current_flag = 'Y';

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
            ) VALUES (
                dim_member_seq.NEXTVAL,
                v_member_id,
                UPPER(TRIM(v_name)),
                UPPER(TRIM(v_city)),
                UPPER(TRIM(v_state)),
                v_postcode,
                v_date_of_birth,
                v_registration_date,
                UPPER(TRIM(v_member_type_name)),
                v_borrow_limit,
                v_loan_period_limit,
                UPPER(TRIM(v_membership_status)),
                SYSDATE,
                NVL(v_validity_end, DATE '9999-12-31'),
                'Y'
            );

            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Member updated successfully.');
        END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
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
            ) VALUES (
                dim_member_seq.NEXTVAL,
                v_member_id,
                UPPER(TRIM(v_name)),
                UPPER(TRIM(v_city)),
                UPPER(TRIM(v_state)),
                v_postcode,
                v_date_of_birth,
                v_registration_date,
                UPPER(TRIM(v_member_type_name)),
                v_borrow_limit,
                v_loan_period_limit,
                UPPER(TRIM(v_membership_status)),
                SYSDATE,
                NVL(v_validity_end, DATE '9999-12-31'),
                'Y'
            );

            COMMIT;
            DBMS_OUTPUT.PUT_LINE('New member inserted and no previous record found.');
    END;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END prod_update_member_dim;
/

EXEC prod_update_member_dim('M3000', 'Louis Lo', 'Batu Pahat', 'Johor', 83000, TO_DATE('1999-01-02','YYYY-MM-DD'), TO_DATE('2025-09-07','YYYY-MM-DD'), 'STANDARD', 2, 3, 'Active', TO_DATE('2025-09-08','YYYY-MM-DD'), TO_DATE('2026-09-08','YYYY-MM-DD'));