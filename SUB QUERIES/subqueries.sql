-- Sample Tables
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department_id INT,
    salary INT
);

CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

-- Sample Data
INSERT INTO employees VALUES 
(1, 'Akhil', 101, 60000),
(2, 'Priya', 101, 75000),
(3, 'Karan', 102, 50000),
(4, 'Sneha', 103, 90000),
(5, 'Neha', 103, 60000);

INSERT INTO departments VALUES 
(101, 'HR', 'Hyderabad'),
(102, 'IT', 'Delhi'),
(103, 'Finance', 'Mumbai');

-- 1️⃣ Scalar Subquery (returns one value)
SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);

-- 2️⃣ Multi-row Subquery (with IN)
SELECT emp_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Mumbai'
);

-- 3️⃣ Correlated Subquery (runs per row)
SELECT emp_name, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- 4️⃣ Subquery in SELECT clause
SELECT emp_name,
  (SELECT department_name FROM departments d WHERE d.department_id = e.department_id) AS dept_name
FROM employees e;

-- 5️⃣ Subquery in FROM clause
SELECT d.department_id, d.avg_salary
FROM (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) d
WHERE d.avg_salary > 60000;
