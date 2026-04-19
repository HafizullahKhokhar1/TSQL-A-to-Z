-- Topic: ORDER BY, TOP, OFFSET, and FETCH
-- Goal: Learn how to control sort order and page through results.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL DROP TABLE dbo.Products;
GO

CREATE TABLE dbo.Products
(
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL
);
GO

INSERT INTO dbo.Products (ProductName, Category, UnitPrice)
VALUES
('SQL Fundamentals Book', 'Books', 24.99),
('Practice Workbook', 'Books', 14.99),
('Monitor 24-inch', 'Hardware', 149.50),
('Keyboard Mechanical', 'Hardware', 79.00),
('Database Stickers Pack', 'Accessories', 9.99),
('Desk Lamp', 'Accessories', 19.99);
GO

SELECT TOP (3)
    ProductName,
    UnitPrice
FROM dbo.Products
ORDER BY UnitPrice DESC;

SELECT ProductName, Category, UnitPrice
FROM dbo.Products
ORDER BY Category, ProductName;

SELECT ProductName, UnitPrice
FROM dbo.Products
ORDER BY UnitPrice DESC
OFFSET 2 ROWS FETCH NEXT 2 ROWS ONLY;
GO

-- Exercises
-- 1. Return the two cheapest products.
-- 2. Sort products by category and then by price descending.
-- 3. Change the OFFSET and FETCH values to view a different page.
