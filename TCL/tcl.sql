USE hr;
SELECT COUNT(*) FROM employees_dtls;
INSERT INTO employees_dtls
VALUES(220,"ashok","reddy","2023-02-14 21:19:39",19,90000,0.01,1002,1435,"ashok@gmail.com");

ROLLBACK;                             ----- (paina first count chesam total ga 18 rows vachay then oka row ni insert chesam then 19 ayyay and rollback chesam again adhi 18 ki vachay )-

 ---- COMMIT------
 -- 1.insert 2 rows  (2 rows insert cheyali)
 -- 2.commit         (aa rows ni freeze cheyali using commit)
 -- 3.insert one row  (then inkoka row kavali naku so insert chesthuna)
 -- 4.Rollback         (nen endhaka create chesina row lo naku errors vachay so i want to rollback ,edhi chesthy aa row add avvadhu delete aypothundhi mundhu 2 rows alaney freeze lo vubtay)
 
 
COMMIT;
------ (transaction starts here)--------
INSERT INTO employees_dtls 
VALUES(201,"hitaishi","reddy","2021-02-14 21:19:39",14,40000,0.01,1002,1435,"hitaishi@gmail.com");
INSERT INTO employees_dtls
VALUES	(202,"kalyani","reddy","2022-02-14 21:19:39",15,50000,0.01,1002,1435,"kalyani@gmail.com");

COMMIT;
INSERT INTO employees_dtls
VALUES(203,"anjan","reddy","2020-02-14 21:19:39",17,70000,0.01,1002,1435,"anjan@gmail.com");

ROLLBACK;
  --------------------- EXAMPLE2*********---------------------------------------------------------
  SELECT*FROM employees_dtls;
 --- (among 20 records one person have 50000)
 UPDATE employees_dtls
 SET salary = 10000;
 COMMIT;   -- (edhi chesaka localhost lo kuda automatic ga change aypothundhi akkada table lo kuda salary updatee avthundhi )------


-------- SAVEPOINT**************---------------------------------
SELECT COUNT(*) FROM employees_dtls;
---- 20 records vunnay

-- set 1 insert statement 
INSERT INTO employees_dtls
VALUES(204,"anjan","reddy","2020-02-14 21:19:39",17,70000,0.01,1002,1435,"anjan@gmail.com");

SAVEPOINT set1_insert;

-- set 2 insert statement 
INSERT INTO employees_dtls
VALUES(205,"pulla","reddy","2020-02-14 21:19:39",17,20000,0.01,1002,1435,"anjan@gmail.com");
INSERT INTO employees_dtls
VALUES(206,"shreya","reddy","2020-02-14 21:19:39",17,30000,0.01,1002,1435,"anjan@gmail.com");

SAVEPOINT set2_insert;

SELECT COUNT(*) FROM employees_dtls;
--- 23 records

ROLLBACK TO SAVEPOINT set1_insert;   -- (set_insert savepoint lo nen wrong data pettanu or i doint need that data alanti time lo edhi use chestham)----
--- 21 records
ROLLBACK;
 
 SELECT COUNT(*) FROM employees_dtls;
 ---- 20 records
