🎓 MySQL-Project2: Online Course Enrollment System
---------------------------------------------------
This SQL project sets up and queries an online course enrollment system. It demonstrates how to manage relationships between students, courses, and their enrollments using SQL.

✅ Key Components
-----------------
🔧 Schema Creation - 
Database: OnlineCourseEnrollment,
Tables:
Students:
Stores basic details about students like name, email, and join date.
Courses:
Contains information about courses including course name, instructor, and credit value.
Enrollments:
Acts as a linking table that connects students and courses. It also records enrollment date and grade achieved

🗂️ Data Insertion
------------------
Prepopulated sample records for:
---------------------------
Students: 3 sample students,
Courses: 3 different courses,
Enrollments: 4 enrollments with assigned grades and dates,
Simulates a realistic online course registration system.

🔍 SQL Queries
---------------
Retrieval and filtering:
List students enrolled in a specific course,
Find students who haven’t enrolled in any course,
Get students who took courses with "Python" in the name.

Join operations:
----------------
Display student names with course and instructor,
Show instructors with the most enrollments.

Grouping and aggregation:
-------------------------
Count students enrolled each month.
Count passed courses per student.

Nested queries:
--------------
Courses with enrollments above average,
Students who got an 'A' in all their courses,
Students enrolled in more than one course by the same instructor.

