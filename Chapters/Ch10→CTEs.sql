-- Choose the Database and Schema
USE ecom;
USE SCHEMA dim_customer_schema;

-- Selecting the table on which we will perform our transformations
SHOW TABLES;
SELECT * FROM orders;
SELECT * FROM customers;

-- CTEs [Common Table Expressions]
WITH cte_table AS
(
SELECT
      *
FROM
	orders
WHERE
	order_amount > (SELECT AVG(order_amount) FROM orders)
)

SELECT 
     *
FROM
     cte_table
WHERE
	-- product_name = 'Figure Method'
     product_name IN ('Laptop','Shoes','Watch'); 
	
-- -----------------------------------------------------------------------------------
WITH cte_table AS
(
  SELECT *
  FROM orders
  WHERE order_amount > (SELECT AVG(order_amount) FROM orders)
),
cte_table_2 AS 
(
    SELECT *
    FROM cte_table
    WHERE product_name IN ('Laptop','Shoes','Watch')
)
SELECT *
FROM cte_table_2
WHERE product_name = 'Laptop'
