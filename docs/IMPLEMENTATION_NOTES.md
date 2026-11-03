# IMPLEMENTATION NOTES

## 1. Project Title
**Student Registration and Grading Management System**

## 2. Introduction
This project demonstrates the use of advanced Oracle PL/SQL programming concepts in a student registration and grading management system. It manages student information, courses, enrollments, and student grades.

## 3. Database Design
The system uses three main tables:

- **STUDENTS:** Stores student information, including student ID, full name, email, and gender.
- **COURSES:** Stores course information, including course ID, course name, and credits.
- **ENROLLMENTS:** Stores student enrollment information, course registration, and marks.

Primary keys and foreign keys maintain data integrity between the tables.

## 4. PL/SQL Concepts Implemented

### 4.1 Records and Collections
A user-defined record and associative array are used to store and display multiple student records.

### 4.2 Implicit Cursors
Implicit cursor attributes demonstrate the results of INSERT, UPDATE, and DELETE statements using:
- SQL%ROWCOUNT
- SQL%FOUND
- SQL%NOTFOUND

### 4.3 Explicit Cursors
An explicit cursor retrieves student records using OPEN, FETCH, and CLOSE.

### 4.4 BULK COLLECT and FORALL
BULK COLLECT retrieves multiple enrollment IDs into a collection. FORALL performs updates for multiple records efficiently.

### 4.5 Stored Procedures
The project contains procedures for displaying student information and retrieving enrollment results. The enrollment result procedure uses IN and OUT parameters.

### 4.6 Functions
The `get_student_grade` function calculates a student's grade based on marks.

### 4.7 Exception Handling
The project handles errors such as:
- NO_DATA_FOUND
- TOO_MANY_ROWS
- Invalid enrollment IDs using RAISE_APPLICATION_ERROR

## 5. Testing
Two test scripts are provided:

- `test_success_cases.sql`: Tests successful execution of procedures, functions, cursors, and collections.
- `test_error_cases.sql`: Tests invalid student and enrollment IDs and displays expected errors.

## 6. Performance
BULK COLLECT and FORALL reduce repeated SQL-to-PL/SQL context switching when processing multiple records. This can improve performance compared with processing records individually.

## 7. Conclusion
The project demonstrates practical application of Oracle PL/SQL concepts in a student registration and grading system. It includes database relationships, records, collections, cursors, bulk processing, procedures, functions, and exception handling.