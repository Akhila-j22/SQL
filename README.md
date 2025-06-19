# 🚀 SQL Complete Reference

Welcome to the **SQL Complete Reference** 👨‍💻  
This repo is your clean and clear guide to learning SQL — from basics to advanced. Everything you need is here, no boring theory, just the good stuff 💡

---

## 📚 What’s Covered?

### 🏗️ 1. DDL – Data Definition Language
Create and manage your database structure:
- `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, `RENAME`

### ✏️ 2. DML – Data Manipulation Language
Work with data inside the tables:
- `INSERT`, `UPDATE`, `DELETE`, `MERGE`

### 🔍 3. DQL – Data Query Language
- `SELECT` – fetch data with conditions, sorting, grouping

### 🛡️ 4. DCL – Data Control Language
- `GRANT`, `REVOKE` – manage permissions

### 🔁 5. TCL – Transaction Control Language
- `COMMIT`, `ROLLBACK`, `SAVEPOINT`, `SET TRANSACTION`

---

## 🔗 Joins
Combine data from multiple tables:
- `INNER`, `LEFT`, `RIGHT`, `FULL OUTER`, `SELF`, `CROSS`, `NATURAL`

---

## 🔄 Set Operations
Work with multiple `SELECT` results:
- `UNION`, `UNION ALL`, `INTERSECT`, `EXCEPT` / `MINUS`

---

## ✅ Constraints
Keep your data clean and valid:
- `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `CHECK`, `DEFAULT`

---

## 📊 Aggregate Functions
Work with groups of data:
- `COUNT()`, `SUM()`, `AVG()`, `MAX()`, `MIN()`, `GROUP_CONCAT()`

---

## ⚙️ Logical & Conditional Functions
Smart query logic:
- `CASE`, `IF()`, `COALESCE()`, `NULLIF()`, `IFNULL()`

---

## 🧠 Clauses
Make your queries powerful:
- `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT`, `DISTINCT`, `IN`, `BETWEEN`, `LIKE`, `EXISTS`, etc.

---

## 🪟 Window Functions
Advanced analytics without collapsing rows:
- `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LEAD()`, `LAG()`, `NTILE()`, `SUM() OVER()`, etc.

---

## 🔁 Subqueries
Query inside a query:
- Scalar, multi-row, correlated  
- Used in `SELECT`, `FROM`, `WHERE` clauses

---

## 🧾 WITH Clause & CTEs
Reusable and readable logic using `WITH`

### Simple CTE
```sql
WITH top_users AS (
  SELECT id, name FROM users WHERE status = 'active'
)
SELECT * FROM top_users;
```

### Recursive CTE
```sql
WITH RECURSIVE nums AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM nums WHERE n < 5
)
SELECT * FROM nums;
```

---

## 👓 Views & Indexes
- `VIEW` – virtual table  
- `MATERIALIZED VIEW` – stored query result  
- `INDEX` – speeds up searching

---

## ⚡ Triggers, Procedures, Functions
- `TRIGGER` – auto action on insert/update/delete  
- `PROCEDURE` – stored logic blocks  
- `FUNCTION` – reusable return-type functions

---

## 🔄 Normalization
Designing smart table structures:
- 1NF, 2NF, 3NF, BCNF, 4NF, 5NF

---

## 🙋‍♀️ Created with ❤️ by

**Akhila Juturu**  
📧 [jakhilareddy2204@gmail.com](jakhilareddy2204@gmail.com)

This repo was made to simplify SQL for learners, coders & curious minds 🌱

---

If this helped you,  
**drop a ⭐ star** and spread the knowledge.  
Because learning SQL should feel light, not heavy 💙
