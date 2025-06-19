CREATE SCHEMA hr;   

USE hr;

---- DDL----CREATE--
CREATE TABLE employees(
	employee_id INT(6),
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(25),
    phone  INT(10) NOT NULL,
    hire_date  DATETIME NOT NULL
				DEFAULT CURRENT_TIMESTAMP,
	job_id   VARCHAR(10)NOT NULL,
    salary  DECIMAL(8,2) NOT NULL CHECK(salary>1000),
    commission_pct DECIMAL(2,2),
    manager_id  INT(6),
    department_id  INT(4),
    PRIMARY KEY(employee_id)
);

-----ALTER---
ALTER TABLE  employees  ADD  COLUMN  Email  varchar(100);

ALTER TABLE hr.employees DROP COLUMN phone;

ALTER TABLE  employees  RENAME  COLUMN email  TO email_id;

ALTER TABLE employees MODIFY COLUMN email varchar(200);

ALTER TABLE employees RENAME TO employees_dtls;

-----DROP----
DROP TABLE employees;

----TRUNCATE---
TRUNCATE TABLE employees;
