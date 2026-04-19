-- Topic: Database setup
-- Goal: Create the learning database used by the rest of the repo.
-- Run this first in SSMS.

IF DB_ID(N'TSQL_A_TO_Z') IS NULL
BEGIN
    CREATE DATABASE TSQL_A_TO_Z;
END;
GO

USE TSQL_A_TO_Z;
GO

PRINT 'Database TSQL_A_TO_Z is ready.';
GO

-- Exercises
-- 1. Change the database name and observe the difference.
-- 2. Use Object Explorer to confirm that the database exists.
-- 3. Re-run the script and confirm it stays safe.
