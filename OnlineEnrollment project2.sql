Create Database OnlineCourseEnrollment;
Use OnlineCourseEnrollment;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    join_date DATE
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor VARCHAR(100),
    credits INT
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrolled_on DATE,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students (student_id, name, email, join_date)
VALUES
(1, 'Alice', 'alice@example.com', '2024-01-01'),
(2, 'Bob', 'bob@example.com', '2024-02-01'),
(3, 'Charlie', 'charlie@example.com', '2024-03-01');

iNSERT INTO Courses (course_id, course_name, instructor, credits)
VALUES
(1, 'Data Science 101', 'Dr. Smith', 3),
(2, 'Python Programming', 'Dr. Johnson', 4),
(3, 'Data Structures', 'Dr. Williams', 3);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrolled_on, grade)
VALUES
(1, 1, 1, '2024-01-15', 'A'),
(2, 1, 2, '2024-02-01', 'B'),
(3, 2, 1, '2024-02-15', 'C'),
(4, 3, 3, '2024-03-01', 'A');

#1. List all students who enrolled in the course "Data Science 101".
SELECT S.name FROM Students S JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
WHERE C.course_name = 'Data Science 101';

#Find courses that have more enrollments than the average enrollment across all courses.
SELECT C.course_name, COUNT(E.enrollment_id) AS num_enrollments
FROM Courses C JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name HAVING COUNT(E.enrollment_id) > (SELECT AVG(num_enrollments) 
FROM (SELECT course_id, COUNT(enrollment_id) AS num_enrollments 
FROM Enrollments GROUP BY course_id) AS subquery);

#List the names of students who have not enrolled in any course.
SELECT S.name FROM Students S LEFT JOIN Enrollments E ON S.student_id = E.student_id
WHERE E.enrollment_id IS NULL;

#Find the instructor who teaches the course with the most enrollments.
SELECT C.instructor, COUNT(E.enrollment_id) AS num_enrollments
FROM Courses C JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.instructor ORDER BY num_enrollments DESC LIMIT 1;

#For each student, display their name and the number of courses they’ve passed (grade A, B, or C).
SELECT S.name, COUNT(E.enrollment_id) AS num_passed_courses
FROM Students S JOIN Enrollments E ON S.student_id = E.student_id
WHERE E.grade IN ('A', 'B', 'C') GROUP BY S.name;

#Find students who have taken a course with 'Python' in its name.
SELECT S.name FROM Students S JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id WHERE C.course_name LIKE '%Python%';

#Write a query to count how many students enrolled each month in 2024.
SELECT MONTH(E.enrolled_on) AS month, COUNT(DISTINCT E.student_id) AS num_enrollments
FROM Enrollments E WHERE YEAR(E.enrolled_on) = 2024
GROUP BY MONTH(E.enrolled_on);

#Find students who got an 'A' in all their courses.
SELECT S.name FROM Students S JOIN Enrollments E ON S.student_id = E.student_id
GROUP BY S.name HAVING MIN(E.grade) = 'A' AND MAX(E.grade) = 'A';

#Display the names of students along with the courses they are enrolled in and the instructor for each course.
SELECT S.name AS student_name, C.course_name, C.instructor
FROM Students S JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id;

#List students who are enrolled in more than one course taught by the same instructor.
SELECT S.name, C.instructor, COUNT(DISTINCT C.course_id) AS num_courses
FROM Students S JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id GROUP BY S.name, C.instructor
HAVING COUNT(DISTINCT C.course_id) > 1;


