-- ----------------------------------------------------------------------------------
-- 📘 SQL JOINS (Horizontal Merge)
-- Purpose : Demonstrates all types of SQL JOINS with example data and output
-- ----------------------------------------------------------------------------------

-- 🧱 Sample Tables Creation & Data Insertion

CREATE TABLE table1 (
  emp_id INT,
  dep_id VARCHAR(10)
);

INSERT INTO table1 VALUES
  (10, 'eng'),
  (20, 'hr'),
  (30, 'IT'),
  (40, 'finance');

SELECT * FROM table1;

-- Output:
-- emp_id | dep_id
-- ------------------
-- 10     | eng
-- 20     | hr
-- 30     | IT
-- 40     | finance


CREATE TABLE table2 (
  emp_id INT,
  salary INT
);

INSERT INTO table2 VALUES
  (10, 5000),
  (20, 6000),
  (50, 8000),
  (60, 9000);

SELECT * FROM table2;

-- Output:
-- emp_id | salary
-- ----------------
-- 10     | 5000
-- 20     | 6000
-- 50     | 8000
-- 60     | 9000


-- 🔗 INNER JOIN
SELECT * FROM table1 a
INNER JOIN table2 b ON a.emp_id = b.emp_id;

-- Output:
-- emp_id | dep_id | emp_id | salary
-- -----------------------------------
-- 10     | eng    | 10     | 5000
-- 20     | hr     | 20     | 6000


-- 🔗 LEFT JOIN (LEFT OUTER JOIN)
SELECT * FROM table1 a
LEFT JOIN table2 b ON a.emp_id = b.emp_id;

-- Output:
-- emp_id | dep_id  | emp_id | salary
-- -----------------------------------
-- 10     | eng     | 10     | 5000
-- 20     | hr      | 20     | 6000
-- 30     | IT      | NULL   | NULL
-- 40     | finance | NULL   | NULL


-- 🔍 LEFT ANTI JOIN (Simulated)
SELECT * FROM table1 a
LEFT JOIN table2 b ON a.emp_id = b.emp_id
WHERE b.emp_id IS NULL;

-- Output:
-- emp_id | dep_id  | emp_id | salary
-- -----------------------------------
-- 30     | IT      | NULL   | NULL
-- 40     | finance | NULL   | NULL


-- 🔗 RIGHT JOIN (RIGHT OUTER JOIN)
SELECT * FROM table1 a
RIGHT JOIN table2 b ON a.emp_id = b.emp_id;

-- Output:
-- emp_id | dep_id | emp_id | salary
-- -----------------------------------
-- 10     | eng    | 10     | 5000
-- 20     | hr     | 20     | 6000
-- NULL   | NULL   | 50     | 8000
-- NULL   | NULL   | 60     | 9000


-- 🔍 RIGHT ANTI JOIN (Simulated)
SELECT * FROM table1 a
RIGHT JOIN table2 b ON a.emp_id = b.emp_id
WHERE a.emp_id IS NULL;

-- Output:
-- emp_id | dep_id | emp_id | salary
-- -----------------------------------
-- NULL   | NULL   | 50     | 8000
-- NULL   | NULL   | 60     | 9000


-- 🔄 FULL OUTER JOIN (Not natively in MySQL - use UNION)
SELECT * FROM table1 a
LEFT JOIN table2 b ON a.emp_id = b.emp_id
UNION
SELECT * FROM table1 a
RIGHT JOIN table2 b ON a.emp_id = b.emp_id;

-- Output:
-- emp_id | dep_id  | emp_id | salary
-- -----------------------------------
-- 10     | eng     | 10     | 5000
-- 20     | hr      | 20     | 6000
-- 30     | IT      | NULL   | NULL
-- 40     | finance | NULL   | NULL
-- NULL   | NULL    | 50     | 8000
-- NULL   | NULL    | 60     | 9000


-- 🔁 CROSS JOIN
SELECT * FROM table1 a
CROSS JOIN table2 b;

-- Output: (4 rows × 4 rows = 16 rows)
-- Shows all combinations (Cartesian Product)
-- Sample:
-- 10 | eng     | 10 | 5000
-- 10 | eng     | 20 | 6000
-- ...
-- 40 | finance | 60 | 9000
