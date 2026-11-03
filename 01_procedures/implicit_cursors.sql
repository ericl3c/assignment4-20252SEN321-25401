SET SERVEROUTPUT ON;

SAVEPOINT demo_start;

DECLARE
    v_exists NUMBER;
BEGIN
    -- Check whether the demonstration ID already exists
    SELECT COUNT(*)
    INTO v_exists
    FROM enrollments
    WHERE enrollment_id = 9999999;

    IF v_exists = 0 THEN

        -- 1. INSERT operation
        INSERT INTO enrollments
        VALUES (9999999, 1, 101, 80);

        DBMS_OUTPUT.PUT_LINE('INSERT operation:');
        DBMS_OUTPUT.PUT_LINE('Rows affected: ' || SQL%ROWCOUNT);
        DBMS_OUTPUT.PUT_LINE('SQL%FOUND: ' ||
            CASE WHEN SQL%FOUND THEN 'TRUE' ELSE 'FALSE' END);

        -- 2. UPDATE operation
        UPDATE enrollments
        SET marks = marks + 5
        WHERE enrollment_id = 9999999;

        DBMS_OUTPUT.PUT_LINE('UPDATE operation:');
        DBMS_OUTPUT.PUT_LINE('Rows affected: ' || SQL%ROWCOUNT);

        -- 3. UPDATE with no matching record
        UPDATE enrollments
        SET marks = marks + 5
        WHERE enrollment_id = -1;

        DBMS_OUTPUT.PUT_LINE('UPDATE with no matching record:');
        DBMS_OUTPUT.PUT_LINE('SQL%ROWCOUNT: ' || SQL%ROWCOUNT);
        DBMS_OUTPUT.PUT_LINE('SQL%NOTFOUND: ' ||
            CASE WHEN SQL%NOTFOUND THEN 'TRUE' ELSE 'FALSE' END);

        -- 4. DELETE operation
        DELETE FROM enrollments
        WHERE enrollment_id = 9999999;

        DBMS_OUTPUT.PUT_LINE('DELETE operation:');
        DBMS_OUTPUT.PUT_LINE('Rows affected: ' || SQL%ROWCOUNT);

    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'Demo ID already exists. Choose another ID.'
        );
    END IF;
END;
/

ROLLBACK TO demo_start;

PROMPT Demonstration completed. Original data preserved.