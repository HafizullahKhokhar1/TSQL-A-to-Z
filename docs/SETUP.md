# Setup

This repo is designed for SQL Server and SQL Server Management Studio (SSMS).

## Prerequisites
- SQL Server Developer Edition, Express, or another local SQL Server instance
- SQL Server Management Studio (SSMS)
- Permission to create a database on your local instance

## Create the Learning Database
Run this once in SSMS:

```sql
IF DB_ID('TSQL_A_TO_Z') IS NULL
BEGIN
    CREATE DATABASE TSQL_A_TO_Z;
END;
GO
```

## How to Run a Lesson Script
1. Open SSMS and connect to your SQL Server instance.
2. Open the lesson file from the `scripts/` folder.
3. Set the database context to `TSQL_A_TO_Z` when the script says to do so.
4. Run the script in order from top to bottom.
5. Read the exercises at the end and try them before moving on.

## Safety Notes
- Run these scripts only in a learning database.
- Review every `DROP`, `DELETE`, or `TRUNCATE` statement before executing it.
- Do not point the scripts at a production database.
- If a lesson re-creates sample tables, that is intentional and safe inside `TSQL_A_TO_Z`.

## Common SSMS Tips
- Use `Ctrl+Shift+E` to execute the selected query window in many SSMS setups.
- Use `GO` to separate batches when a script needs it.
- Refresh Object Explorer after creating tables, views, or procedures.
