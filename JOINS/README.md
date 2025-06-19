# 📘 SQL JOINS – Real World Examples

This section demonstrates **all types of SQL JOINs** using real-world relatable examples — with sample data, queries, outputs, and when to use what.

---

## 🧱 Sample Tables Used

### employees

| emp_id | emp_name | dept_id |
|--------|----------|---------|
| 1      | Akhil    | 101     |
| 2      | Priya    | 102     |
| 3      | Karan    | 103     |
| 4      | Sneha    | NULL    |

### departments

| dept_id | dept_name |
|---------|-----------|
| 101     | HR        |
| 102     | IT        |
| 104     | Finance   |

---

## 🔗 INNER JOIN

```sql
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;
```

📌 **Purpose**:  
Returns **only the matching rows** from both tables.

🧾 **Output**:

| emp_id | emp_name | dept_name |
|--------|----------|-----------|
| 1      | Akhil    | HR        |
| 2      | Priya    | IT        |

---

## 🔗 LEFT JOIN

```sql
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;
```

📌 **Purpose**:  
Returns **all employees**, including those not assigned to any department.

🧾 **Output**:

| emp_id | emp_name | dept_name |
|--------|----------|-----------|
| 1      | Akhil    | HR        |
| 2      | Priya    | IT        |
| 3      | Karan    | NULL      |
| 4      | Sneha    | NULL      |

---

## 🔍 LEFT ANTI JOIN

```sql
SELECT e.emp_id, e.emp_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;
```

📌 **Purpose**:  
Returns employees **not mapped to any department**.

🧾 **Output**:

| emp_id | emp_name |
|--------|----------|
| 3      | Karan    |
| 4      | Sneha    |

---

## 🔗 RIGHT JOIN

```sql
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;
```

📌 **Purpose**:  
Returns **all departments**, including ones with **no assigned employees**.

🧾 **Output**:

| emp_id | emp_name | dept_name |
|--------|----------|-----------|
| 1      | Akhil    | HR        |
| 2      | Priya    | IT        |
| NULL   | NULL     | Finance   |

---

## 🔍 RIGHT ANTI JOIN

```sql
SELECT d.dept_id, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;
```

📌 **Purpose**:  
Find **departments that have no employees**.

🧾 **Output**:

| dept_id | dept_name |
|---------|-----------|
| 104     | Finance   |

---

## 🔄 FULL OUTER JOIN (via UNION)

```sql
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;
```

📌 **Purpose**:  
Returns **all records — matched and unmatched — from both tables**.

🧾 **Output**:

| emp_id | emp_name | dept_name |
|--------|----------|-----------|
| 1      | Akhil    | HR        |
| 2      | Priya    | IT        |
| 3      | Karan    | NULL      |
| 4      | Sneha    | NULL      |
| NULL   | NULL     | Finance   |

---

## 🔁 CROSS JOIN

```sql
SELECT e.emp_name, d.dept_name
FROM employees e
CROSS JOIN departments d;
```

📌 **Purpose**:  
Returns **all combinations** of employees × departments (cartesian product).

🧾 **Output** (4 × 3 = 12 rows):

| emp_name | dept_name |
|----------|-----------|
| Akhil    | HR        |
| Akhil    | IT        |
| Akhil    | Finance   |
| Priya    | HR        |
| Priya    | IT        |
| Priya    | Finance   |
| Karan    | HR        |
| Karan    | IT        |
| Karan    | Finance   |
| Sneha    | HR        |
| Sneha    | IT        |
| Sneha    | Finance   |

---

If this helped you,  
**drop a ⭐ star** and pass it on to others.  
Let’s make SQL simple, strong, and worth loving 💙

---

**Author:** Akhila Juturu 
📩 jakhilareddy2204@gmail.com
