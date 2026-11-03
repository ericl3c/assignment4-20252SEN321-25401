SET SERVEROUTPUT ON;

PROMPT =====================================
PROMPT STUDENT REGISTRATION SYSTEM
PROMPT ERROR TEST CASES
PROMPT =====================================

-- TEST 1: Student does not exist
PROMPT TEST 1: STUDENT NOT FOUND

EXEC show_student(999);

-- TEST 2: Enrollment does not exist in grade function
PROMPT TEST 2: INVALID ENROLLMENT ID IN FUNCTION

DECLARE
    v_grade VARCHAR2(10);
BEGIN
    v_grade := get_student_grade(9999);

    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Expected error: ' || SQLERRM);
END;
/

-- TEST 3: Enrollment does not exist in procedure
PROMPT TEST 3: INVALID ENROLLMENT ID IN PROCEDURE

DECLARE
    v_name VARCHAR2(100);
    v_grade VARCHAR2(10);
BEGIN
    get_enrollment_result(9999, v_name, v_grade);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Expected error: ' || SQLERRM);
END;
/

PROMPT =====================================
PROMPT ALL ERROR TESTS COMPLETED
PROMPT =====================================