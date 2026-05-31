-- Choose the Database and Schema
USE ecom;
USE SCHEMA dim_customer_schema;

-- Selecting the table on which we will perform our transformations
SHOW TABLES;
SELECT * FROM orders;
SELECT * FROM customers;

-- REAL TIME SCENARIOS

-- SCENARIO 1 [Finding the nth value]
SELECT 
	  subquery.*
FROM
(
SELECT 
	 *, 
DENSE_RANK() OVER(PARTITION BY category ORDER BY order_amount DESC) AS ranking
FROM   
     orders
)
subquery
WHERE
	ranking = 5;

-- SCENARIO 2 [Removing Duplicates]
INSERT INTO customers
VALUES 
(301,'lamba','Delhi',23,'2022-01-01','Silver',1700),
(101,'love','Pune',29,'2021-01-01','Gold',1600)
SELECT * FROM customers;

 -- SOLution-
SELECT
     subquery.*
FROM
(
SELECT 
      *,
      ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY customer_id) AS dedup
FROM 
     customers
) subquery
WHERE 
     dedup = 1;

-- SCENARIO 3 [Lag & Lead]
CREATE TABLE weather
(
   id INT,
   temp FLOAT 
);
INSERT INTO weather
VALUES
(1,10),
(2,12),
(3,9),
(4,15),
(5,20),
(6,15),
(7,12);
-- solution
SELECT
      *,
      LAG(temp,1,0) OVER(ORDER BY id ASC) AS prev_day_temp,
      LAG(temp,2,0) OVER(ORDER BY id ASC) AS prev_2day_temp,
      LEAD(temp,1,0) OVER(ORDER BY id ASC) AS next_day_temp
FROM
      weather