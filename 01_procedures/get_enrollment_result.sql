CREATE OR REPLACE PROCEDURE get_enrollment_result (
    p_enrollment_id IN enrollments.enrollment_id%TYPE,
    p_student_name OUT students.full_name%TYPE,
    p_grade OUT VARCHAR2
)
IS
BEGIN
    -- Retrieve the student's name
    SELECT s.full_name
    INTO p_student_name
    FROM students s
    JOIN enrollments e
        ON s.student_id = e.student_id
    WHERE e.enrollment_id = p_enrollment_id;

    -- Calculate the student's grade using our function
    p_grade := get_student_grade(p_enrollment_id);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Enrollment or student record not found.'
        );
END;
/