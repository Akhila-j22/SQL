# 📊 SQL Aggregate Functions – With Real Examples

SQL aggregate functions are used to **perform calculations on groups of rows** and return a single value.

These are commonly used in combination with `GROUP BY`.

---

## 🔢 COUNT()

Returns the **number of rows** (non-NULL values).

```sql
SELECT COUNT(*) AS total_employees
FROM employees;
```

📌 Use to count all employees.

🧾 **Output:**

| total_employees |
|-----------------|
| 50              |

---

## ➕ SUM()

Returns the **total sum** of a numeric column.

```sql
SELECT SUM(salary) AS total_salary
FROM employees;
```

📌 Use to find the total payroll amount.

🧾 **Output:**

| total_salary |
|--------------|
| 3500000      |

---

## 📈 AVG()

Returns the **average value** of a numeric column.

```sql
SELECT AVG(salary) AS average_salary
FROM employees;
```

📌 Use to calculate the average salary of employees.

🧾 **Output:**

| average_salary |
|----------------|
| 70000          |

---

## 📌 MAX()

Returns the **maximum value** from a column.

```sql
SELECT MAX(salary) AS highest_salary
FROM employees;
```

📌 Use to find the top-paid employee.

🧾 **Output:**

| highest_salary |
|----------------|
| 120000         |

---

## 📍 MIN()

Returns the **minimum value** from a column.

```sql
SELECT MIN(salary) AS lowest_salary
FROM employees;
```

📌 Use to find the lowest-paid employee.

🧾 **Output:**

| lowest_salary |
|---------------|
| 25000         |

---

## 🧠 GROUP_CONCAT() *(MySQL specific)*

Returns a **comma-separated string** of values from a group.

```sql
SELECT department_id, GROUP_CONCAT(emp_name) AS employees_list
FROM employees
GROUP BY department_id;
```

📌 Use to combine employee names department-wise.

🧾 **Output:**

| department_id | employees_list          |
|---------------|--------------------------|
| 101           | Akhil,Priya,Neha         |
| 102           | Karan,Sneha              |

---

## 🎯 Use with GROUP BY

All aggregate functions become more powerful when used with `GROUP BY`.

```sql
SELECT department_id, COUNT(*) AS count, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;
```

🧾 **Output:**

| department_id | count | avg_salary |
|---------------|-------|------------|
| 101           | 3     | 60000      |
| 102           | 2     | 75000      |

---

## 🧠 Summary Table

| Function       | Purpose                            |
|----------------|-------------------------------------|
| `COUNT()`      | Count total rows                    |
| `SUM()`        | Add numeric values                  |
| `AVG()`        | Average of values                   |
| `MAX()`        | Highest value                       |
| `MIN()`        | Lowest value                        |
| `GROUP_CONCAT()` | Combine values into one string (MySQL) |

---

If this helped you,  
**drop a ⭐ star** and pass it on to others.  
Let’s make SQL simple, strong, and worth loving 💙

---

**Author:** Akhila Juturu 
📩 jakhilareddy2204@gmail.com
