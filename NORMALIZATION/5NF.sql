-- ❌ TABLE VIOLATING 5NF
-- Problem: Complex join dependencies (three-way relationship)

CREATE TABLE product_supplier_customer_raw (
    product VARCHAR(50),
    supplier VARCHAR(50),
    customer VARCHAR(50)
);

INSERT INTO product_supplier_customer_raw VALUES
('Laptop', 'HP', 'Amazon'),
('Laptop', 'HP', 'Flipkart'),
('Laptop', 'Dell', 'Amazon'),
('Laptop', 'Dell', 'Flipkart');

-- All combinations are valid, so we can break it into projections

-- ✅ FIX 5NF — Break into 3 separate binary relations

-- 1. Product-Supplier
CREATE TABLE product_supplier (
    product VARCHAR(50),
    supplier VARCHAR(50)
);

INSERT INTO product_supplier VALUES
('Laptop', 'HP'),
('Laptop', 'Dell');

-- 2. Product-Customer
CREATE TABLE product_customer (
    product VARCHAR(50),
    customer VARCHAR(50)
);

INSERT INTO product_customer VALUES
('Laptop', 'Amazon'),
('Laptop', 'Flipkart');

-- 3. Supplier-Customer
CREATE TABLE supplier_customer (
    supplier VARCHAR(50),
    customer VARCHAR(50)
);

INSERT INTO supplier_customer VALUES
('HP', 'Amazon'),
('HP', 'Flipkart'),
('Dell', 'Amazon'),
('Dell', 'Flipkart');
