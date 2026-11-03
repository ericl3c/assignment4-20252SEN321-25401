SET ECHO ON;
SET SERVEROUTPUT ON;

-- Insert students
INSERT INTO students VALUES
(1, 'Shema Eric', 'eric@gmail.com', 'Male');

INSERT INTO students VALUES
(2, 'Justin N', 'justin@gmail.com', 'Male');

INSERT INTO students VALUES
(3, 'Ines M', 'ines@gmail.com', 'Female');

-- Insert courses
INSERT INTO courses VALUES
(101, 'Database Development', 4);

INSERT INTO courses VALUES
(102, 'Software Engineering', 4);

-- Insert enrollments
INSERT INTO enrollments VALUES
(1001, 1, 101, 85);

INSERT INTO enrollments VALUES
(1002, 2, 101, 75);

INSERT INTO enrollments VALUES
(1003, 3, 102, 90);

COMMIT;

PROMPT Sample data inserted successfully!