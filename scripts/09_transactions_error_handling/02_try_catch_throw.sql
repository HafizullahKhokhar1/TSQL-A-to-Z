-- Topic: TRY...CATCH and THROW
-- Goal: Handle errors cleanly and raise meaningful messages.

USE TSQL_A_TO_Z;
GO

IF OBJECT_ID('dbo.Accounts', 'U') IS NOT NULL DROP TABLE dbo.Accounts;
IF OBJECT_ID('dbo.usp_TransferFunds', 'P') IS NOT NULL DROP PROCEDURE dbo.usp_TransferFunds;
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
('Savings', 2500.00);
GO

CREATE PROCEDURE dbo.usp_TransferFunds
    @FromAccountID INT,
    @ToAccountID INT,
    @Amount DECIMAL(12,2)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        IF @Amount <= 0
        BEGIN
            ;THROW 50001, 'Transfer amount must be greater than zero.', 1;
        END;

        UPDATE dbo.Accounts
        SET Balance = Balance - @Amount
        WHERE AccountID = @FromAccountID;

        IF EXISTS
        (
            SELECT 1
            FROM dbo.Accounts
            WHERE AccountID = @FromAccountID
              AND Balance < 0
        )
        BEGIN
            ;THROW 50002, 'Insufficient funds for this transfer.', 1;
        END;

        UPDATE dbo.Accounts
        SET Balance = Balance + @Amount
        WHERE AccountID = @ToAccountID;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;

        SELECT
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage,
            ERROR_LINE() AS ErrorLine;
    END CATCH
END;
GO

BEGIN TRY
    EXEC dbo.usp_TransferFunds @FromAccountID = 1, @ToAccountID = 2, @Amount = -50.00;
END TRY
BEGIN CATCH
    SELECT
        ERROR_NUMBER() AS CaughtErrorNumber,
        ERROR_MESSAGE() AS CaughtErrorMessage;
END CATCH;
GO

EXEC dbo.usp_TransferFunds @FromAccountID = 1, @ToAccountID = 2, @Amount = 250.00;
SELECT * FROM dbo.Accounts;
GO

-- Exercises
-- 1. Change the error number and message in THROW.
-- 2. Add logging to a table inside the CATCH block.
-- 3. Trigger the insufficient funds branch with a larger transfer.
