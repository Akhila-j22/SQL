 Description: GRANT and REVOKE permissions to users on tables

   
-- Using the 'hr' database
USE hr;

-- GRANT: Giving full DML permissions to flm_user on employees_dtls
GRANT SELECT, INSERT, UPDATE, DELETE
ON employees_dtls
TO 'flm_user'@'localhost';

-- Insert data from one table to another (not DCL, but practical example)
INSERT INTO employees_dtls_v2
SELECT * FROM employees_dtls;

-- GRANT: Giving only SELECT permission to flm_user on employees_dtls_v2
GRANT SELECT
ON employees_dtls_v2
TO 'flm_user'@'localhost';

-- Check current privileges
SHOW GRANTS FOR 'flm_user'@'localhost';

-- REVOKE: Remove UPDATE, DELETE privileges from employees_dtls
REVOKE UPDATE, DELETE
ON employees_dtls
FROM 'flm_user'@'localhost';

-- Final check to confirm
SHOW GRANTS FOR 'flm_user'@'localhost';
