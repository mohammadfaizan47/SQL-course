-- Choose the Database & Schema 
USE ecom;
USE SCHEMA dim_customer_schema;

-- Show the table about to use
SELECT * FROM customers;

-- LIMIT → We use LIMIT in SQL to control how many rows are returned in a query result.
SELECT
      *
FROM
     customers
LIMIT 5;

-- WHERE → The WHERE clause in SQL is used to filter rows in a query — it tells the database which records to return based on a condition.
SELECT
      *
FROM
      customers
WHERE
     (city = 'Delhi');

-- AND/OR → The AND and OR operators in SQL are used inside the WHERE clause to combine multiple conditions
SELECT 
      *
FROM
      customers
WHERE
     (city = 'Delhi') AND 
     (membership_type = 'Silver');

SELECT 
      *
FROM
      customers
WHERE
     (city = 'Delhi') OR
     (membership_type = 'Silver');

-- LIKE → The LIKE operator in SQL is used for pattern matching in text columns
SELECT
      *
FROM
      customers
WHERE
      city LIKE 'D%';

/* SORTING → Sorting in SQL is done using the ORDER BY clause. It lets you arrange query results in either 
             ascending (ASC) or descending (DESC) order based on one or more columns.                                                              */
SELECT
      *
FROM
      customers
ORDER BY
      total_points DESC;

-- ALIAS → The ALIAS in SQL is a temporary name you give to a table or column in a query. It makes results easier to read and queries shorter to write.
SELECT
      *,
      customer_name AS cust_name
FROM
      customers;

/* GROUPING → The GROUP BY clause in SQL is used to arrange rows into groups based on the values of one or more columns, 
              so you can apply aggregate functions (like COUNT, SUM, AVG, MIN, MAX) to each group instead of the whole table.                      */
SELECT  
      total_points,
      ROUND(AVG(total_points), 2) AS avg_points,
      ROUND(SUM(total_points), 2) AS grand_total_points
FROM 
      customers
GROUP BY
      total_points;

