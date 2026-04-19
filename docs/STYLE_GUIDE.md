# Style Guide

## File Naming
- Use numbered lessons with two-digit prefixes, for example `01_select_from.sql`.
- Keep folder names aligned with topic order.
- Use lowercase file names with underscores.

## Header Template
Use a simple header at the top of each lesson:

```sql
-- Topic: Select from tables
-- Goal: Learn how to read data from a table
-- Prerequisite: Create the sample database first
```

## Formatting Rules
- Keep one idea per script when possible.
- Use short comments to explain why a query is written a certain way.
- Prefer readable aliases such as `c` for customer, `o` for order, and `p` for product.
- Format SQL consistently with keywords on separate lines when the query is longer than one line.
- End each statement clearly with `;` when practical.

## Beginner-Friendly Rules
- Introduce one concept at a time.
- Show sample output intent in comments when that helps the learner.
- Add exercises at the end of each script.
- Explain new terms the first time they appear.
- Avoid packed examples that mix too many features into one query.
