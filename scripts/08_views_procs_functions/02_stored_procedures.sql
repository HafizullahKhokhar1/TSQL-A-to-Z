-- Topic: Stored procedures
-- Goal: Encapsulate reusable tasks with parameters.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.OrderItems', 'U') IS NOT NULL DROP TABLE dbo.OrderItems;
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;
IF OBJECT_ID('dbo.usp_GetCustomerOrders', 'P') IS NOT NULL DROP PROCEDURE dbo.usp_GetCustomerOrders;
IF OBJECT_ID('dbo.usp_CreateOrder', 'P') IS NOT NULL DROP PROCEDURE dbo.usp_CreateOrder;
GO

CREATE TABLE dbo.Customers
(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL
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

INSERT INTO dbo.Customers (CustomerName)
VALUES ('Ayesha Khan'), ('Bilal Ahmed');

INSERT INTO dbo.Orders (CustomerID, OrderDate, OrderStatus)
VALUES
(1, '2026-01-05', 'Shipped'),
(1, '2026-01-18', 'Open'),
(2, '2026-01-12', 'Shipped');

INSERT INTO dbo.OrderItems (OrderID, ProductName, Quantity, UnitPrice)
VALUES
(1, 'SQL Fundamentals Book', 1, 24.99),
(1, 'Practice Workbook', 1, 14.99),
(3, 'Monitor 24-inch', 1, 149.50);
GO

CREATE PROCEDURE dbo.usp_GetCustomerOrders
    @CustomerName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        c.CustomerName,
        o.OrderID,
        o.OrderDate,
        o.OrderStatus
    FROM dbo.Customers AS c
    INNER JOIN dbo.Orders AS o ON c.CustomerID = o.CustomerID
    WHERE c.CustomerName = @CustomerName
    ORDER BY o.OrderDate;
END;
GO

CREATE PROCEDURE dbo.usp_CreateOrder
    @CustomerID INT,
    @OrderDate DATE,
    @OrderStatus NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Orders (CustomerID, OrderDate, OrderStatus)
    VALUES (@CustomerID, @OrderDate, @OrderStatus);
END;
GO

EXEC dbo.usp_GetCustomerOrders @CustomerName = 'Ayesha Khan';
EXEC dbo.usp_CreateOrder @CustomerID = 2, @OrderDate = '2026-01-25', @OrderStatus = 'Open';
EXEC dbo.usp_GetCustomerOrders @CustomerName = 'Bilal Ahmed';
GO

-- Exercises
-- 1. Add a parameter for order status.
-- 2. Create a procedure that returns order item totals.
-- 3. Add validation so an empty customer name is rejected.
