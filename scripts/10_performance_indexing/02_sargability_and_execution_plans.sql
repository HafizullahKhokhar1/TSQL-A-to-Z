-- Topic: Sargability and execution plans
-- Goal: Write predicates that can use indexes more efficiently.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.SalesOrders', 'U') IS NOT NULL DROP TABLE dbo.SalesOrders;
GO

CREATE TABLE dbo.SalesOrders
(
    SalesOrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    OrderDate DATE NOT NULL,
    OrderTotal DECIMAL(12,2) NOT NULL
);
GO

INSERT INTO dbo.SalesOrders (CustomerName, OrderDate, OrderTotal)
VALUES
('Ayesha Khan', '2025-12-31', 120.00),
('Ayesha Khan', '2026-01-05', 250.00),
('Bilal Ahmed', '2026-01-12', 300.00),
('Hina Malik', '2026-02-02', 180.00),
('Usman Shah', '2026-03-15', 500.00);
GO

CREATE INDEX IX_SalesOrders_OrderDate ON dbo.SalesOrders (OrderDate);
GO

-- Non-sargable example: the function wraps the column.
SELECT *
FROM dbo.SalesOrders
WHERE YEAR(OrderDate) = 2026;

-- Sargable example: the column is compared directly to a range.
SELECT *
FROM dbo.SalesOrders
WHERE OrderDate >= '2026-01-01'
  AND OrderDate < '2027-01-01';
GO

-- Exercises
-- 1. Rewrite the filter using MONTH and then fix it with a date range.
-- 2. Compare the actual execution plan for both versions in SSMS.
-- 3. Add a search on CustomerName and discuss whether it is sargable.
