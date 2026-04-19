-- Topic: Subqueries
-- Goal: Use nested queries to answer questions in steps.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.OrderItems', 'U') IS NOT NULL DROP TABLE dbo.OrderItems;
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL DROP TABLE dbo.Products;
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;
GO

CREATE TABLE dbo.Customers
(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    City NVARCHAR(60) NOT NULL
);

CREATE TABLE dbo.Products
(
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL
);

CREATE TABLE dbo.Orders
(
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    OrderTotal DECIMAL(12,2) NOT NULL
);

CREATE TABLE dbo.OrderItems
(
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL
);
GO

INSERT INTO dbo.Customers (CustomerName, City)
VALUES ('Ayesha Khan', 'Lahore'), ('Bilal Ahmed', 'Karachi'), ('Hina Malik', 'Islamabad');

INSERT INTO dbo.Products (ProductName, UnitPrice)
VALUES ('SQL Fundamentals Book', 24.99), ('Practice Workbook', 14.99), ('Monitor 24-inch', 149.50);

INSERT INTO dbo.Orders (CustomerID, OrderDate, OrderTotal)
VALUES
(1, '2026-01-05', 39.98),
(1, '2026-01-18', 149.50),
(2, '2026-01-12', 24.99),
(3, '2026-01-20', 59.98);

INSERT INTO dbo.OrderItems (OrderID, ProductID, Quantity)
VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(3, 1, 1),
(4, 2, 2);
GO

SELECT CustomerName, City
FROM dbo.Customers
WHERE CustomerID IN
(
    SELECT CustomerID
    FROM dbo.Orders
    WHERE OrderTotal >= 50
);

SELECT ProductName, UnitPrice
FROM dbo.Products
WHERE UnitPrice >
(
    SELECT AVG(UnitPrice)
    FROM dbo.Products
);

SELECT CustomerName
FROM dbo.Customers AS c
WHERE EXISTS
(
    SELECT 1
    FROM dbo.Orders AS o
    WHERE o.CustomerID = c.CustomerID
      AND o.OrderTotal >= 100
);
GO

-- Exercises
-- 1. Find customers who have never placed an order.
-- 2. Return products used in at least one order.
-- 3. Rewrite one query using a join instead of a subquery.
