-- Choose the Database and Schema
USE ecom;
USE SCHEMA dim_customer_schema;

-- for running queries
SELECT * FROM customers;

-- gives metadata of table
SHOW COLUMNS IN TABLE ecom.dim_customer_schema.customers;

-- showcase all type of semi-meta data for table
SHOW GRANTS ON TABLE customers;

-- INSERT COMMAND
INSERT INTO ecom.dim_customer_schema.customers 
(CUSTOMER_ID, CUSTOMER_NAME, CITY, AGE, SIGNUP_DATE, MEMBERSHIP_TYPE, TOTAL_POINTS)
VALUES (111,'Ali','Bikaner',22,'2026-05-12','Gold',3000);

-- UPDATE COMMAND
UPDATE customers
SET customer_name = 'Faizan'
WHERE city = 'Bikaner';

-- DELETE COMMAND
DELETE FROM customers
WHERE customer_name = 'Faizan';