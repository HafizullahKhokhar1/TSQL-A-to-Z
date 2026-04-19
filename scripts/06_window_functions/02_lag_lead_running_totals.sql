-- Topic: LAG, LEAD, and running totals
-- Goal: Compare rows over time and calculate cumulative values.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.MonthlySales', 'U') IS NOT NULL DROP TABLE dbo.MonthlySales;
GO

CREATE TABLE dbo.MonthlySales
(
    SalesMonth DATE NOT NULL,
    Region NVARCHAR(40) NOT NULL,
    SalesAmount DECIMAL(12,2) NOT NULL
);
GO

INSERT INTO dbo.MonthlySales (SalesMonth, Region, SalesAmount)
VALUES
('2026-01-01', 'North', 1000.00),
('2026-02-01', 'North', 1200.00),
('2026-03-01', 'North', 900.00),
('2026-01-01', 'South', 800.00),
('2026-02-01', 'South', 850.00),
('2026-03-01', 'South', 1100.00);
GO

SELECT
    Region,
    SalesMonth,
    SalesAmount,
    LAG(SalesAmount) OVER (PARTITION BY Region ORDER BY SalesMonth) AS PreviousMonthSales,
    LEAD(SalesAmount) OVER (PARTITION BY Region ORDER BY SalesMonth) AS NextMonthSales,
    SUM(SalesAmount) OVER (PARTITION BY Region ORDER BY SalesMonth ROWS UNBOUNDED PRECEDING) AS RunningTotal
FROM dbo.MonthlySales
ORDER BY Region, SalesMonth;
GO

-- Exercises
-- 1. Add a percent change calculation using LAG.
-- 2. Return only the last month in each region.
-- 3. Change the running total to a 2-row sliding window.
