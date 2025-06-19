# 📦 WITH Clause & CTEs (Common Table Expressions) in SQL

A **CTE (Common Table Expression)** is a named temporary result set that you can reference within a `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statement. It makes queries **modular, readable**, and enables **recursive logic**.

---

## 🧠 Syntax

```sql
WITH cte_name AS (
    SELECT ...
)
SELECT * FROM cte_name;
```

---

## ✅ Use Cases

- Simplify complex logic
- Reuse intermediate query results
- Perform recursive operations (like hierarchies, trees)
- Replace subqueries for better readability

---

## 🧱 Sample Data

### Table: `employees`

| emp_id | emp_name | department_id | salary |
|--------|----------|---------------|--------|
| 1      | Akhil    | 101           | 60000  |
| 2      | Priya    | 101           | 75000  |
| 3      | Karan    | 102           | 50000  |
| 4      | Sneha    | 103           | 90000  |
| 5      | Neha     | 103           | 60000  |

---

## 🔹 Example 1: Simple CTE – High Earners

```sql
WITH HighEarners AS (
    SELECT emp_id, emp_name, salary
    FROM employees
    WHERE salary > 60000
)
SELECT * FROM HighEarners;
```

📌 Employees earning more than ₹60,000.

🧾 Output:

| emp_id | emp_name | salary |
|--------|----------|--------|
| 2      | Priya    | 75000  |
| 4      | Sneha    | 90000  |

---

## 🔹 Example 2: CTE with Aggregation

```sql
WITH DepartmentSalary AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT * FROM DepartmentSalary
WHERE avg_salary > 60000;
```

🧾 Output:

| department_id | avg_salary |
|---------------|------------|
| 101           | 67500      |
| 103           | 75000      |

---

## 🔹 Example 3: Chained CTE – Above Avg Employees

```sql
WITH DeptAvg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
),
AboveAvgEmps AS (
    SELECT e.emp_id, e.emp_name, e.salary, d.avg_salary
    FROM employees e
    JOIN DeptAvg d ON e.department_id = d.department_id
    WHERE e.salary > d.avg_salary
)
SELECT * FROM AboveAvgEmps;
```

🧾 Output:

| emp_id | emp_name | salary | avg_salary |
|--------|----------|--------|------------|
| 2      | Priya    | 75000  | 67500      |
| 4      | Sneha    | 90000  | 75000      |

---

## 🔁 Example 4: Recursive CTE – Fibonacci (first 5 terms)

```sql
WITH RECURSIVE fib(n, value) AS (
    SELECT 1, 0
    UNION ALL
    SELECT 2, 1
    UNION ALL
    SELECT n + 1,
        (SELECT value FROM fib WHERE n = fib.n - 1) + 
        (SELECT value FROM fib WHERE n = fib.n - 2)
    WHERE n < 5
)
SELECT * FROM fib;
```

🧾 Output:

| n | value |
|---|-------|
| 1 | 0     |
| 2 | 1     |
| 3 | 1     |
| 4 | 2     |
| 5 | 3     |

*Note: Recursive queries vary slightly based on the SQL engine you use. This form may need slight adjustments in MySQL.*

---

## 💎 Benefits of Using CTEs

- ✅ Easier to understand than nested subqueries
- ✅ Helps in debugging step-by-step
- ✅ Cleaner when chaining logic
- ✅ Enables recursion for hierarchical or looping operations

---

If this helped you,  
**drop a ⭐ star** and pass it on to others.  
Let’s make SQL simple, strong, and worth loving 💙

---

**Author:** Akhila Juturu  
📩 jakhilareddy2204@gmail.com
