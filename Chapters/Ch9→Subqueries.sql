-- Choose the Database and Schema
USE ecom;
USE SCHEMA dim_customer_schema;

-- Selecting the table on which we will perform our transformations
SHOW TABLES;
SELECT * FROM orders;
SELECT * FROM customers;

-- SUBQUERIES
-- 1)
-- BASIC METHOD
SELECT
      category,
      AVG(order_amount) AS "total_avg"
FROM 
      orders
GROUP BY
      category;

-- 2)
SELECT
      * 
FROM 
      orders 
WHERE 
      order_amount > 4957;

-- ADVANCE METHOD(subquery method)
SELECT 
      *
FROM
      orders
WHERE
      order_amount > (SELECT AVG(order_amount) FROM orders);
      
-- 2) MULTI-STEP SUBQUERY
SELECT 
      *
FROM
(
SELECT 
      *
FROM
      orders
WHERE
      order_amount > (SELECT AVG(order_amount) FROM orders)
) AS subquery_table
WHERE	
     product_name = 'Mobile';