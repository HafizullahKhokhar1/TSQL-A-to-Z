-- Topic: NULL handling with joins
-- Goal: Clean up missing values with COALESCE and friendly labels.
-- This is the cleaned split version of the older mixed CLASS6 lesson.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL DROP TABLE dbo.Employees;
IF OBJECT_ID('dbo.Departments', 'U') IS NOT NULL DROP TABLE dbo.Departments;
GO

CREATE TABLE dbo.Departments
(
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(80) NOT NULL
);

CREATE TABLE dbo.Employees
(
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName NVARCHAR(100) NOT NULL,
    DepartmentID INT NULL,
    Phone NVARCHAR(20) NULL
);
GO

INSERT INTO dbo.Departments (DepartmentName)
VALUES ('Sales'), ('Engineering');

INSERT INTO dbo.Employees (EmployeeName, DepartmentID, Phone)
VALUES
('Ayesha Khan', 1, '555-0101'),
('Bilal Ahmed', 2, NULL),
('Hina Malik', NULL, '555-0103');
GO

SELECT
    e.EmployeeName,
    COALESCE(d.DepartmentName, 'Unassigned') AS DepartmentName,
    COALESCE(e.Phone, 'No phone recorded') AS PhoneNumber
FROM dbo.Employees AS e
LEFT JOIN dbo.Departments AS d
    ON e.DepartmentID = d.DepartmentID;
GO

-- Exercises
-- 1. Replace COALESCE with ISNULL and compare the result.
-- 2. Add a second nullable column and handle it in the same query.
-- 3. Show only employees who do not have a department yet.
