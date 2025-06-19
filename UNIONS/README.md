# 🔀 SQL UNION, UNION ALL, and SET OPERATIONS

This section explains how to combine datasets vertically using **UNION**, **UNION ALL**, and **SET operations** like **INTERSECT** and **MINUS** with real SQL examples.

---

## 🧩 What is UNION in SQL?

UNION is similar to **“Append”** in Power Query — used to combine rows **vertically**.

| Operation        | Description                            | Removes Duplicates? |
|------------------|----------------------------------------|----------------------|
| `UNION`          | Combines result sets                   | ✅ Yes               |
| `UNION ALL`      | Combines + keeps all duplicates        | ❌ No                |
| `UNION DISTINCT` | Same as `UNION` (specific to BigQuery) | ✅ Yes               |

---

## 🔗 Example 1: UNION (removes duplicates)

```sql
SELECT COUNT(*) FROM (
    SELECT * FROM employees
    UNION
    SELECT * FROM employees
) AS emp;
```

✅ Will count only **unique** rows.

---

## 🔗 Example 2: UNION ALL (keeps duplicates)

```sql
SELECT COUNT(*) FROM (
    SELECT * FROM employees
    UNION ALL
    SELECT * FROM employees
) AS emp;
```

✅ Will count **all rows** including **duplicates**.

---

## 🔗 Example 3: UNION DISTINCT (BigQuery-specific)

```sql
SELECT COUNT(*) FROM (
    SELECT * FROM employees
    UNION DISTINCT
    SELECT * FROM employees
) AS emp;
```

✅ Same as UNION, but **syntax used in BigQuery**.

---

## 🎯 Using Specific Columns in UNION

```sql
SELECT COUNT(*) FROM (
    SELECT employee_id, first_name, last_name FROM employees
    UNION
    SELECT employee_id, first_name, last_name FROM employees
) AS emp;
```

Use this when you don’t need all columns — only **common ones**.

---

## 📌 Using WHERE clause in UNION

```sql
SELECT employee_id, first_name, last_name FROM employees
WHERE department_id = 50
UNION
SELECT employee_id, first_name, last_name FROM employees
WHERE department_id = 60;
```

📌 Combines employees from departments 50 and 60, **removing duplicates**.

---

## 🧠 Complex Queries inside UNION

```sql
SELECT * FROM (
    SELECT department_id, COUNT(*) FROM employees
    GROUP BY department_id
    ORDER BY department_id
) AS emp
UNION
SELECT * FROM (
    SELECT department_id, COUNT(*) FROM employees
    GROUP BY department_id
    ORDER BY department_id
) AS emp;
```

⚡ Useful when combining **aggregated results**.

---

## 🧱 SET OPERATIONS (in Oracle SQL only)

> These are not supported in MySQL but can be simulated using JOINs.

---

## 🔁 INTERSECT

Returns **common rows** from both result sets.

```sql
SELECT * FROM (
    SELECT department_id FROM employees
    GROUP BY department_id
    HAVING COUNT(*) > 3
) AS emp
INTERSECT
SELECT department_id FROM employees
WHERE location_id = 1700 AS emp;
```

📌 Get departments:
- That have **more than 3 employees**
- And belong to **location = 1700**

---

## ➖ MINUS

Returns rows **from the first query** that are **not in the second**.

```sql
SELECT * FROM (
    SELECT department_id FROM employees
    GROUP BY department_id
    HAVING COUNT(*) > 3
) AS emp
MINUS
SELECT department_id FROM employees
GROUP BY department_id
HAVING AVG(salary) < 5000 AS emp;
```

📌 Get departments:
- With **more than 3 employees**
- But **exclude** departments with **avg salary < 5000**

---

## 🧠 Summary Table

| Operator         | Works In     | Removes Duplicates | Usage                        |
|------------------|--------------|---------------------|------------------------------|
| `UNION`          | All RDBMS    | ✅ Yes              | Combine and remove duplicates |
| `UNION ALL`      | All RDBMS    | ❌ No               | Combine and keep everything   |
| `INTERSECT`      | Oracle, PG   | ✅ Yes              | Common data only              |
| `MINUS`          | Oracle       | ✅ Yes              | Difference (A - B)            |
| `UNION DISTINCT` | BigQuery     | ✅ Yes              | Same as UNION                 |

---

If this helped you,  
**drop a ⭐ star** and pass it on to others.  
Let’s make SQL simple, strong, and worth loving 💙

---

**Author:** Akhila Juturu
📩 jakhilareddy2204@gmail.com
