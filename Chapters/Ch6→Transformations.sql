-- Choose the Database and Schema
USE ecom;
USE SCHEMA dim_customer_schema;

-- Selecting the table on which we will perform our transformations
SHOW TABLES;
SELECT * FROM orders;
SELECT * FROM customers;

-- NUMERICAL TRANSFORMATIONS
SELECT
      order_amount,
      order_amount + 1000 AS taxed_price,
      taxed_price - 500 AS offed_price,
      offed_price / 10 AS discounted_amount,
      offed_price * 0.90 AS discounted_price,
      ROUND(discounted_price,1) AS rounded_price     
FROM
      orders

-- DATE TRANSFORMATIONS
-- 1)
SELECT
      order_date,
      CURRENT_DATE(),
      CURRENT_TIME(),
      CURRENT_TIMESTAMP()
FROM
      orders

-- 2)
SELECT
    order_date,
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    DAY(order_date) AS day,
    DAYOFWEEK(order_date) AS week_day,          -- Returns 0 (Sunday) to 6 (Saturday)
    DAYNAME(order_date) AS day_name,            -- Returns the name of the day
    DATEADD(day, 2, order_date) AS after_2_days,    -- Correct syntax
    DATEADD(day, -2, order_date) AS before_2_days,  -- Correct syntax
    DATEDIFF(day, order_date, CURRENT_DATE()) AS total_days, -- Difference in days
    CAST('2026-01-01' AS TIMESTAMP) AS cast_example
FROM orders;

-- 3)
SELECT
     order_date,
     TO_CHAR(order_date, 'Day Month DD YYYY') AS converted_date
FROM
     orders;

-- TYPE CASTING
SELECT 
     customer_id,
     CAST(customer_id AS CHAR(100))
FROM
     orders;

-- STRING FUNCTIONS
-- 1)
SELECT 
     CONCAT(customer_name,' ',city) AS "full name",
     CONCAT_WS(' ',customer_name,city,age)
FROM
    customers;

-- 2)
SELECT
     *, 
     LENGTH(city) AS "city size"
FROM
     customers;

-- 3)
SELECT
     *,
     LOWER(city),
     UPPER(city),
     SUBSTRING(membership_type,1,4),
     REPLACE(city,'Delhi','Jaipur')
FROM
     customers;

-- 4)
SELECT
      LEFT(city,3),
      RIGHT(city,3),
      REVERSE(city),
      REPEAT(customer_name,2)
FROM 
     customers;
    

     

      
