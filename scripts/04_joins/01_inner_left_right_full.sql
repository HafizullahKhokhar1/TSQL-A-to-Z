-- Topic: INNER, LEFT, RIGHT, and FULL joins
-- Goal: Compare join types and see how unmatched rows behave.

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
    DepartmentID INT NULL
);
GO

INSERT INTO dbo.Departments (DepartmentName)
VALUES ('Finance'), ('Engineering'), ('Human Resources'), ('Operations');

INSERT INTO dbo.Employees (EmployeeName, DepartmentID)
VALUES
('Ayesha Khan', 1),
('Bilal Ahmed', 2),
('Hina Malik', 2),
('Usman Shah', NULL),
('Nida Shah', 5);
GO

SELECT e.EmployeeName, d.DepartmentName
FROM dbo.Employees AS e
INNER JOIN dbo.Departments AS d
    ON e.DepartmentID = d.DepartmentID;

SELECT e.EmployeeName, d.DepartmentName
FROM dbo.Employees AS e
LEFT JOIN dbo.Departments AS d
    ON e.DepartmentID = d.DepartmentID;

SELECT e.EmployeeName, d.DepartmentName
FROM dbo.Employees AS e
RIGHT JOIN dbo.Departments AS d
    ON e.DepartmentID = d.DepartmentID;

SELECT e.EmployeeName, d.DepartmentName
FROM dbo.Employees AS e
FULL OUTER JOIN dbo.Departments AS d
    ON e.DepartmentID = d.DepartmentID;
GO

-- Exercises
-- 1. Replace the FULL OUTER JOIN with a LEFT JOIN and compare the output.
-- 2. Show only rows where the department name is missing.
-- 3. Add a COALESCE expression for a friendly label such as Unassigned.
