-- ❌ TABLE VIOLATING 2NF
-- Problem: Partial dependency. A non-prime attribute (customer_name) depends only on part of the composite primary key (order_id, product_id).

CREATE TABLE orders_raw (
    order_id INT,
    product_id INT,
    product_name VARCHAR(100),
    customer_name VARCHAR(100)
);

-- Inserting unnormalized data
INSERT INTO orders_raw VALUES 
(1, 101, 'Keyboard', 'Akhil'),
(1, 102, 'Mouse', 'Akhil'),
(2, 103, 'Monitor', 'Priya');

-- View the table
SELECT * FROM orders_raw;

-- Expected Output:
-- | order_id | product_id | product_name | customer_name |
-- |----------|------------|--------------|----------------|
-- | 1        | 101        | Keyboard     | Akhil          |
-- | 1        | 102        | Mouse        | Akhil          |
-- | 2        | 103        | Monitor      | Priya          |


-- ✅ FIXED DESIGN: IN 2NF
-- Step 1: Separate the order and customer info into one table (no partial dependency)
-- Step 2: Move product info into another table

-- 1. Orders Table (customer_name now depends fully on order_id)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

INSERT INTO orders VALUES
(1, 'Akhil'),
(2, 'Priya');

-- 2. OrderDetails Table (Product info is separate and connected by order_id)
CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    product_name VARCHAR(100),
    PRIMARY KEY (order_id, product_id)
);

INSERT INTO order_details VALUES
(1, 101, 'Keyboard'),
(1, 102, 'Mouse'),
(2, 103, 'Monitor');

-- ✅ Query the data

-- View orders (who placed which order)
SELECT * FROM orders;

-- Expected:
-- | order_id | customer_name |
-- |----------|----------------|
-- | 1        | Akhil          |
-- | 2        | Priya          |

-- View order details (which order contains which product)
SELECT * FROM order_details;

-- Expected:
-- | order_id | product_id | product_name |
-- |----------|------------|--------------|
-- | 1        | 101        | Keyboard     |
-- | 1        | 102        | Mouse        |
-- | 2        | 103        | Monitor      |
