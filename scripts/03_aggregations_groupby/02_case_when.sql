-- Topic: CASE WHEN
-- Goal: Turn raw values into readable business labels.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.SalesOrders', 'U') IS NOT NULL DROP TABLE dbo.SalesOrders;
GO

CREATE TABLE dbo.SalesOrders
(
    SalesOrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    OrderTotal DECIMAL(12,2) NOT NULL,
    OrderStatus NVARCHAR(20) NOT NULL
);
GO

INSERT INTO dbo.SalesOrders (CustomerName, OrderTotal, OrderStatus)
VALUES
('Ayesha Khan', 250.00, 'Shipped'),
('Bilal Ahmed', 90.00, 'Open'),
('Hina Malik', 520.00, 'Shipped'),
('Usman Shah', 145.00, 'Cancelled'),
('Nida Shah', 300.00, 'Open');
GO

SELECT
    CustomerName,
    OrderTotal,
    CASE
        WHEN OrderTotal >= 500 THEN 'High Value'
        WHEN OrderTotal >= 200 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS OrderBand,
    CASE
        WHEN OrderStatus = 'Shipped' THEN 'Completed'
        WHEN OrderStatus = 'Open' THEN 'In Progress'
        ELSE 'Needs Review'
    END AS StatusLabel
FROM dbo.SalesOrders;
GO

-- Exercises
-- 1. Add a CASE expression that labels orders as Small, Medium, or Large.
-- 2. Change the status labels to match your own business terms.
-- 3. Sort the results by the OrderBand expression.
