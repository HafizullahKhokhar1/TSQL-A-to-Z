-- Topic: Views
-- Goal: Package a reusable query for reporting.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.OrderItems', 'U') IS NOT NULL DROP TABLE dbo.OrderItems;
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL DROP TABLE dbo.Products;
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;
IF OBJECT_ID('dbo.vw_SalesSummary', 'V') IS NOT NULL DROP VIEW dbo.vw_SalesSummary;
GO

CREATE TABLE dbo.Customers
(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL
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
    OrderStatus NVARCHAR(20) NOT NULL
);

CREATE TABLE dbo.OrderItems
(
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL
);
GO

INSERT INTO dbo.Customers (CustomerName)
VALUES ('Ayesha Khan'), ('Bilal Ahmed'), ('Hina Malik');

INSERT INTO dbo.Products (ProductName, UnitPrice)
VALUES ('SQL Fundamentals Book', 24.99), ('Practice Workbook', 14.99), ('Monitor 24-inch', 149.50);

INSERT INTO dbo.Orders (CustomerID, OrderDate, OrderStatus)
VALUES
(1, '2026-01-05', 'Shipped'),
(1, '2026-01-18', 'Open'),
(2, '2026-01-12', 'Shipped');

INSERT INTO dbo.OrderItems (OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1, 1, 1, 24.99),
(1, 2, 1, 14.99),
(2, 3, 1, 149.50),
(3, 1, 2, 24.99);
GO

CREATE VIEW dbo.vw_SalesSummary
AS
SELECT
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    o.OrderStatus,
    SUM(oi.Quantity * oi.UnitPrice) AS OrderTotal
FROM dbo.Orders AS o
INNER JOIN dbo.Customers AS c ON o.CustomerID = c.CustomerID
INNER JOIN dbo.OrderItems AS oi ON o.OrderID = oi.OrderID
GROUP BY c.CustomerName, o.OrderID, o.OrderDate, o.OrderStatus;
GO

SELECT *
FROM dbo.vw_SalesSummary
ORDER BY OrderDate;
GO

-- Exercises
-- 1. Add a filter to show only shipped orders.
-- 2. Create a second view for products and their order counts.
-- 3. Modify the view to add a customer-level total.
