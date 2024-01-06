USE Clg_Project;

SELECT * FROM Students;
SELECT * FROM Courses;
select * from enrollments;

-- Q1: Retrieve all students --
SELECT * FROM Students;

-- Q2: Retrieve all courses: --
SELECT * FROM Courses;

-- Q3: Retrieve all enrollments with student and course details: --
SELECT E.EnrollmentID, S.FirstName, S.LastName, C.CourseName, E.EnrollmentDate, E.Grade
FROM Enrollment E
JOIN Students S ON E.StudentID = S.StudentID
JOIN Courses C ON E.CourseID = C.CourseID;

-- Q4: 	 Retrieve students majoring in Computer Science: --
SELECT * FROM Students WHERE Major = 'Computer Science';

-- Q5: Retrieve courses in the Biology department:--
SELECT * FROM Courses WHERE Department = 'Biology';

-- Q6: Retrieve the number of enrollments for each course: --
SELECT C.CourseName, COUNT(E.EnrollmentID) AS EnrollmentCount
FROM Courses C
LEFT JOIN Enrollment E ON C.CourseID = E.CourseID
GROUP BY C.CourseID, C.CourseName;

-- Q7: Retrieve students who have not enrolled in any courses: --
SELECT S.StudentID, S.FirstName, S.LastName
FROM Students S
LEFT JOIN Enrollment E ON S.StudentID = E.StudentID
WHERE E.EnrollmentID IS NULL;

-- Q8: Retrieve the average age of students in each major: --
SELECT Major, AVG(Age) AS AverageAge
FROM Students
GROUP BY Major;


