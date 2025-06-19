-- ❌ TABLE VIOLATING BCNF
-- Problem: dept_head is unique for every department, but not the primary key

CREATE TABLE dept_assignment_raw (
    dept_name VARCHAR(50),
    dept_head VARCHAR(50),
    emp_name VARCHAR(50)
);

INSERT INTO dept_assignment_raw VALUES
('HR', 'Akhil', 'Priya'),
('HR', 'Akhil', 'Sneha'),
('IT', 'Karan', 'Manoj');

-- dept_head → dept_name (but not a candidate key)

-- ✅ BCNF FIX
-- Step 1: Normalize dept_head and dept_name

CREATE TABLE dept_heads (
    dept_head VARCHAR(50) PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO dept_heads VALUES
('Akhil', 'HR'),
('Karan', 'IT');

-- Step 2: Assign employees to dept_heads
CREATE TABLE dept_employees (
    dept_head VARCHAR(50),
    emp_name VARCHAR(50)
);

INSERT INTO dept_employees VALUES
('Akhil', 'Priya'),
('Akhil', 'Sneha'),
('Karan', 'Manoj');

-- ✅ JOIN VIEW
SELECT dh.dept_name, dh.dept_head, de.emp_name
FROM dept_heads dh
JOIN dept_employees de ON dh.dept_head = de.dept_head;
