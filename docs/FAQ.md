# FAQ

## Why do I get an error about `USE`?
Make sure the database exists first and that you are connected to the correct SQL Server instance. In many lessons, you should run `USE TSQL_A_TO_Z;` only after the database has been created.

## Why does `CONTAINS` fail?
Full-text search requires a full-text index. If the table does not have one, create it first or use `LIKE` for the exercise.

## Why do I get a primary key error?
The sample data may already exist. Re-run the script from the top so the `IF OBJECT_ID(...)` drops happen first.

## Why do I see `Invalid object name`?
The table, view, or procedure was probably not created in the current database context. Check the active database in SSMS.

## Why does a script use `GO`?
`GO` separates batches for SQL Server tools like SSMS. It is not a T-SQL keyword, but it is commonly used in lesson scripts.

## Can I change the sample data?
Yes. That is encouraged after you finish the exercises, as long as you keep the lesson safe to re-run.
