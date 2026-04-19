-- Archived lesson: CLASS6
-- This file preserves the older mixed-style lesson while the repo uses cleaner topic-based files.

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
VALUES ('Sales'), ('Engineering'), ('Support');

INSERT INTO dbo.Employees (EmployeeName, DepartmentID, Phone)
VALUES
('Ayesha Khan', 1, '555-0101'),
('Bilal Ahmed', 2, NULL),
('Hina Malik', NULL, '555-0103'),
('Usman Shah', 99, NULL);
GO

SELECT
    e.EmployeeName,
    COALESCE(d.DepartmentName, 'Unassigned') AS DepartmentName,
    ISNULL(e.Phone, 'No phone') AS PhoneNumber
FROM dbo.Employees AS e
LEFT JOIN dbo.Departments AS d
    ON e.DepartmentID = d.DepartmentID;

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM dbo.Employees AS e
INNER JOIN dbo.Departments AS d
    ON e.DepartmentID = d.DepartmentID;
GO

-- Archived exercises
-- 1. Change the COALESCE label.
-- 2. Replace the LEFT JOIN with a FULL OUTER JOIN and review the output.
-- 3. Add a WHERE clause to return only rows with missing department values.
