# 🔍 Essential SQL Clauses & Operators – With Examples

This guide covers the most commonly used SQL clauses that filter, group, sort, and limit data, along with powerful condition-based operators.

---

## 📌 WHERE

Filters records based on a condition.

```sql
SELECT * FROM employees
WHERE department_id = 101;
```

📌 Returns only employees in department 101.

---

## 🧮 GROUP BY

Groups rows that have the same values in specified columns.

```sql
SELECT department_id, COUNT(*) AS emp_count
FROM employees
GROUP BY department_id;
```

📌 Returns number of employees in each department.

---

## 🧾 HAVING

Applies conditions to groups (used with `GROUP BY`).

```sql
SELECT department_id, COUNT(*) AS emp_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 2;
```

📌 Returns departments with more than 2 employees.

---

## 📋 ORDER BY

Sorts the result set in ascending or descending order.

```sql
SELECT * FROM employees
ORDER BY salary DESC;
```

📌 Lists employees from highest to lowest salary.

---

## 📉 LIMIT

Restricts the number of rows returned.

```sql
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 5;
```

📌 Returns top 5 highest-paid employees.

---

## ✨ DISTINCT

Removes duplicate values from the result set.

```sql
SELECT DISTINCT department_id
FROM employees;
```

📌 Lists unique department IDs.

---

## 📂 IN

Checks if a value matches **any value** in a list.

```sql
SELECT * FROM employees
WHERE department_id IN (101, 102, 103);
```

📌 Filters employees belonging to multiple departments.

---

## 🔲 BETWEEN

Checks whether a value lies **within a range**.

```sql
SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 80000;
```

📌 Filters salaries within that range (inclusive).

---

## 🔍 LIKE

Performs **pattern matching** using wildcards (`%`, `_`).

```sql
SELECT * FROM employees
WHERE emp_name LIKE 'A%';
```

📌 Returns names starting with 'A'.

---

## 🧠 EXISTS

Checks whether a **subquery returns any rows**.

```sql
SELECT department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);
```

📌 Returns only departments that have employees.

---

## 🧠 Summary Table

| Clause/Operator | Purpose                              |
|------------------|--------------------------------------|
| `WHERE`          | Filter rows based on condition       |
| `GROUP BY`       | Group rows for aggregation           |
| `HAVING`         | Filter grouped results               |
| `ORDER BY`       | Sort results                         |
| `LIMIT`          | Restrict number of output rows       |
| `DISTINCT`       | Remove duplicates                    |
| `IN`             | Match value from list                |
| `BETWEEN`        | Match range of values                |
| `LIKE`           | Match pattern using wildcards        |
| `EXISTS`         | Check if subquery returns rows       |

---

If this helped you,  
**drop a ⭐ star** and pass it on to others.  
Let’s make SQL simple, strong, and worth loving 💙

---

**Author:** Akhila Juturu 
📩 jakhilareddy2204@gmail.com
