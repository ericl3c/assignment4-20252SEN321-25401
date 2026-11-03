CREATE OR REPLACE FUNCTION get_student_grade (
    p_enrollment_id IN enrollments.enrollment_id%TYPE
)
RETURN VARCHAR2
IS
    v_marks enrollments.marks%TYPE;

BEGIN
    -- Retrieve student marks
    SELECT marks
    INTO v_marks
    FROM enrollments
    WHERE enrollment_id = p_enrollment_id;

    -- Calculate grade
    IF v_marks IS NULL THEN
        RETURN 'Not graded';
    ELSIF v_marks >= 80 THEN
        RETURN 'A';
    ELSIF v_marks >= 70 THEN
        RETURN 'B';
    ELSIF v_marks >= 60 THEN
        RETURN 'C';
    ELSIF v_marks >= 50 THEN
        RETURN 'D';
    ELSE
        RETURN 'F';
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Enrollment ID not found.'
        );
END;
/