-- 1. Basic SELECT
SELECT * FROM employees;

-- 2. SELECT specific columns
SELECT first_name, last_name, department FROM employees;

-- 3. SELECT with WHERE condition
SELECT * FROM employees
WHERE department = 'Sales';

-- 4. Using AND, OR
SELECT * FROM employees
WHERE department = 'Sales' AND salary > 50000;

-- 5. Using BETWEEN
SELECT * FROM employees
WHERE hire_date BETWEEN '2020-01-01' AND '2023-01-01';

-- 6. Using LIKE for pattern matching
SELECT * FROM employees
WHERE first_name LIKE 'A%';

-- 7. Using IN operator
SELECT * FROM employees
WHERE department IN ('HR', 'Finance', 'IT');

-- 8. Using ORDER BY
SELECT * FROM employees
ORDER BY salary DESC;

-- 9. Using LIMIT (MySQL) / FETCH FIRST (PostgreSQL, Oracle 12c+)
SELECT * FROM employees
ORDER BY hire_date DESC
LIMIT 5;

-- 10. Using GROUP BY and HAVING
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

-- 11. Aggregate with WHERE
SELECT AVG(salary) AS avg_salary
FROM employees
WHERE department = 'Engineering';

-- 12. DISTINCT keyword
SELECT DISTINCT department FROM employees;

-- 13. Using ALIAS
SELECT first_name AS fname, salary AS monthly_income
FROM employees;

-- 14. Subquery in SELECT
SELECT employee_id,
       (SELECT department_name FROM departments WHERE departments.department_id = employees.department_id) AS dept_name
FROM employees;

-- 15. CASE expression
SELECT first_name,
       salary,
       CASE
           WHEN salary > 70000 THEN 'High'
           WHEN salary BETWEEN 40000 AND 70000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_range
FROM employees;
