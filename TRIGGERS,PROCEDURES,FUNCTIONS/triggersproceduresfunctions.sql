-- Sample Table for Trigger
CREATE TABLE audit_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    action_type VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT
);

-- Trigger to log insert actions on employees
DELIMITER //
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO audit_log(emp_id, action_type)
    VALUES (NEW.emp_id, 'INSERT');
END;
//
DELIMITER ;

-- Insert into employees (Trigger fires automatically)
INSERT INTO employees VALUES (1, 'Akhil', 60000), (2, 'Priya', 75000);

-- View audit log
SELECT * FROM audit_log;


-- ==============================
-- 🔹 STORED PROCEDURE
-- ==============================

-- Procedure to update salary by percentage
DELIMITER //
CREATE PROCEDURE update_salary (
    IN p_emp_id INT,
    IN percent_increase INT
)
BEGIN
    UPDATE employees
    SET salary = salary + (salary * percent_increase / 100)
    WHERE emp_id = p_emp_id;
END;
//
DELIMITER ;

-- Call the procedure
CALL update_salary(1, 10);

SELECT * FROM employees;


-- ==============================
-- 🔹 FUNCTION
-- ==============================

-- Function to calculate bonus (10% of salary)
DELIMITER //
CREATE FUNCTION get_bonus(salary INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END;
//
DELIMITER ;

-- Use the function
SELECT emp_name, salary, get_bonus(salary) AS bonus
FROM employees;
