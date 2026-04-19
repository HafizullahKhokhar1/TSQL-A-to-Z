-- Topic: WHERE, LIKE, IN, and BETWEEN
-- Goal: Learn how to filter rows with common predicates.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.Students', 'U') IS NOT NULL DROP TABLE dbo.Students;
GO

CREATE TABLE dbo.Students
(
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentName NVARCHAR(100) NOT NULL,
    ProgramName NVARCHAR(80) NOT NULL,
    Score INT NOT NULL,
    Email NVARCHAR(120) NULL
);
GO

INSERT INTO dbo.Students (StudentName, ProgramName, Score, Email)
VALUES
('Ali Raza', 'Database Fundamentals', 78, 'ali@example.com'),
('Sara Noor', 'Database Fundamentals', 91, 'sara@example.com'),
('Farhan Ali', 'SQL for Analysts', 84, NULL),
('Mariam Khan', 'SQL for Analysts', 69, 'mariam@example.com'),
('Nida Shah', 'Reporting with SQL', 95, 'nida@example.com');
GO

SELECT StudentName, ProgramName, Score
FROM dbo.Students
WHERE Score >= 80;

SELECT StudentName, Email
FROM dbo.Students
WHERE Email IS NULL;

SELECT StudentName, ProgramName
FROM dbo.Students
WHERE StudentName LIKE 'A%';

SELECT StudentName, Score
FROM dbo.Students
WHERE ProgramName IN ('Database Fundamentals', 'Reporting with SQL');

SELECT StudentName, Score
FROM dbo.Students
WHERE Score BETWEEN 70 AND 90;
GO

-- Exercises
-- 1. Find students with names ending in the letter 'n'.
-- 2. Return all scores between 80 and 95.
-- 3. Show students whose program is not SQL for Analysts.
