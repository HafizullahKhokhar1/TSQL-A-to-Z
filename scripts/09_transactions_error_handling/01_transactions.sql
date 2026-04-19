-- Topic: Transactions
-- Goal: Keep related changes together or roll them back together.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.Accounts', 'U') IS NOT NULL DROP TABLE dbo.Accounts;
GO

CREATE TABLE dbo.Accounts
(
    AccountID INT IDENTITY(1,1) PRIMARY KEY,
    AccountName NVARCHAR(100) NOT NULL,
    Balance DECIMAL(12,2) NOT NULL
);
GO

INSERT INTO dbo.Accounts (AccountName, Balance)
VALUES
('Operating', 5000.00),
('Savings', 2500.00),
('Learning Budget', 750.00);
GO

BEGIN TRAN;

UPDATE dbo.Accounts
SET Balance = Balance - 500.00
WHERE AccountName = 'Operating';

UPDATE dbo.Accounts
SET Balance = Balance + 500.00
WHERE AccountName = 'Savings';

COMMIT;
GO

SELECT *
FROM dbo.Accounts;
GO

BEGIN TRAN;

UPDATE dbo.Accounts
SET Balance = Balance - 100.00
WHERE AccountName = 'Savings';

ROLLBACK;
GO

SELECT *
FROM dbo.Accounts;
GO

-- Exercises
-- 1. Reverse the transfer and run it again.
-- 2. Add a second transfer inside the same transaction.
-- 3. Try a rollback after the first update and inspect the balances.
