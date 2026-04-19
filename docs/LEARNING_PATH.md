# Learning Path

## 1. Setup and First Queries
Goal: connect to SQL Server, create the practice database, and read simple rows.
- Complete [docs/SETUP.md](docs/SETUP.md)
- Run `scripts/00_setup/00_create_database.sql`
- Run `scripts/00_setup/01_create_sample_tables.sql`
- Practice `SELECT`, `WHERE`, `LIKE`, `IN`, and `BETWEEN`

Checkpoint:
- You can create the database and read sample data without errors.

## 2. Filtering and Sorting
Goal: control what rows appear and in what order.
- Learn `ORDER BY`, `TOP`, `OFFSET`, and `FETCH`
- Finish the exercises in `scripts/02_filtering_sorting/01_order_by_top_offset_fetch.sql`

Checkpoint:
- You can return only the rows you need and sort them correctly.

## 3. Aggregation and Grouping
Goal: summarize data confidently.
- Study `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING`, and `CASE`
- Complete `scripts/03_aggregations_groupby/01_group_by_having.sql`
- Complete `scripts/03_aggregations_groupby/02_case_when.sql`

Checkpoint:
- You can describe totals, averages, and grouped results in plain English.

## 4. Joins and Relationships
Goal: combine data from related tables.
- Learn `INNER`, `LEFT`, `RIGHT`, and `FULL` joins
- Practice bridge tables and many-to-many relationships
- Finish the join lessons in `scripts/04_joins/`

Checkpoint:
- You can explain why rows appear, disappear, or repeat when tables are joined.

## 5. Subqueries and CTEs
Goal: build readable multi-step logic.
- Compare subqueries with common table expressions
- Learn when a CTE improves readability
- Finish `scripts/05_subqueries_cte/`

Checkpoint:
- You can break a problem into logical steps without losing clarity.

## 6. Window Functions
Goal: analyze rows without collapsing them.
- Study `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`, `LEAD`, and running totals
- Finish `scripts/06_window_functions/`

Checkpoint:
- You can calculate row-by-row metrics while still keeping detail rows.

## 7. DDL and Constraints
Goal: design tables with rules that protect data quality.
- Learn primary keys, foreign keys, unique constraints, check constraints, and defaults
- Finish `scripts/07_ddl_constraints/01_primary_foreign_unique_check_default.sql`

Checkpoint:
- You can explain how schema rules prevent bad data.

## 8. Views, Procedures, and Functions
Goal: package logic for reuse.
- Create views for reusable queries
- Create stored procedures for parameterized tasks
- Create scalar and table-valued functions
- Finish `scripts/08_views_procs_functions/`

Checkpoint:
- You can decide whether logic belongs in a view, procedure, or function.

## 9. Transactions and Error Handling
Goal: protect data during multi-step changes.
- Learn `BEGIN TRAN`, `COMMIT`, `ROLLBACK`, `TRY...CATCH`, and `THROW`
- Finish `scripts/09_transactions_error_handling/`

Checkpoint:
- You can explain how to keep data consistent when something fails.

## 10. Performance and Indexing
Goal: write SQL that scales better.
- Learn basic indexes, sargability, and plan reading habits
- Finish `scripts/10_performance_indexing/`

Checkpoint:
- You can spot common query patterns that help or hurt performance.

## 11. Mini Projects
Goal: combine topics into a practical solution.
- Build the sales reporting project in `scripts/99_projects/01_mini_project_sales_reporting.sql`
- Add your own exercises or extend the schema

Checkpoint:
- You can solve a small reporting problem from start to finish.

## Practice Rule
For each lesson:
1. Read the comments.
2. Run the script.
3. Answer the exercises without looking at the solution first.
4. Modify the sample data and rerun the query to test your understanding.
