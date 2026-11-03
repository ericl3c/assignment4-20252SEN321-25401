SET SERVEROUTPUT ON;

DECLARE
    -- Declare an explicit cursor
    CURSOR student_cursor IS
        SELECT student_id, full_name, email, gender
        FROM students
        ORDER BY student_id;

    -- Declare a record to hold each fetched row
    v_student student_cursor%ROWTYPE;

    v_count NUMBER := 0;

BEGIN
    -- Open the cursor
    OPEN student_cursor;

    DBMS_OUTPUT.PUT_LINE('STUDENT DETAILS USING EXPLICIT CURSOR');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------');

    LOOP
        -- Fetch one student
        FETCH student_cursor INTO v_student;

        -- Stop when there are no more records
        EXIT WHEN student_cursor%NOTFOUND;

        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_student.student_id ||
            ' | Name: ' || v_student.full_name ||
            ' | Email: ' || v_student.email ||
            ' | Gender: ' || v_student.gender
        );
    END LOOP;

    -- Close the cursor
    CLOSE student_cursor;

    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    DBMS_OUTPUT.PUT_LINE('Total students: ' || v_count);

END;
/