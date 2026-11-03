SET SERVEROUTPUT ON;

SAVEPOINT bulk_demo_start;

DECLARE
    -- Define a collection of enrollment IDs
    TYPE t_enrollment_ids IS TABLE OF
        enrollments.enrollment_id%TYPE
        INDEX BY PLS_INTEGER;

    v_ids t_enrollment_ids;

BEGIN
    -- BULK COLLECT: Retrieve all enrollment IDs at once
    SELECT enrollment_id
    BULK COLLECT INTO v_ids
    FROM enrollments
    ORDER BY enrollment_id;

    DBMS_OUTPUT.PUT_LINE('BULK COLLECT RESULTS');
    DBMS_OUTPUT.PUT_LINE('--------------------');
    DBMS_OUTPUT.PUT_LINE(
        'Total records retrieved: ' || v_ids.COUNT
    );

    -- FORALL: Update multiple records in one batch
    FORALL i IN 1..v_ids.COUNT
        UPDATE enrollments
        SET marks = marks + 1
        WHERE enrollment_id = v_ids(i);

    DBMS_OUTPUT.PUT_LINE('FORALL RESULTS');
    DBMS_OUTPUT.PUT_LINE('--------------');
    DBMS_OUTPUT.PUT_LINE(
        'Total rows updated: ' || SQL%ROWCOUNT
    );

END;
/

-- Restore original marks after demonstration
ROLLBACK TO bulk_demo_start;

PROMPT Bulk processing demonstration completed.