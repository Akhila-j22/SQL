# ⚙️ Triggers, Procedures & Functions in SQL

This guide covers powerful database features that help you **automate, modularize, and reuse logic** — directly within SQL.

---

## 🚨 1. TRIGGERS – Auto Actions on Table Events

A **trigger** is a block of code that automatically executes in response to `INSERT`, `UPDATE`, or `DELETE` actions on a table.

### 🔹 Example: Insert Trigger on `employees`

```sql
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO audit_log(emp_id, action_type)
    VALUES (NEW.emp_id, 'INSERT');
END;
```

### 🧾 Output in `audit_log` after inserting employees:

| log_id | emp_id | action_type | action_time         |
|--------|--------|--------------|----------------------|
| 1      | 1      | INSERT       | 2025-06-19 10:20:00 |
| 2      | 2      | INSERT       | 2025-06-19 10:20:01 |

---

## 🧩 2. PROCEDURE – Reusable Logic Block (NO return)

A **stored procedure** is a group of SQL statements that performs an action. It’s reusable and callable using `CALL`.

### 🔹 Example: Increase Salary by % for a Given Employee

```sql
CREATE PROCEDURE update_salary (
    IN p_emp_id INT,
    IN percent_increase INT
)
BEGIN
    UPDATE employees
    SET salary = salary + (salary * percent_increase / 100)
    WHERE emp_id = p_emp_id;
END;
```

### 📞 Call It:

```sql
CALL update_salary(1, 10);
```

### 🧾 Output in `employees`:

| emp_id | emp_name | salary |
|--------|----------|--------|
| 1      | Akhil    | 66000  |
| 2      | Priya    | 75000  |

---

## 🔁 3. FUNCTION – Returns a Value

A **function** returns a single value and is used in `SELECT`, `WHERE`, or even inside other logic.

### 🔹 Example: Bonus Calculation (10% of salary)

```sql
CREATE FUNCTION get_bonus(salary INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END;
```

### 🧾 Usage:

```sql
SELECT emp_name, salary, get_bonus(salary) AS bonus
FROM employees;
```

### 📊 Output:

| emp_name | salary | bonus |
|----------|--------|--------|
| Akhil    | 66000  | 6600  |
| Priya    | 75000  | 7500  |

---

## 💡 Summary

| Feature     | Return Value | Used in            | Purpose                       |
|-------------|--------------|---------------------|-------------------------------|
| Trigger     | ❌ No         | Auto-fire on action | Audit, validation             |
| Procedure   | ❌ No         | CALL                | Multi-step logic reuse        |
| Function    | ✅ Yes        | SELECT, WHERE       | Reusable single-value logic   |

---

If this helped you,  
**drop a ⭐ star** and pass it on to others.  
Let’s make SQL simple, strong, and worth loving 💙

---

**Author:** Akhila Juturu  
📩 jakhilareddy2204@gmail.com
