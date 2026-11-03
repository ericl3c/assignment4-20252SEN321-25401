SET SERVEROUTPUT ON;

DECLARE
    -- Define a user-defined record
    TYPE t_student_record IS RECORD (
        student_id students.student_id%TYPE,
        full_name students.full_name%TYPE,
        email students.email%TYPE,
        gender students.gender%TYPE
    );

    -- Define an associative array of student records
    TYPE t_student_collection IS TABLE OF t_student_record
    INDEX BY PLS_INTEGER;

    v_students t_student_collection;
    v_index PLS_INTEGER := 0;

BEGIN
    -- Retrieve all students into the collection
    FOR s IN (
        SELECT student_id, full_name, email, gender
        FROM students
        ORDER BY student_id
    )
    LOOP
        v_index := v_index + 1;

        v_students(v_index).student_id := s.student_id;
        v_students(v_index).full_name := s.full_name;
        v_students(v_index).email := s.email;
        v_students(v_index).gender := s.gender;
    END LOOP;

    -- Display students from the collection
    DBMS_OUTPUT.PUT_LINE('STUDENT COLLECTION');
    DBMS_OUTPUT.PUT_LINE('------------------');

    FOR i IN 1..v_students.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_students(i).student_id ||
            ' | Name: ' || v_students(i).full_name ||
            ' | Email: ' || v_students(i).email ||
            ' | Gender: ' || v_students(i).gender
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total students: ' || v_students.COUNT);
END;
/