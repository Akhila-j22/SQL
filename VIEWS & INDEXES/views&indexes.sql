-- Sample Table
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department_id INT,
    salary INT
);

INSERT INTO employees VALUES 
(1, 'Akhil', 101, 60000),
(2, 'Priya', 101, 75000),
(3, 'Karan', 102, 50000),
(4, 'Sneha', 103, 90000),
(5, 'Neha', 103, 60000);

-- 🔹 Basic VIEW (Virtual Table)
CREATE VIEW high_salary_emps AS
SELECT emp_id, emp_name, salary
FROM employees
WHERE salary > 60000;

SELECT * FROM high_salary_emps;

-- 🔹 Update VIEW if needed
CREATE OR REPLACE VIEW high_salary_emps AS
SELECT emp_id, emp_name, salary, department_id
FROM employees
WHERE salary > 60000;

-- 🔹 MATERIALIZED VIEW (example syntax in PostgreSQL/Oracle)
-- Not supported in MySQL by default
-- PostgreSQL syntax:
-- CREATE MATERIALIZED VIEW dept_avg_salary AS
-- SELECT department_id, AVG(salary) AS avg_salary
-- FROM employees
-- GROUP BY department_id;

-- 🔹 Simulated Materialized View (MySQL):
CREATE TABLE dept_avg_salary_mv AS
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

SELECT * FROM dept_avg_salary_mv;

-- 🔹 Refreshing a simulated materialized view
DELETE FROM dept_avg_salary_mv;
INSERT INTO dept_avg_salary_mv
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

-- 🔹 INDEX creation
CREATE INDEX idx_department_id ON employees(department_id);
CREATE INDEX idx_salary ON employees(salary);

-- 🔍 EXPLAIN plan to check index usage (MySQL)
EXPLAIN SELECT * FROM employees WHERE department_id = 101;
