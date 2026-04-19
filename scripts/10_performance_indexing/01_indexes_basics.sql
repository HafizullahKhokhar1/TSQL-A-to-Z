-- Topic: Index basics
-- Goal: Create and use indexes on common search columns.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.OrderItems', 'U') IS NOT NULL DROP TABLE dbo.OrderItems;
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;
GO

CREATE TABLE dbo.Customers
(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    City NVARCHAR(60) NOT NULL
);

CREATE TABLE dbo.Orders
(
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    OrderStatus NVARCHAR(20) NOT NULL
);

CREATE TABLE dbo.OrderItems
(
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductName NVARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL
);
GO

INSERT INTO dbo.Customers (CustomerName, City)
VALUES ('Ayesha Khan', 'Lahore'), ('Bilal Ahmed', 'Karachi'), ('Hina Malik', 'Islamabad');

INSERT INTO dbo.Orders (CustomerID, OrderDate, OrderStatus)
VALUES
(1, '2026-01-05', 'Shipped'),
(1, '2026-01-18', 'Open'),
(2, '2026-01-12', 'Shipped'),
(3, '2026-01-20', 'Cancelled');

INSERT INTO dbo.OrderItems (OrderID, ProductName, Quantity, UnitPrice)
VALUES
(1, 'SQL Fundamentals Book', 1, 24.99),
(1, 'Practice Workbook', 1, 14.99),
(2, 'Monitor 24-inch', 1, 149.50),
(3, 'SQL Fundamentals Book', 2, 24.99),
(4, 'Keyboard Mechanical', 1, 79.00);
GO

CREATE INDEX IX_Orders_OrderDate ON dbo.Orders (OrderDate);
CREATE INDEX IX_Orders_CustomerID ON dbo.Orders (CustomerID);
CREATE INDEX IX_OrderItems_OrderID ON dbo.OrderItems (OrderID);
GO

SELECT o.OrderID, o.OrderDate, o.OrderStatus
FROM dbo.Orders AS o
WHERE o.OrderDate >= '2026-01-10'
ORDER BY o.OrderDate;
GO

-- Exercises
-- 1. Add an index on OrderStatus and test a filter.
-- 2. Find the query column most likely to benefit from a nonclustered index.
-- 3. Drop and recreate one index with a different key order.
