-- Choose the Database and Schema
USE ecom;
USE SCHEMA dim_customer_schema;

-- Selecting the table on which we will perform our transformations
SHOW TABLES;
SELECT * FROM orders;
SELECT * FROM customers;

-- CONDITIONALS
-- 1)
SELECT
      *,
      CASE
      WHEN order_amount <= 2000 THEN 'Affordable'
      WHEN order_amount <= 4000 THEN 'Normal'
      ELSE 'Expensive'
      END AS "price category"
FROM 
      orders;

-- 2)
SELECT
      *,
      CASE
      WHEN order_amount <= 2000 AND category = 'Electronics' THEN 'Affordable'
      WHEN order_amount <= 2000 AND category = 'Electronics' THEN 'Normal'
      WHEN order_amount > 4000 AND category = 'Electronics' THEN 'Expensive'
      ELSE CONCAT('Not for ', category)
      END AS "price category"
FROM 
      orders;