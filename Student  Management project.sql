create database StudentManagement;
use studentManagement;



CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    age INT
);


CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    fees DECIMAL(10,2) NOT NULL
);


CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE,
    
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),
    
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);

CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    enrollment_id INT NOT NULL,
    subject_name VARCHAR(100) NOT NULL,
    marks_obtained INT,
    max_marks INT DEFAULT 100,
    
    FOREIGN KEY (enrollment_id)
        REFERENCES Enrollments(enrollment_id)
);
SHOW TABLES;

INSERT INTO Students
(student_id, first_name, last_name, email, city, age)
VALUES
(1, 'Aarav', 'Sharma', 'aarav@gmail.com', 'Nagpur', 21),
(2, 'Priya', 'Patil', 'priya@gmail.com', 'Pune', 22),
(3, 'Rahul', 'Verma', 'rahul@gmail.com', 'Nagpur', 20),
(4, 'Sneha', 'Joshi', 'sneha@gmail.com', 'Mumbai', 21),
(5, 'Amit', 'Deshmukh', 'amit@gmail.com', 'Pune', 23),
(6, 'Neha', 'Kulkarni', 'neha@gmail.com', 'Nagpur', 22),
(7, 'Rohan', 'Gupta', 'rohan@gmail.com', 'Nashik', 21),
(8, 'Pooja', 'More', 'pooja@gmail.com', 'Mumbai', 20),
(9, 'Vikas', 'Rao', 'vikas@gmail.com', 'Wardha', 22),
(10, 'Anjali', 'Shinde', 'anjali@gmail.com', 'Pune', 21),
(11, 'Karan', 'Singh', 'karan@gmail.com', 'Nagpur', 23),
(12, 'Meera', 'Pawar', 'meera@gmail.com', 'Nashik', 20),
(13, 'Sahil', 'Kale', 'sahil@gmail.com', 'Amravati', 22),
(14, 'Kavya', 'Nair', 'kavya@gmail.com', 'Mumbai', 21),
(15, 'Om', 'Thakur', 'om@gmail.com', 'Wardha', 20);

SELECT * FROM Students;

INSERT INTO Courses
(course_id, course_name, fees)
VALUES
(101, 'SQL', 3000.00),
(102, 'Java', 5000.00),
(103, 'Python', 4000.00),
(104, 'Web Development', 4500.00),
(105, 'Data Analytics', 6000.00);

SELECT * FROM Courses;

INSERT INTO Enrollments
(enrollment_id, student_id, course_id, enrollment_date)
VALUES
(1, 1, 101, '2026-01-10'),
(2, 2, 102, '2026-01-11'),
(3, 3, 101, '2026-01-12'),
(4, 4, 103, '2026-01-13'),
(5, 5, 104, '2026-01-14'),
(6, 6, 105, '2026-01-15'),
(7, 7, 102, '2026-01-16'),
(8, 8, 104, '2026-01-17'),
(9, 9, 103, '2026-01-18'),
(10, 10, 105, '2026-01-19'),
(11, 11, 101, '2026-01-20'),
(12, 12, 102, '2026-01-21'),
(13, 13, 103, '2026-01-22'),
(14, 14, 104, '2026-01-23'),
(15, 15, 105, '2026-01-24');

SELECT * FROM Enrollments;

INSERT INTO Marks
(mark_id, enrollment_id, subject_name, marks_obtained, max_marks)
VALUES
(1, 1, 'SQL Basics', 85, 100),
(2, 1, 'SQL Queries', 90, 100),
(3, 2, 'Java Basics', 78, 100),
(4, 2, 'OOP', 82, 100),
(5, 3, 'SQL Basics', 92, 100),
(6, 3, 'SQL Queries', 88, 100),
(7, 4, 'Python Basics', 75, 100),
(8, 4, 'Python Functions', 80, 100),
(9, 5, 'HTML', 88, 100),
(10, 5, 'CSS', 91, 100),
(11, 6, 'Excel', 80, 100),
(12, 6, 'Power BI', 86, 100),
(13, 7, 'Java Basics', 65, 100),
(14, 7, 'OOP', 72, 100),
(15, 8, 'HTML', 95, 100),
(16, 8, 'CSS', 93, 100),
(17, 9, 'Python Basics', 70, 100),
(18, 9, 'Python Functions', 74, 100),
(19, 10, 'Excel', 89, 100),
(20, 10, 'Power BI', 92, 100),
(21, 11, 'SQL Basics', 77, 100),
(22, 11, 'SQL Queries', 81, 100),
(23, 12, 'Java Basics', 84, 100),
(24, 12, 'OOP', 87, 100),
(25, 13, 'Python Basics', 79, 100),
(26, 13, 'Python Functions', 83, 100),
(27, 14, 'HTML', 86, 100),
(28, 14, 'CSS', 89, 100),
(29, 15, 'Excel', 73, 100),
(30, 15, 'Power BI', 78, 100);

SELECT * FROM Marks;
select*from studentmanagement;
show tables;

SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name,
    e.enrollment_date,
    m.subject_name,
    m.marks_obtained,
    m.max_marks
