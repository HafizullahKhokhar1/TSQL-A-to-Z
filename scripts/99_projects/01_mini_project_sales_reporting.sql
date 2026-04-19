-- Topic: Mini project - Sales reporting
-- Goal: Combine joins, grouping, and ranking in one practical report.

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
    Category NVARCHAR(50) NOT NULL,
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

INSERT INTO dbo.Customers (CustomerName, City)
VALUES
('Ayesha Khan', 'Lahore'),
('Bilal Ahmed', 'Karachi'),
('Hina Malik', 'Islamabad'),
('Usman Shah', 'Faisalabad');

INSERT INTO dbo.Products (ProductName, Category, UnitPrice)
VALUES
('SQL Fundamentals Book', 'Books', 24.99),
('Practice Workbook', 'Books', 14.99),
('Monitor 24-inch', 'Hardware', 149.50),
('Keyboard Mechanical', 'Hardware', 79.00),
('Database Stickers Pack', 'Accessories', 9.99);

INSERT INTO dbo.Orders (CustomerID, OrderDate, OrderStatus)
VALUES
(1, '2026-01-05', 'Shipped'),
(1, '2026-01-18', 'Open'),
(2, '2026-01-12', 'Shipped'),
(3, '2026-01-20', 'Cancelled'),
(4, '2026-01-22', 'Shipped');

INSERT INTO dbo.OrderItems (OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1, 1, 1, 24.99),
(1, 5, 2, 9.99),
(2, 3, 1, 149.50),
(3, 2, 3, 14.99),
(3, 4, 1, 79.00),
(4, 1, 1, 24.99),
(5, 5, 5, 9.99);
GO

WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        c.CustomerName,
        c.City,
        o.OrderDate,
        o.OrderStatus,
        SUM(oi.Quantity * oi.UnitPrice) AS OrderTotal
    FROM dbo.Orders AS o
    INNER JOIN dbo.Customers AS c ON o.CustomerID = c.CustomerID
    INNER JOIN dbo.OrderItems AS oi ON o.OrderID = oi.OrderID
    GROUP BY o.OrderID, c.CustomerName, c.City, o.OrderDate, o.OrderStatus
),
RankedOrders AS
(
    SELECT
        *,
        ROW_NUMBER() OVER (ORDER BY OrderTotal DESC) AS RevenueRank
    FROM OrderTotals
)
SELECT *
FROM RankedOrders
ORDER BY RevenueRank;
GO

-- Exercises
-- 1. Add a sales-by-city summary below the ranking query.
-- 2. Show only shipped orders with a total above 50.
-- 3. Add a section that lists the top-selling product by quantity.
