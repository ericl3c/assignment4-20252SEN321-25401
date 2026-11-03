
SET ECHO ON;
SET FEEDBACK ON;

PROMPT Creating STUDENTS table...

CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE,
    gender VARCHAR2(10)
);

PROMPT Creating COURSES table...

CREATE TABLE courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(100) NOT NULL,
    credits NUMBER(2) NOT NULL
);

PROMPT Creating ENROLLMENTS table...

CREATE TABLE enrollments (
    enrollment_id NUMBER PRIMARY KEY,
    student_id NUMBER NOT NULL,
    course_id NUMBER NOT NULL,
    marks NUMBER(5,2),

    CONSTRAINT fk_enroll_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT fk_enroll_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id),

    CONSTRAINT chk_marks
        CHECK (marks BETWEEN 0 AND 100)
);

PROMPT All tables created successfully!
