-- Sample Table
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(100),
    department_id INT,
    salary INT,
    bonus INT
);

-- Sample Data
INSERT INTO employees VALUES (1, 'Akhil', 101, 60000, 5000);
INSERT INTO employees VALUES (2, 'Priya', 102, 70000, NULL);
INSERT INTO employees VALUES (3, 'Karan', 103, 55000, 4000);
INSERT INTO employees VALUES (4, 'Sneha', NULL, 80000, NULL);
INSERT INTO employees VALUES (5, 'Neha', 101, NULL, 3000);

-- CASE: Salary Grade based on salary
SELECT emp_name, salary,
  CASE
    WHEN salary >= 70000 THEN 'High'
    WHEN salary BETWEEN 50000 AND 69999 THEN 'Medium'
    ELSE 'Low'
  END AS salary_grade
FROM employees;

-- IF(): MySQL specific (acts like ternary operator)
SELECT emp_name, salary,
  IF(salary >= 70000, 'High', 'Not High') AS salary_label
FROM employees;

-- COALESCE(): First non-null value among the list
SELECT emp_name,
  COALESCE(bonus, 0) AS final_bonus
FROM employees;

-- NULLIF(): Returns NULL if both arguments are equal
-- Use case: Avoid divide-by-zero error
SELECT salary, bonus,
  NULLIF(bonus, 0) AS safe_divisor
FROM employees;

-- IFNULL(): Replaces NULL with given value (MySQL)
SELECT emp_name, IFNULL(department_id, 0) AS dept_id_safe
FROM employees;
