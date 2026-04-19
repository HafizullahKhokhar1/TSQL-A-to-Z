-- Topic: Many-to-many relationships with a bridge table
-- Goal: Learn how bridge tables connect two parent tables.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.Enrollments', 'U') IS NOT NULL DROP TABLE dbo.Enrollments;
IF OBJECT_ID('dbo.Courses', 'U') IS NOT NULL DROP TABLE dbo.Courses;
IF OBJECT_ID('dbo.Students', 'U') IS NOT NULL DROP TABLE dbo.Students;
GO

CREATE TABLE dbo.Students
(
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentName NVARCHAR(100) NOT NULL
);

CREATE TABLE dbo.Courses
(
    CourseID INT IDENTITY(1,1) PRIMARY KEY,
    CourseName NVARCHAR(100) NOT NULL
);

CREATE TABLE dbo.Enrollments
(
    EnrollmentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollDate DATE NOT NULL,
    CONSTRAINT FK_Enrollments_Students FOREIGN KEY (StudentID) REFERENCES dbo.Students(StudentID),
    CONSTRAINT FK_Enrollments_Courses FOREIGN KEY (CourseID) REFERENCES dbo.Courses(CourseID),
    CONSTRAINT UQ_Enrollments UNIQUE (StudentID, CourseID)
);
GO

INSERT INTO dbo.Students (StudentName)
VALUES ('Ayesha Khan'), ('Bilal Ahmed'), ('Hina Malik');

INSERT INTO dbo.Courses (CourseName)
VALUES ('Intro to SQL'), ('Joins Deep Dive'), ('Window Functions');

INSERT INTO dbo.Enrollments (StudentID, CourseID, EnrollDate)
VALUES
(1, 1, '2026-01-05'),
(1, 2, '2026-01-12'),
(2, 1, '2026-01-07'),
(3, 3, '2026-01-15');
GO

SELECT s.StudentName, c.CourseName, e.EnrollDate
FROM dbo.Enrollments AS e
INNER JOIN dbo.Students AS s ON e.StudentID = s.StudentID
INNER JOIN dbo.Courses AS c ON e.CourseID = c.CourseID
ORDER BY s.StudentName, c.CourseName;
GO

-- Exercises
-- 1. Add a new course and enroll at least one student.
-- 2. Show students and the number of courses they take.
-- 3. Return courses with no enrollments.
