-- Choose the Database and Schema
USE ecom;
USE SCHEMA dim_customer_schema;

-- Selecting the table on which we will perform our transformations
SHOW TABLES;
SELECT * FROM orders;
SELECT * FROM customers;

-- WINDOW FUNCTIONS
-- 1)
SELECT
      *,
      SUM(order_amount) OVER(ORDER BY order_date) AS "sum",
      AVG(order_amount) OVER(ORDER BY order_date) AS "average"
FROM
      orders;

-- 2) FRAMES
SELECT
      *,
      SUM(order_amount) OVER(ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM
      orders;

-- 3)
SELECT
      *,
      SUM(order_amount) OVER(ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM
      orders;

-- RANKING
-- 1)
SELECT
	 order_amount,
     ROW_NUMBER() OVER(ORDER BY order_amount) AS "Row number",
     RANK() OVER(ORDER BY order_amount) AS "rank",
     DENSE_RANK() OVER(ORDER BY order_amount) AS "Dense Rank"
FROM
    orders;

-- 2)
SELECT
	 order_amount,
     category,
     ROW_NUMBER() OVER(PARTITION BY category ORDER BY order_amount) AS "Row number",
     RANK() OVER(PARTITION BY category ORDER BY order_amount) AS "rank",
     DENSE_RANK() OVER(PARTITION BY category ORDER BY order_amount) AS "Dense Rank"
FROM
    orders;