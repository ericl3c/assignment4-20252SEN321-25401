# Student Registration and Grading Management System

## 1. Project Overview

This project is developed for Assignment IV of Advanced Oracle PL/SQL Programming.

The Student Registration and Grading Management System manages student information, course information, enrollments, and student grades using Oracle Database and PL/SQL.

## 2. Technologies Used

- Oracle Database
- PL/SQL
- SQL*Plus
- Git and GitHub

## 3. Database Tables

The project contains three main tables:

| Table | Description |
|---|---|
| STUDENTS | Stores student information |
| COURSES | Stores course information |
| ENROLLMENTS | Stores student course registrations and marks |

## 4. PL/SQL Concepts Implemented

- User-defined PL/SQL records
- `%ROWTYPE` and `%TYPE`
- Associative arrays and collections
- Implicit cursors
- Explicit cursors using OPEN, FETCH, and CLOSE
- BULK COLLECT
- FORALL
- Stored procedures with IN and OUT parameters
- Stored functions
- Exception handling
- SQL%ROWCOUNT, SQL%FOUND, and SQL%NOTFOUND

## 5. Project Structure

```text
assignment4/
├── README.md
├── .gitignore
├── 00_schema/
│   ├── 01_create_tables.sql
│   └── 02_insert_sample_data.sql
├── 01_procedures/
│   ├── show_student.sql
│   ├── student_records_collections.sql
│   ├── implicit_cursors.sql
│   ├── explicit_cursors.sql
│   ├── bulk_collect_forall.sql
│   └── get_enrollment_result.sql
├── 02_functions/
│   └── get_student_grade.sql
├── 03_tests/
│   ├── test_success_cases.sql
│   └── test_error_cases.sql
├── screenshots/
└── docs/
    └── IMPLEMENTATION_NOTES.md
```

## 6. How to Run the Project

1. Connect to the Oracle database using SQL*Plus.
2. Execute the database creation script.
3. Execute the sample data script.
4. Execute all stored procedure scripts.
5. Execute the function script.
6. Execute the success test file.
7. Execute the error test file.

Example SQL*Plus commands:

```sql
@D:\assignment4\00_schema\01_create_tables.sql
@D:\assignment4\00_schema\02_insert_sample_data.sql

@D:\assignment4\01_procedures\show_student.sql
@D:\assignment4\01_procedures\get_enrollment_result.sql
@D:\assignment4\02_functions\get_student_grade.sql

@D:\assignment4\03_tests\test_success_cases.sql
@D:\assignment4\03_tests\test_error_cases.sql
```

Run the remaining procedure scripts before executing the test files.

## 7. Testing

The project includes successful test cases and error test cases.

The tests demonstrate student retrieval, grade calculation, cursor processing, bulk operations, and exception handling.

## 8. Group Members

| No. | Full Name | Student ID | Class Group |
|---|---|---|---|
| 1 | Shema Eric | 20252SEN321 | B |
| 2 | Fumba Hariro | 25401 | B |

## 9. Conclusion

This project demonstrates the practical application of Oracle PL/SQL programming concepts in a Student Registration and Grading Management System.

## 10. AI Tools and Assistance

AI tools, including ChatGPT, were used as supporting resources during the development of this project.

AI assistance was used for:
- Understanding Oracle PL/SQL concepts.
- Explaining records, collections, cursors, BULK COLLECT, and FORALL.
- Supporting SQL and PL/SQL code development.
- Identifying and troubleshooting programming errors.
- Improving project documentation and organization.

The group members reviewed, tested, and worked with the project implementation to understand its functionality.