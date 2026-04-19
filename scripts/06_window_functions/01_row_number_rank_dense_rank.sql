-- Topic: ROW_NUMBER, RANK, and DENSE_RANK
-- Goal: Rank rows without collapsing the detail level.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.SalesOrders', 'U') IS NOT NULL DROP TABLE dbo.SalesOrders;
GO

CREATE TABLE dbo.SalesOrders
(
    SalesOrderID INT IDENTITY(1,1) PRIMARY KEY,
    Region NVARCHAR(40) NOT NULL,
    SalesRep NVARCHAR(80) NOT NULL,
    OrderTotal DECIMAL(12,2) NOT NULL
);
GO

INSERT INTO dbo.SalesOrders (Region, SalesRep, OrderTotal)
VALUES
('North', 'Ayesha', 250.00),
('North', 'Bilal', 250.00),
('North', 'Hina', 180.00),
('South', 'Usman', 300.00),
('South', 'Nida', 300.00),
('South', 'Sara', 120.00);
GO

SELECT
    Region,
    SalesRep,
    OrderTotal,
    ROW_NUMBER() OVER (PARTITION BY Region ORDER BY OrderTotal DESC, SalesRep) AS RowNum,
    RANK() OVER (PARTITION BY Region ORDER BY OrderTotal DESC) AS RankValue,
    DENSE_RANK() OVER (PARTITION BY Region ORDER BY OrderTotal DESC) AS DenseRankValue
FROM dbo.SalesOrders
ORDER BY Region, RowNum;
GO

-- Exercises
-- 1. Remove the PARTITION BY clause and compare the result.
-- 2. Change the ORDER BY to rank by SalesRep.
-- 3. Add a tie-breaker column to ROW_NUMBER.
