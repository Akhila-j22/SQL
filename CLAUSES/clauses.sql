-- Sample Table
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(100),
    department_id INT,
    salary INT
);

-- Sample Data
INSERT INTO employees VALUES (1, 'Akhil', 101, 60000);
INSERT INTO employees VALUES (2, 'Priya', 101, 55000);
INSERT INTO employees VALUES (3, 'Karan', 102, 70000);
INSERT INTO employees VALUES (4, 'Sneha', 102, 80000);
INSERT INTO employees VALUES (5, 'Neha', 103, 60000);
INSERT INTO employees VALUES (6, 'Aarav', NULL, 40000);
INSERT INTO employees VALUES (7, 'Kriti', 103, 90000);

-- WHERE: filter records
SELECT * FROM employees
WHERE department_id = 101;

-- GROUP BY: group and aggregate
SELECT department_id, COUNT(*) AS emp_count
FROM employees
GROUP BY department_id;

-- HAVING: condition after grouping
SELECT department_id, COUNT(*) AS emp_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 1;

-- ORDER BY: sort results
SELECT * FROM employees
ORDER BY salary DESC;

-- LIMIT: restrict number of rows
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 3;

-- DISTINCT: unique values
SELECT DISTINCT department_id FROM employees;

-- IN: match any value in list
SELECT * FROM employees
WHERE department_id IN (101, 102);

-- BETWEEN: range filter
SELECT * FROM employees
WHERE salary BETWEEN 55000 AND 80000;

-- LIKE: pattern matching
SELECT * FROM employees
WHERE emp_name LIKE 'A%';  -- Starts with A

-- EXISTS: subquery check
-- Get departments that have employees
CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(100)
);

INSERT INTO departments VALUES (101, 'HR'), (102, 'IT'), (103, 'Finance'), (104, 'Marketing');

SELECT department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);
