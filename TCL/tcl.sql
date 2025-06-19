-- ----------------------------------------------------------------------
-- TCL (Transaction Control Language) Examples
-- Description: COMMIT, ROLLBACK, SAVEPOINT practical SQL examples
-- ----------------------------------------------------------------------

-- Use the HR database
USE hr;

-- Count existing rows (Assume initially 18 rows)
SELECT COUNT(*) FROM employees_dtls;

-- Insert a row
INSERT INTO employees_dtls
VALUES (220, "ashok", "reddy", "2023-02-14 21:19:39", 19, 90000, 0.01, 1002, 1435, "ashok@gmail.com");

-- Verify row added: count becomes 19
SELECT COUNT(*) FROM employees_dtls;

-- ROLLBACK: undo the last insert
ROLLBACK;

-- Verify rollback worked: count returns to 18
SELECT COUNT(*) FROM employees_dtls;

-- --------------------- COMMIT Example ---------------------

-- Insert 2 rows
INSERT INTO employees_dtls 
VALUES
  (201, "hitaishi", "reddy", "2021-02-14 21:19:39", 14, 40000, 0.01, 1002, 1435, "hitaishi@gmail.com"),
  (202, "kalyani", "reddy", "2022-02-14 21:19:39", 15, 50000, 0.01, 1002, 1435, "kalyani@gmail.com");

-- Commit these changes so they are saved permanently
COMMIT;

-- Insert another row
INSERT INTO employees_dtls
VALUES (203, "anjan", "reddy", "2020-02-14 21:19:39", 17, 70000, 0.01, 1002, 1435, "anjan@gmail.com");

-- ROLLBACK: undo the last insert
ROLLBACK;

-- Confirm that only first two rows (201, 202) exist
SELECT * FROM employees_dtls WHERE emp_id IN (201, 202, 203);

-- --------------------- UPDATE + COMMIT Example ---------------------

-- Find current salary (e.g., one person has 50000)
SELECT * FROM employees_dtls WHERE salary = 50000;

-- Update salary of all employees
UPDATE employees_dtls
SET salary = 10000;

-- COMMIT: make this change permanent
COMMIT;

-- --------------------- SAVEPOINT Example ---------------------

-- Check current row count (e.g., 20)
SELECT COUNT(*) FROM employees_dtls;

-- Insert Set 1
INSERT INTO employees_dtls
VALUES (204, "anjan", "reddy", "2020-02-14 21:19:39", 17, 70000, 0.01, 1002, 1435, "anjan@gmail.com");

-- Create SAVEPOINT after Set 1
SAVEPOINT set1_insert;

-- Insert Set 2
INSERT INTO employees_dtls
VALUES 
  (205, "pulla", "reddy", "2020-02-14 21:19:39", 17, 20000, 0.01, 1002, 1435, "anjan@gmail.com"),
  (206, "shreya", "reddy", "2020-02-14 21:19:39", 17, 30000, 0.01, 1002, 1435, "anjan@gmail.com");

-- Create SAVEPOINT after Set 2
SAVEPOINT set2_insert;

-- Check count (should be 23 now)
SELECT COUNT(*) FROM employees_dtls;

-- ROLLBACK TO SAVEPOINT: cancel Set 2
ROLLBACK TO SAVEPOINT set1_insert;

-- Check count: should now be 21
SELECT COUNT(*) FROM employees_dtls;

-- Full ROLLBACK: remove Set 1 too
ROLLBACK;

-- Final count check (back to original state, e.g., 20)
SELECT COUNT(*) FROM employees_dtls;
