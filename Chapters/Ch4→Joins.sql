-- Choose the Database and Schema
USE ecom;
USE SCHEMA dim_customer_schema;

SELECT * FROM customers;
SELECT * FROM orders;

-- JOINS →

-- INNER JOIN
SELECT
      o.*,
      c.customer_id,
      c.customer_name
FROM
      orders AS o
INNER JOIN
      customers AS c
      ON
      o.customer_id = c.customer_id
      
-- LEFT JOIN -- RIGHT JOIN -- UNION --
SELECT 
      *
FROM
     orders AS o
LEFT JOIN
     customers AS c
     ON
     o.customer_id = c.customer_id

UNION

SELECT
      *
FROM
     orders AS o
RIGHT JOIN
     customers AS c
     ON
     o.customer_id = c.customer_id

