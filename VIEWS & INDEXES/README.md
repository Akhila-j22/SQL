# 👓 Views, Materialized Views & Indexes in SQL

This guide explains the difference between **Views**, **Materialized Views**, and **Indexes** — with examples, queries, and outputs.

---

## 📄 VIEW – Virtual Table

A **view** is a saved SQL query that behaves like a virtual table. It doesn't store data but reflects the result dynamically from the base tables.

### 🔹 Example

```sql
CREATE VIEW high_salary_emps AS
SELECT emp_id, emp_name, salary
FROM employees
WHERE salary > 60000;

SELECT * FROM high_salary_emps;
```

### 🧾 Output:

| emp_id | emp_name | salary |
|--------|----------|--------|
| 2      | Priya    | 75000  |
| 4      | Sneha    | 90000  |

✅ When the `employees` table updates, the view reflects it immediately.

---

## 📦 MATERIALIZED VIEW – Stored Result (like a snapshot)

Unlike a normal view, a **materialized view** stores the result in the database. It **needs manual refresh** when source data changes.

> 📝 Not supported natively in MySQL; simulated using a physical table.

### 🔹 Simulated Example (MySQL)

```sql
CREATE TABLE dept_avg_salary_mv AS
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;
```

📌 This acts like a snapshot.

#### 🔄 Manual Refresh:

```sql
DELETE FROM dept_avg_salary_mv;
INSERT INTO dept_avg_salary_mv
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;
```

### 🧾 Output:

| department_id | avg_salary |
|---------------|------------|
| 101           | 67500      |
| 102           | 50000      |
| 103           | 75000      |

---

## 🚀 INDEX – Speed Booster for Queries

An **index** is a data structure that makes searching faster — like a book's table of contents.

### 🔹 Creating Indexes

```sql
CREATE INDEX idx_department_id ON employees(department_id);
CREATE INDEX idx_salary ON employees(salary);
```

📌 Indexes speed up queries like:

```sql
SELECT * FROM employees WHERE department_id = 101;
```

---

## 🧪 EXPLAIN – Check Index Usage

```sql
EXPLAIN SELECT * FROM employees WHERE department_id = 101;
```

📌 This will show whether your query uses the index (`idx_department_id`).

---

## 🔍 When to Use What?

| Feature             | Purpose                             | Storage | Refresh Needed |
|---------------------|--------------------------------------|---------|----------------|
| View                | Virtual table for query reuse        | ❌ No   | ❌ No          |
| Materialized View   | Stores result for faster retrieval   | ✅ Yes  | ✅ Yes         |
| Index               | Speeds up WHERE/ORDER/GROUP BY       | ✅ Yes  | ❌ No          |

---

If this helped you,  
**drop a ⭐ star** and pass it on to others.  
Let’s make SQL simple, strong, and worth loving 💙

---

**Author:** Akhila Juturu  
📩 jakhilareddy2204@gmail.com
