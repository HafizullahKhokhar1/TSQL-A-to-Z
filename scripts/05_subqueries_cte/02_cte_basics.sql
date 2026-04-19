-- Topic: CTE basics
-- Goal: Break a query into named steps for readability.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.SalesOrders', 'U') IS NOT NULL DROP TABLE dbo.SalesOrders;
GO

CREATE TABLE dbo.SalesOrders
(
    SalesOrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    Region NVARCHAR(40) NOT NULL,
    OrderDate DATE NOT NULL,
    OrderTotal DECIMAL(12,2) NOT NULL
);
GO

INSERT INTO dbo.SalesOrders (CustomerName, Region, OrderDate, OrderTotal)
VALUES
('Ayesha Khan', 'North', '2026-01-03', 250.00),
('Ayesha Khan', 'North', '2026-01-10', 180.00),
('Bilal Ahmed', 'South', '2026-01-12', 300.00),
('Hina Malik', 'South', '2026-01-20', 220.00),
('Usman Shah', 'East', '2026-01-21', 500.00);
GO

WITH OrderTotals AS
(
    SELECT
        CustomerName,
        Region,
        SUM(OrderTotal) AS TotalSales
    FROM dbo.SalesOrders
    GROUP BY CustomerName, Region
)
SELECT CustomerName, Region, TotalSales
FROM OrderTotals
WHERE TotalSales >= 300
ORDER BY TotalSales DESC;
GO

-- Exercises
-- 1. Add a second CTE that filters only one region.
-- 2. Change the grouping to summary by CustomerName only.
-- 3. Use a CTE to calculate average order value per region.
