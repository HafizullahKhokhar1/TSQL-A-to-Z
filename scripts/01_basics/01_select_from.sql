-- Topic: SELECT from tables
-- Goal: Learn how to read rows and columns from a table.
-- Prerequisite: Create your learning database first.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL DROP TABLE dbo.Products;
GO

CREATE TABLE dbo.Customers
(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    City NVARCHAR(60) NOT NULL,
    StateCode CHAR(2) NOT NULL
);

CREATE TABLE dbo.Products
(
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL
);
GO

INSERT INTO dbo.Customers (FullName, City, StateCode)
VALUES
('Ayesha Khan', 'Lahore', 'PB'),
('Bilal Ahmed', 'Karachi', 'SD'),
('Hina Malik', 'Islamabad', 'IS');

INSERT INTO dbo.Products (ProductName, Category, UnitPrice)
VALUES
('SQL Fundamentals Book', 'Books', 24.99),
('Practice Workbook', 'Books', 14.99),
('Monitor 24-inch', 'Hardware', 149.50);
GO

SELECT *
FROM dbo.Customers;

SELECT CustomerID, FullName, City
FROM dbo.Customers;

SELECT ProductName, UnitPrice, UnitPrice * 1.05 AS PriceWithTax
FROM dbo.Products;
GO

-- Exercises
-- 1. Return only the customers from Karachi.
-- 2. Show product names and prices in descending order.
-- 3. Add one more computed column for a 10 percent discount.
