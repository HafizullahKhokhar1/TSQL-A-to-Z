-- Topic: DDL constraints
-- Goal: Protect data with keys, rules, and defaults.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL DROP TABLE dbo.Employees;
IF OBJECT_ID('dbo.Departments', 'U') IS NOT NULL DROP TABLE dbo.Departments;
GO

CREATE TABLE dbo.Departments
(
    DepartmentID INT IDENTITY(1,1) CONSTRAINT PK_Departments PRIMARY KEY,
    DepartmentName NVARCHAR(80) NOT NULL CONSTRAINT UQ_Departments_DepartmentName UNIQUE
);

CREATE TABLE dbo.Employees
(
    EmployeeID INT IDENTITY(1,1) CONSTRAINT PK_Employees PRIMARY KEY,
    DepartmentID INT NOT NULL,
    EmployeeName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(120) NOT NULL CONSTRAINT UQ_Employees_Email UNIQUE,
    HireDate DATE NOT NULL CONSTRAINT DF_Employees_HireDate DEFAULT (GETDATE()),
    Salary DECIMAL(12,2) NOT NULL CONSTRAINT CK_Employees_Salary CHECK (Salary > 0),
    CONSTRAINT FK_Employees_Departments FOREIGN KEY (DepartmentID) REFERENCES dbo.Departments(DepartmentID)
);
GO

INSERT INTO dbo.Departments (DepartmentName)
VALUES ('Finance'), ('Engineering'), ('Operations');

INSERT INTO dbo.Employees (DepartmentID, EmployeeName, Email, Salary)
VALUES
(1, 'Ayesha Khan', 'ayesha@example.com', 65000),
(2, 'Bilal Ahmed', 'bilal@example.com', 72000),
(3, 'Hina Malik', 'hina@example.com', 58000);
GO

SELECT e.EmployeeName, d.DepartmentName, e.HireDate, e.Salary
FROM dbo.Employees AS e
INNER JOIN dbo.Departments AS d ON e.DepartmentID = d.DepartmentID;
GO

-- Exercises
-- 1. Try to insert a duplicate email and observe the constraint.
-- 2. Add a new check constraint for salary upper bounds.
-- 3. Add another table with a foreign key to Departments.
