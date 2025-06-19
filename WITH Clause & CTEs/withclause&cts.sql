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

-- 🔹 Simple CTE to get high earners
WITH HighEarners AS (
    SELECT emp_id, emp_name, salary
    FROM employees
    WHERE salary > 60000
)
SELECT * FROM HighEarners;

-- 🔹 CTE used with Aggregation
WITH DepartmentSalary AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT * FROM DepartmentSalary
WHERE avg_salary > 60000;

-- 🔹 Chaining Multiple CTEs
WITH DeptAvg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
),
AboveAvgEmps AS (
    SELECT e.emp_id, e.emp_name, e.salary, d.avg_salary
    FROM employees e
    JOIN DeptAvg d ON e.department_id = d.department_id
    WHERE e.salary > d.avg_salary
)
SELECT * FROM AboveAvgEmps;

-- 🔹 Recursive CTE example (Fibonacci Series)
WITH RECURSIVE fib(n, value) AS (
    SELECT 1, 0
    UNION ALL
    SELECT 2, 1
    UNION ALL
    SELECT n + 1, (SELECT value FROM fib WHERE n = fib.n - 1) + (SELECT value FROM fib WHERE n = fib.n - 2)
    WHERE n < 10
)
SELECT * FROM fib;
