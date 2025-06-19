# 🧠 SQL Control Flow & Null Handling Functions

These SQL functions help in writing **dynamic logic**, **handling NULLs**, and **customizing output** directly in your queries.

---

## 🎯 CASE

Acts like an **if-else ladder**. Evaluates conditions and returns a value.

```sql
SELECT emp_name, salary,
  CASE
    WHEN salary >= 70000 THEN 'High'
    WHEN salary BETWEEN 50000 AND 69999 THEN 'Medium'
    ELSE 'Low'
  END AS salary_grade
FROM employees;
```

📌 Use to create custom categories like “salary levels”.

---

## 🧪 IF() *(MySQL Specific)*

Acts like a **ternary operator**: `IF(condition, value_if_true, value_if_false)`

```sql
SELECT emp_name, salary,
  IF(salary >= 70000, 'High', 'Not High') AS salary_label
FROM employees;
```

📌 Simple one-line condition check.

---

## 🌈 COALESCE()

Returns the **first non-NULL** value in the list of inputs.

```sql
SELECT emp_name,
  COALESCE(bonus, 0) AS final_bonus
FROM employees;
```

📌 Use when multiple columns may contain NULL — returns fallback.

---

## 🪞 NULLIF()

Returns `NULL` if both values are **equal**, otherwise returns the **first** value.

```sql
SELECT salary, bonus,
  NULLIF(bonus, 0) AS safe_divisor
FROM employees;
```

📌 Use to **avoid divide-by-zero** errors in calculations.

---

## 🛟 IFNULL() *(MySQL Specific)*

Returns a **fallback value** if the first argument is `NULL`.

```sql
SELECT emp_name, IFNULL(department_id, 0) AS dept_id_safe
FROM employees;
```

📌 Like `COALESCE()` but only checks two values.

---

## 🧠 Summary Table

| Function     | Purpose                                      |
|--------------|----------------------------------------------|
| `CASE`       | Conditional logic (multi-branch)             |
| `IF()`       | Simple if-else logic (MySQL only)            |
| `COALESCE()` | First non-null from list                     |
| `NULLIF()`   | Returns NULL if two values are equal         |
| `IFNULL()`   | Replace NULL with fallback value (MySQL only) |

---

If this helped you,  
**drop a ⭐ star** and pass it on to others.  
Let’s make SQL simple, strong, and worth loving 💙

---

**Author:** Akhila Juturu  
📩 jakhilareddy2204@gmail.com
