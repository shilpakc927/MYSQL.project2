# 📘 Online Course Enrollment Database Project

This project models an **Online Course Enrollment System** using SQL. It simulates how students enroll in different courses, their grades, and course-related data. It helps understand fundamental database design, relational integrity, and SQL querying through a real-world scenario.

---

## 🛠️ Technologies Used

- **Database**: MySQL
- **Language**: SQL
- **Concepts Covered**:
  - Database creation
  - Table relationships using foreign keys
  - Data manipulation using INSERT
  - Complex SQL queries (JOINs, GROUP BY, HAVING, Subqueries)

---

## 🧱 Database Schema

### 1. `Students`
- `student_id`: Primary Key
- `name`: Student's full name
- `email`: Email address
- `join_date`: Enrollment date

### 2. `Courses`
- `course_id`: Primary Key
- `course_name`: Name of the course
- `instructor`: Instructor’s name
- `credits`: Number of credits assigned

### 3. `Enrollments`
- `enrollment_id`: Primary Key
- `student_id`: Foreign Key referencing `Students`
- `course_id`: Foreign Key referencing `Courses`
- `enrolled_on`: Date of course enrollment
- `grade`: Grade achieved in the course (A, B, C, etc.)

---

## 📊 Project Outcomes

- Understand how to model **many-to-many** relationships in SQL using a junction table (`Enrollments`).
- Analyze student performance based on their grades.
- Identify course popularity based on enrollment trends.
- Retrieve instructor and student-wise insights.
- Filter data with JOINs and subqueries to generate useful reports.

---

## 🚀 How to Use

1. Clone this repository or download the SQL file.
2. Open a MySQL client (e.g., MySQL Workbench, phpMyAdmin, or command-line).
3. Execute the SQL script to create the database and tables.
4. Insert the provided sample data into the tables.
5. Run the SQL queries to analyze enrollments, course popularity, student performance, and more.

## 📁 Files Included
- `onlinecourse Enrollment.sql` – sql file with queries and raw data
  
---
> **Developed by**: [shilpa k c]  
> **LinkedIn**: [https://www.linkedin.com/in/shilpa-kc]  
> **Project Type**:  Academic



