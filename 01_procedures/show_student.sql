CREATE OR REPLACE PROCEDURE show_student (
    p_student_id IN students.student_id%TYPE
)
IS
    -- Record based on the STUDENTS table
    v_student students%ROWTYPE;

BEGIN
    -- Find student by ID
    SELECT *
    INTO v_student
    FROM students
    WHERE student_id = p_student_id;

    -- Display student information
    DBMS_OUTPUT.PUT_LINE('STUDENT INFORMATION');
    DBMS_OUTPUT.PUT_LINE('-------------------');
    DBMS_OUTPUT.PUT_LINE('Student ID: ' || v_student.student_id);
    DBMS_OUTPUT.PUT_LINE('Full Name: ' || v_student.full_name);
    DBMS_OUTPUT.PUT_LINE('Email: ' || v_student.email);
    DBMS_OUTPUT.PUT_LINE('Gender: ' || v_student.gender);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Student not found.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Error: More than one student found.');

    WHEN OTHERS THEN
        RAISE;
END;
/