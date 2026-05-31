CREATE OR REPLACE PROCEDURE prod_update_facility_dim (
    v_facility_id        IN VARCHAR2,
    v_new_name           IN VARCHAR2,
    v_new_type           IN VARCHAR2,
    v_new_capacity       IN NUMBER,
    v_new_resources      IN VARCHAR2,
    v_new_floor_number   IN NUMBER,
    v_new_room_number    IN VARCHAR2
)
IS
    v_current     dim_facility%ROWTYPE;
BEGIN
    BEGIN
        SELECT * INTO v_current
        FROM dim_facility
        WHERE facility_id = v_facility_id AND is_current_flag = 'Y' ;

        -- Compare each field
        IF v_current.facility_name != UPPER(TRIM(v_new_name)) OR
           v_current.facility_type != UPPER(TRIM(v_new_type)) OR
           v_current.capacity != v_new_capacity OR
           v_current.resources_available != NVL(v_new_resources, 'NONE') OR
           v_current.floor_number != v_new_floor_number OR
           v_current.room_number != v_new_room_number
        THEN
            UPDATE dim_facility
            SET effective_end_date = SYSDATE,
                is_current_flag    = 'N'
            WHERE facility_id = v_facility_id AND is_current_flag = 'Y';

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
            ) VALUES (
                dim_facility_seq.NEXTVAL,
                v_facility_id,
                UPPER(TRIM(v_new_name)),
                UPPER(TRIM(v_new_type)),
                v_new_capacity,
                NVL(v_new_resources, 'NONE'),
                v_new_floor_number,
                v_new_room_number,
                SYSDATE,
                DATE '9999-12-31',
                'Y'
            );

            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Facility updated successfully.');
        END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- No record found: insert as new
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
            ) VALUES (
                dim_facility_seq.NEXTVAL,
                v_facility_id,
                UPPER(TRIM(v_new_name)),
                UPPER(TRIM(v_new_type)),
                v_new_capacity,
                NVL(v_new_resources, 'NONE'),
                v_new_floor_number,
                v_new_room_number,
                SYSDATE,
                DATE '9999-12-31',
                'Y'
            );

            COMMIT;
            DBMS_OUTPUT.PUT_LINE('New facility inserted and no previous record found.');
    END;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END prod_update_facility_dim;
/

EXEC prod_update_facility_dim('FC040', 'Reading Room', 'Study Room', 1, NULL, 1, 'A1');