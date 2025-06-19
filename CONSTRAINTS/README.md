# 🔐 SQL Constraints – Complete Guide with Examples

SQL **constraints** are rules applied to table columns to enforce data integrity, accuracy, and reliability. They ensure that the data in your database stays valid and consistent.

---

## 🔑 PRIMARY KEY

A column (or group of columns) that **uniquely identifies each row** in the table. It cannot contain `NULL` or duplicate values.

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);
```

📌 `student_id` is the primary key — each student must have a unique ID.

---

## 🌐 FOREIGN KEY

Used to **link two tables**. It refers to the **PRIMARY KEY of another table**.

```sql
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
```

📌 `dept_id` in `employees` must match an existing `dept_id` in `departments`.

---

## ✨ UNIQUE

Ensures that **all values in a column are different**. Unlike primary key, it can contain **NULL** (but only one if the DBMS allows).

```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
```

📌 No two users can have the same email.

---

## 🚫 NOT NULL

Prevents a column from having `NULL` values. Ensures that the field **must always have a value**.

```sql
CREATE TABLE contacts (
    contact_id INT PRIMARY KEY,
    phone_number VARCHAR(15) NOT NULL
);
```

📌 You **must** enter a phone number for each contact.

---

## 🔍 CHECK

Validates that the values in a column **meet a specific condition**.

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT CHECK (age >= 18)
);
```

📌 Ensures that all employees are **18 or older**.

---

## 📦 DEFAULT

Sets a **default value** for a column when no value is provided.

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    status VARCHAR(20) DEFAULT 'Pending'
);
```

📌 If no status is provided while inserting a row, `'Pending'` is used by default.

---

## 🧠 Summary Table

| Constraint    | Description                                      |
|---------------|--------------------------------------------------|
| `PRIMARY KEY` | Uniquely identifies each record, no nulls       |
| `FOREIGN KEY` | Connects tables via reference                   |
| `UNIQUE`      | Ensures all values in a column are unique       |
| `NOT NULL`    | Prevents null values in the column              |
| `CHECK`       | Validates input using a condition               |
| `DEFAULT`     | Sets a default value for a column               |

---

If this helped you,  
**drop a ⭐ star** and pass it on to others.  
Let’s make SQL simple, strong, and worth loving 💙

---

**Author:** Akhila Juturu 
📩 jakhilareddy2204@gmail.com
