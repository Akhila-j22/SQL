# 🔍 SQL Subqueries – The Query Inside a Query

A **subquery** is a SQL query nested inside another query. It helps you filter, compute, or transform data dynamically based on other queries.

---

## 🧠 Types of Subqueries

| Type              | Description                              | Placement           |
|-------------------|------------------------------------------|---------------------|
| Scalar Subquery   | Returns a single value                   | SELECT, WHERE       |
| Multi-row Subquery| Returns multiple values (e.g. with `IN`) | WHERE               |
| Correlated Subquery | Executes per row in outer query        | WHERE, SELECT       |

---

## 1️⃣ Scalar Subquery

Returns a **single value**, often used in filters or calculations.

```sql
SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);
```

📌 Finds employees earning **above the average salary**.

---

## 2️⃣ Multi-row Subquery

Returns multiple values — typically used with `IN`, `ANY`, `ALL`.

```sql
SELECT emp_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Mumbai'
);
```

📌 Employees working in **Mumbai-based departments**.

---

## 3️⃣ Correlated Subquery

Refers to outer query’s column — **runs once per outer row**.

```sql
SELECT emp_name, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);
```

📌 Employees **earning above their department’s average**.

---

## 4️⃣ Subquery in SELECT Clause

Returns a value used like a column in the main query.

```sql
SELECT emp_name,
  (SELECT department_name 
   FROM departments d 
   WHERE d.department_id = e.department_id) AS dept_name
FROM employees e;
```

📌 Show employee name along with **their department**.

---

## 5️⃣ Subquery in FROM Clause

Treats subquery result as a **temporary table**.

```sql
SELECT d.department_id, d.avg_salary
FROM (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) d
WHERE d.avg_salary > 60000;
```

📌 Departments with **average salary > 60k**.

---

If this helped you,  
**drop a ⭐ star** and pass it on to others.  
Let’s make SQL simple, strong, and worth loving 💙

---

**Author:** Akhila Juturu 
📩 jakhilareddy2204@gmail.com
