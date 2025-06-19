-- ❌ TABLE VIOLATING 1NF (Not Atomic)
-- A student has multiple courses stored in a single column — this violates 1NF.

CREATE TABLE students_raw (
    student_id INT,
    student_name VARCHAR(50),
    courses VARCHAR(100)  -- BAD: not atomic
);

-- Inserting unnormalized data
INSERT INTO students_raw VALUES
(1, 'Akhil', 'DBMS, OS'),
(2, 'Priya', 'DSA, Java, Python');

-- View the table
SELECT * FROM students_raw;

-- Expected Output:
-- | student_id | student_name | courses             |
-- |------------|--------------|---------------------|
-- | 1          | Akhil        | DBMS, OS            |
-- | 2          | Priya        | DSA, Java, Python   |


-- ✅ FIXED TABLE – IN 1NF
-- Store each course as a separate row (Atomic values)

CREATE TABLE students_1nf (
    student_id INT,
    student_name VARCHAR(50),
    course VARCHAR(50)
);

-- Inserting normalized data
INSERT INTO students_1nf VALUES
(1, 'Akhil', 'DBMS'),
(1, 'Akhil', 'OS'),
(2, 'Priya', 'DSA'),
(2, 'Priya', 'Java'),
(2, 'Priya', 'Python');

-- View the normalized table
SELECT * FROM students_1nf;

-- Expected Output:
-- | student_id | student_name | course  |
-- |------------|--------------|---------|
-- | 1          | Akhil        | DBMS    |
-- | 1          | Akhil        | OS      |
-- | 2          | Priya        | DSA     |
-- | 2          | Priya        | Java    |
-- | 2          | Priya        | Python  |
