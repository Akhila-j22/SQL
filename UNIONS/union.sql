---------------------------------- ******** UNION/UNION ALL/UNION DISTINCT(big query)------------------------------
----- It is similar to append in power query.
---- vertical join/Append one on top of other.

-------------------- ***UNION(it will remove duplicates)----
select count(*) from (
select * from employees
union
select*from employees)as emp;

-------- ***UNION ALL (allow duplicates)-----
select count(*) from (
select * from employees
UNION ALL
select*from employees)as emp;

----------- ** UNION DISTINCT(removes duplicates)-----
select count(*) from (
select * from employees
union distinct
select*from employees)as emp;


--------- using specific columns in union-----
-- count anedhi just nak vachina output lo enni records vunnayo ani petta anthy we can remove count and brackets after from and also at the end--
select count(*) from (
select employee_id,first_name,last_name from employees
union
select employee_id,first_name,last_name from employees)as emp;

----- WHERE clause in UNION---
select  employee_id,first_name,last_name from employees
where department_id =50
union
select employee_id,first_name,last_name from employees
where department_id =60;

------- better ways to write union in case of complex queries----
select * from(
select department_id,count(*) from employees
group by department_id
order by department_id) as emp
union
select * from(
select department_id,count(*) from employees
group by department_id
order by department_id) as emp;

------ set operations (only in ORACLE sql).we can archieve the same thing using joins in MySQL---

------- INTERSECT( returns the common data in both statements)---
----- get me all the departments whose count of employess are more than 3
--- and also the department belongs to location = 1700-

select * from
(select department_id from employees
group by department_id 
having count(*)>3) as emp
INTERSECT
select department_id from employees
where location_id =1700 as emp;


------- MINUS-----
----- get me all the departments whose count of employess are more than 3
--- minus departments where the avg salary is < 5000--
select * from
(select department_id from employees
group by department_id 
having count(*)>3) as emp
MINUS
select department_id from employees
group by department_id
having avg(salary)<5000 as emp;
