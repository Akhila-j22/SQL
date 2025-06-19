-- Sample Table: employees
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department_id INT,
    salary INT
);

-- Sample Data
INSERT INTO employees VALUES (1, 'Akhil', 101, 60000);
INSERT INTO employees VALUES (2, 'Priya', 101, 55000);
INSERT INTO employees VALUES (3, 'Karan', 102, 75000);
INSERT INTO employees VALUES (4, 'Sneha', 102, 80000);
INSERT INTO employees VALUES (5, 'Neha', 101, 65000);

-- COUNT(): Total number of employees
SELECT COUNT(*) AS total_employees FROM employees;

-- SUM(): Total salary paid
SELECT SUM(salary) AS total_salary FROM employees;

-- AVG(): Average salary
SELECT AVG(salary) AS average_salary FROM employees;

-- MAX(): Highest salary
SELECT MAX(salary) AS highest_salary FROM employees;

-- MIN(): Lowest salary
SELECT MIN(salary) AS lowest_salary FROM employees;

-- GROUP_CONCAT(): List employees in each department
SELECT department_id, GROUP_CONCAT(emp_name) AS employee_names
FROM employees
GROUP BY department_id;

-- Aggregate with GROUP BY
SELECT department_id, COUNT(*) AS emp_count, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;