FROM Students s
JOIN Enrollments e
    ON s.student_id = e.student_id
JOIN Courses c
    ON e.course_id = c.course_id
JOIN Marks m
    ON e.enrollment_id = m.enrollment_id;
    
    	-- question --
        -- Basic--
--  1.  Display students who belong to Nagpur.
  SELECT *
FROM Students
WHERE city = 'Nagpur';

 -- 2. Find students whose age is between 20 and 22.
 SELECT *
FROM Students
WHERE age BETWEEN 20 AND 22;

-- 3. Display students from Pune, Mumbai, and Nagpur.
SELECT *
FROM Students
WHERE city IN ('Pune', 'Mumbai', 'Nagpur');

-- 4. Find students whose first name starts with 'A'.
SELECT *
FROM Students
WHERE first_name LIKE 'A%';

-- 5. Display all courses from highest fees to lowest fees.
SELECT *
FROM Courses
ORDER BY fees DESC;

-- 6. Display the first five students.
SELECT *
FROM Students
ORDER BY student_id
LIMIT 5;

-- Medium --
--  Aggregate Functions and Grouping --

-- 7. Count the total number of students.
SELECT COUNT(*) AS total_students
FROM Students;

-- 9. Find the average, highest, and lowest marks.
SELECT
    AVG(marks_obtained) AS average_marks,
    MAX(marks_obtained) AS highest_marks,
    MIN(marks_obtained) AS lowest_marks
FROM Marks;

-- 9. Count students in each city.
SELECT city, COUNT(*) AS total_students
FROM Students
GROUP BY city;

 -- 10. Display courses whose average marks are greater than 80.
 SELECT
    c.course_name,
    AVG(m.marks_obtained) AS average_marks
FROM Courses c
JOIN Enrollments e
    ON c.course_id = e.course_id
JOIN Marks m
    ON e.enrollment_id = m.enrollment_id
GROUP BY c.course_id, c.course_name
HAVING AVG(m.marks_obtained) > 80;

-- 11. Display student names with their enrolled course names.
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name
FROM Students s
JOIN Enrollments e
    ON s.student_id = e.student_id
JOIN Courses c
    ON e.course_id = c.course_id;
    
   -- 12. Display all students, including those who have not enrolled in a course.
   SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name
FROM Students s
LEFT JOIN Enrollments e
    ON s.student_id = e.student_id
LEFT JOIN Courses c
    ON e.course_id = c.course_id;
    
-- 13. Display student names, course names, subjects, and marks.
SELECT
    s.first_name,
    s.last_name,
    c.course_name,
    m.subject_name,
    m.marks_obtained
FROM Students s
JOIN Enrollments e
    ON s.student_id = e.student_id
JOIN Courses c
    ON e.course_id = c.course_id
JOIN Marks m
    ON e.enrollment_id = m.enrollment_id;
    
--  14. Find students who scored more than the overall average marks.

SELECT DISTINCT
    s.student_id,
    s.first_name,
    s.last_name
FROM Students s
JOIN Enrollments e
    ON s.student_id = e.student_id
JOIN Marks m
    ON e.enrollment_id = m.enrollment_id
WHERE m.marks_obtained >
    (SELECT AVG(marks_obtained) FROM Marks);
    
   -- 15. Display grades based on marks.
   SELECT
    mark_id,
    subject_name,
    marks_obtained,
    CASE
        WHEN marks_obtained >= 90 THEN 'A'
        WHEN marks_obtained >= 80 THEN 'B'
        WHEN marks_obtained >= 70 THEN 'C'
        WHEN marks_obtained >= 60 THEN 'D'
        ELSE 'Needs Improvement'
    END AS grade
FROM Marks;

--  Advanced --

-- 17. Find the top three students based on their average marks.
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    ROUND(AVG(m.marks_obtained), 2) AS average_marks
FROM Students s
JOIN Enrollments e
    ON s.student_id = e.student_id
JOIN Marks m
    ON e.enrollment_id = m.enrollment_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY average_marks DESC
LIMIT 3;

-- 18. Rank students based on their average marks.
WITH StudentResults AS (
    SELECT
        s.student_id,
        s.first_name,
        s.last_name,
        AVG(m.marks_obtained) AS average_marks
    FROM Students s
    JOIN Enrollments e
        ON s.student_id = e.student_id
    JOIN Marks m
        ON e.enrollment_id = m.enrollment_id
    GROUP BY s.student_id, s.first_name, s.last_name
)
SELECT
    student_id,
    first_name,
    last_name,
    ROUND(average_marks, 2) AS average_marks,
    RANK() OVER (ORDER BY average_marks DESC) AS student_rank
FROM StudentResults;

-- 19. Create a view showing student performance.
CREATE OR REPLACE VIEW StudentPerformance AS
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name,
    ROUND(AVG(m.marks_obtained), 2) AS average_marks
FROM Students s
JOIN Enrollments e
    ON s.student_id = e.student_id
JOIN Courses c
    ON e.course_id = c.course_id
JOIN Marks m
    ON e.enrollment_id = m.enrollment_id
GROUP BY
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_id,
    c.course_name;