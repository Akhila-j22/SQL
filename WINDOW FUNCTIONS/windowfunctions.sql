-- Sample Table
CREATE TABLE sales (
    sale_id INT,
    emp_name VARCHAR(100),
    region VARCHAR(50),
    amount INT
);

-- Sample Data
INSERT INTO sales VALUES 
(1, 'Akhil', 'South', 5000),
(2, 'Akhil', 'South', 8000),
(3, 'Priya', 'North', 6000),
(4, 'Priya', 'North', 7500),
(5, 'Karan', 'East', 4000),
(6, 'Karan', 'East', 9000),
(7, 'Sneha', 'West', 8500),
(8, 'Sneha', 'West', 8500);

-- ROW_NUMBER(): unique row number per partition/order
SELECT emp_name, region, amount,
  ROW_NUMBER() OVER(PARTITION BY emp_name ORDER BY amount DESC) AS row_num
FROM sales;

-- RANK(): gaps in ranking if there's a tie
SELECT emp_name, region, amount,
  RANK() OVER(PARTITION BY region ORDER BY amount DESC) AS rnk
FROM sales;

-- DENSE_RANK(): no gaps in rank even with duplicates
SELECT emp_name, region, amount,
  DENSE_RANK() OVER(PARTITION BY region ORDER BY amount DESC) AS dense_rnk
FROM sales;

-- LEAD(): get next row's value in current row
SELECT emp_name, region, amount,
  LEAD(amount) OVER(PARTITION BY emp_name ORDER BY amount) AS next_sale
FROM sales;

-- LAG(): get previous row's value in current row
SELECT emp_name, region, amount,
  LAG(amount) OVER(PARTITION BY emp_name ORDER BY amount) AS prev_sale
FROM sales;

-- NTILE(): split rows into buckets (quartiles/percentiles)
SELECT emp_name, region, amount,
  NTILE(2) OVER(ORDER BY amount DESC) AS half_bucket
FROM sales;

-- SUM() OVER(): running total
SELECT emp_name, region, amount,
  SUM(amount) OVER(PARTITION BY emp_name ORDER BY sale_id) AS running_total
FROM sales;

-- SUM() OVER() no partition: total column across all rows
SELECT emp_name, region, amount,
  SUM(amount) OVER() AS grand_total
FROM sales;
