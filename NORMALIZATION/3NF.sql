-- ❌ TABLE VIOLATING 3NF
-- Problem: Transitive dependency — dept_name depends on dept_id, which isn't a primary key.

CREATE TABLE employees_raw (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    dept_name VARCHAR(100)
);

INSERT INTO employees_raw VALUES 
(1, 'Akhil', 101, 'HR'),
(2, 'Priya', 102, 'IT');

SELECT * FROM employees_raw;

-- ✅ FIXED TABLES: ELIMINATE TRANSITIVE DEPENDENCY

-- Step 1: Employee Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT
);

INSERT INTO employees VALUES 
(1, 'Akhil', 101),
(2, 'Priya', 102);

-- Step 2: Department Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

INSERT INTO departments VALUES 
(101, 'HR'),
(102, 'IT');

-- ✅ JOIN TO VIEW COMPLETE DATA
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
