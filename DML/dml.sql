------------------ DML ----------------(data manipulation language)-----
----- inserting single row-------
INSERT INTO employees_dtls values (101,"akhila","reddy",current_timestamp,10,10000,0.05,1001,1434,"akhila@gmail.com");

INSERT INTO employees_dtls values (102,"anitha","reddy","2025-02-14 21:19:39",11,10001,0.01,1002,1435,"anitha@gmail.com");

---- single insert with column specified------
INSERT INTO employees_dtls(employee_id,first_name,last_name,hire_date,job_id,salary,commission_pct,manager_id,department_id,email_id)
values(103,"avinash","reddy","2024-02-14 21:19:39",12,20000,0.01,1002,1435,"avinash@gmail.com");

---- inserting multiple rows-------
INSERT INTO employees_dtls values(104,"krishna","reddy","2023-02-14 21:19:39",13,30000,0.02,1002,1435,"krishna@gmail.com"),
	(105,"hitaishi","reddy","2021-02-14 21:19:39",14,40000,0.01,1002,1435,"hitaishi@gmail.com"),
	(106,"kalyani","reddy","2022-02-14 21:19:39",15,50000,0.01,1002,1435,"kalyani@gmail.com"),
	(107,"mahindra","reddy","2023-02-14 21:19:39",16,60000,0.01,1002,1435,"mahindra@gmail.com"),
	(108,"anjan","reddy","2020-02-14 21:19:39",17,70000,0.01,1002,1435,"anjan@gmail.com"),
	(109,"manga","reddy","2021-02-14 21:19:39",18,80000,0.01,1002,1435,"manga@gmail.com"),
	(110,"ashok","reddy","2023-02-14 21:19:39",19,90000,0.01,1002,1435,"ashok@gmail.com");
    
    
---- inserting into table using select*from table----
INSERT INTO employees_dtls SELECT*FROM employees_dtls;
INSERT INTO employees_dtls
SELECT emp.employee_id+20,first_name,last_name,hire_date,job_id,salary,commission_pct,manager_id,department_id,email_id FROM employees_dtls emp;

---- table aliasing----
SELECT employee_id,salary,email_id FROM employees_dtls;
SELECT emp.* FROM employees_dtls emp;
SELECT emp.employee_id,emp.salary FROM employees_dtls emp;

SELECT employee_id,salary,salary+(salary*0.1) FROM employees_dtls;                           ----- (by using this also we can update the data )------
SELECT employee_id,salary FROM employees_dtls;

---- Update selected rows based on the conditions-------------

UPDATE employees_dtls
SET salary = salary+(salary*0.1);                                                                      ------ without having any condition-----------

----- WHERE CLAUSE this is used to filtering the rows-----------
SELECT * FROM employees_dtls WHERE salary > 10000;

-------- update salary>1000 by using update set and where clause------
UPDATE employees_dtls 
SET salary = salary+1000 
WHERE salary >= 1000;

------ update ll employees salary whose salary is >10000 with average value of that category-----------
UPDATE employees_dtls 
SET salary = (SELECT AVG(salary) FROM employees_dtls WHERE salary > 10000)    -                        ---- (this is average salary)----
WHERE, salary > 10000;

UPDATE employees_dtls 
SET salary = 50000.111111 
WHERE salary > 10000;																	---- this ouput is from the above query----- (this is average salary)----
--- update all employees salary with the average value of all employee salary using a select query as sub query----
UPDATE employees_dtls
SET salary = (SELECT AVG(salary) FROM employees_dtls_v2);
 
 

SELECT * FROM employees_dtls;
SELECT * FROM employees_dtls_v2;


------ CREATE new table employees_dtls_v2 using select command------
CREATE TABLE employees_dtls_v2 as SELECT*FROM employees_dtls;


---- delete records if we want to delete all the rows without using where clause------
DELETE from employees_dtls_v2;

----- delete rows based on the condition i want to delete where the department id is 1434----
DELETE FROM employees_dtls WHERE department_id = 1434;
