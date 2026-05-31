CREATE OR REPLACE PROCEDURE prod_update_book_dim (
    v_book_id           IN VARCHAR2,
    v_title             IN VARCHAR2,
    v_author            IN VARCHAR2,
    v_publisher         IN VARCHAR2,
    v_genre_name        IN VARCHAR2,
    v_language          IN VARCHAR2,
    v_page_number       IN NUMBER,
    v_total_copies      IN NUMBER,
    v_borrowing_copies  IN NUMBER,
    v_damaged_copies    IN NUMBER,
    v_lost_copies       IN NUMBER,
    v_reserved_copies   IN NUMBER,
    v_popularity_scores IN NUMBER
)
IS
    v_current dim_book%ROWTYPE;
BEGIN
    BEGIN
        SELECT * INTO v_current
        FROM dim_book
        WHERE book_id = v_book_id AND is_current_flag = 'Y';

        -- Compare all fields
        IF v_current.title != UPPER(TRIM(v_title)) OR
           v_current.author != UPPER(TRIM(v_author)) OR
           v_current.publisher != UPPER(TRIM(v_publisher)) OR
           v_current.genre_name != UPPER(TRIM(v_genre_name)) OR
           v_current.language != UPPER(TRIM(v_language)) OR
           v_current.page_number != v_page_number OR
           v_current.total_copies != v_total_copies OR
           v_current.borrowing_copies != v_borrowing_copies OR
           v_current.damaged_copies != v_damaged_copies OR
           v_current.lost_copies != v_lost_copies OR
           v_current.reserved_copies != v_reserved_copies OR
           v_current.popularity_scores != v_popularity_scores
        THEN
            UPDATE dim_book
            SET effective_end_date = SYSDATE,
                is_current_flag = 'N'
            WHERE book_key = v_current.book_key AND is_current_flag = 'Y';

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
            ) VALUES (
                dim_book_seq.NEXTVAL,
                v_book_id,
                UPPER(TRIM(v_title)),
                UPPER(TRIM(v_author)),
                UPPER(TRIM(v_publisher)),
                UPPER(TRIM(v_genre_name)),
                UPPER(TRIM(v_language)),
                v_page_number,
                v_total_copies,
                v_borrowing_copies,
                v_damaged_copies,
                v_lost_copies,
                v_reserved_copies,
                v_popularity_scores,
                SYSDATE,
                DATE '9999-12-31',
                'Y'
            );

            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Book updated successfully.');
        END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
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
            ) VALUES (
                dim_book_seq.NEXTVAL,
                v_book_id,
                UPPER(TRIM(v_title)),
                UPPER(TRIM(v_author)),
                UPPER(TRIM(v_publisher)),
                UPPER(TRIM(v_genre_name)),
                UPPER(TRIM(v_language)),
                v_page_number,
                v_total_copies,
                v_borrowing_copies,
                v_damaged_copies,
                v_lost_copies,
                v_reserved_copies,
                v_popularity_scores,
                SYSDATE,
                DATE '9999-12-31',
                'Y'
            );

            COMMIT;
            DBMS_OUTPUT.PUT_LINE('New book inserted and no previous record found.');
    END;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END prod_update_book_dim;
/

EXEC prod_update_book_dim('B04999', 'The Art of Thinking Clearly', 'Nicole Smith', 'Hachette Book Group', 'Fiction', 'English', 220, 2, 0, 0, 0, 0, 9.5);