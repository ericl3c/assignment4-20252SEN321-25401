SET SERVEROUTPUT ON;
SET LINESIZE 180;
SET PAGESIZE 50;

PROMPT =====================================
PROMPT STUDENT REGISTRATION SYSTEM
PROMPT SUCCESS TEST CASES
PROMPT =====================================

-- TEST 1: Show student information
PROMPT TEST 1: SHOW STUDENT

EXEC show_student(1);

-- TEST 2: Test student records and collections
PROMPT TEST 2: RECORDS AND COLLECTIONS

@D:\assignment4\01_procedures\student_records_collections.sql

-- TEST 3: Test implicit cursors
PROMPT TEST 3: IMPLICIT CURSORS

@D:\assignment4\01_procedures\implicit_cursors.sql

-- TEST 4: Test explicit cursors
PROMPT TEST 4: EXPLICIT CURSORS

@D:\assignment4\01_procedures\explicit_cursors.sql

-- TEST 5: Test BULK COLLECT and FORALL
PROMPT TEST 5: BULK COLLECT AND FORALL

@D:\assignment4\01_procedures\bulk_collect_forall.sql

-- TEST 6: Test grade function
PROMPT TEST 6: GRADE FUNCTION

SELECT
    enrollment_id,
    get_student_grade(enrollment_id) AS grade
FROM enrollments
ORDER BY enrollment_id;

-- TEST 7: Test procedure with IN and OUT parameters
PROMPT TEST 7: ENROLLMENT RESULT PROCEDURE

DECLARE
    v_name students.full_name%TYPE;
    v_grade VARCHAR2(10);
BEGIN
    get_enrollment_result(1001, v_name, v_grade);

    DBMS_OUTPUT.PUT_LINE('Student: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);
END;
/

PROMPT =====================================
PROMPT ALL SUCCESS TESTS COMPLETED
PROMPT =====================================