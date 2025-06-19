-- PRIMARY KEY
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

-- FOREIGN KEY
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- UNIQUE constraint
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);

-- NOT NULL constraint
CREATE TABLE contacts (
    contact_id INT PRIMARY KEY,
    phone_number VARCHAR(15) NOT NULL
);

-- CHECK constraint
CREATE TABLE employees_check (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT CHECK (age >= 18)
);

-- DEFAULT constraint
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    status VARCHAR(20) DEFAULT 'Pending'
);
