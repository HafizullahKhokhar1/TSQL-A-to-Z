-- Topic: Functions
-- Goal: Return reusable calculations and row sets.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.OrderItems', 'U') IS NOT NULL DROP TABLE dbo.OrderItems;
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.fn_OrderTotal', 'FN') IS NOT NULL DROP FUNCTION dbo.fn_OrderTotal;
IF OBJECT_ID('dbo.fn_OrdersByCustomer', 'IF') IS NOT NULL DROP FUNCTION dbo.fn_OrdersByCustomer;
GO

CREATE TABLE dbo.Orders
(
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    OrderDate DATE NOT NULL
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

INSERT INTO dbo.Orders (CustomerName, OrderDate)
VALUES ('Ayesha Khan', '2026-01-05'), ('Ayesha Khan', '2026-01-18'), ('Bilal Ahmed', '2026-01-12');

INSERT INTO dbo.OrderItems (OrderID, ProductName, Quantity, UnitPrice)
VALUES
(1, 'SQL Fundamentals Book', 1, 24.99),
(1, 'Practice Workbook', 1, 14.99),
(2, 'Monitor 24-inch', 1, 149.50),
(3, 'SQL Fundamentals Book', 2, 24.99);
GO

CREATE FUNCTION dbo.fn_OrderTotal (@OrderID INT)
RETURNS DECIMAL(12,2)
AS
BEGIN
    DECLARE @Total DECIMAL(12,2);

    SELECT @Total = SUM(Quantity * UnitPrice)
    FROM dbo.OrderItems
    WHERE OrderID = @OrderID;

    RETURN COALESCE(@Total, 0);
END;
GO

CREATE FUNCTION dbo.fn_OrdersByCustomer (@CustomerName NVARCHAR(100))
RETURNS TABLE
AS
RETURN
(
    SELECT
        o.OrderID,
        o.CustomerName,
        o.OrderDate,
        dbo.fn_OrderTotal(o.OrderID) AS OrderTotal
    FROM dbo.Orders AS o
    WHERE o.CustomerName = @CustomerName
);
GO

SELECT dbo.fn_OrderTotal(1) AS OrderTotalForOrder1;
SELECT * FROM dbo.fn_OrdersByCustomer('Ayesha Khan');
GO

-- Exercises
-- 1. Change the scalar function to return money instead of decimal.
-- 2. Add a table-valued function for all orders above a minimum total.
-- 3. Calculate totals without using the scalar function to compare the design.
