-- Topic: GROUP BY and HAVING
-- Goal: Summarize data into totals and filtered groups.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.SalesOrders', 'U') IS NOT NULL DROP TABLE dbo.SalesOrders;
GO

CREATE TABLE dbo.SalesOrders
(
    SalesOrderID INT IDENTITY(1,1) PRIMARY KEY,
    Region NVARCHAR(40) NOT NULL,
    SalesRep NVARCHAR(80) NOT NULL,
    OrderDate DATE NOT NULL,
    OrderTotal DECIMAL(12,2) NOT NULL
);
GO

INSERT INTO dbo.SalesOrders (Region, SalesRep, OrderDate, OrderTotal)
VALUES
('North', 'Ayesha', '2026-01-03', 250.00),
('North', 'Ayesha', '2026-01-10', 180.00),
('North', 'Bilal', '2026-01-12', 300.00),
('South', 'Hina', '2026-01-08', 220.00),
('South', 'Hina', '2026-01-20', 275.00),
('East', 'Usman', '2026-01-15', 150.00),
('West', 'Sara', '2026-01-21', 500.00);
GO

SELECT Region, COUNT(*) AS OrderCount, SUM(OrderTotal) AS Revenue
FROM dbo.SalesOrders
GROUP BY Region
HAVING SUM(OrderTotal) >= 400;

SELECT SalesRep, AVG(OrderTotal) AS AverageOrderValue
FROM dbo.SalesOrders
GROUP BY SalesRep
ORDER BY AverageOrderValue DESC;
GO

-- Exercises
-- 1. Show total revenue by sales rep.
-- 2. Find regions with more than one order.
-- 3. Add a month-based group using YEAR and MONTH.
