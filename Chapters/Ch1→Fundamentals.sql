-- CH-1 (Fundamentals)

-- This will create database and use that database and we verify it with SHOW
CREATE DATABASE IF NOT EXISTS sales;
USE sales;
SHOW DATABASES;

-- This will create Schema and usae that ,so that we will put all tables data on that particular schema and we verify it with SHOW
CREATE SCHEMA IF NOT EXISTS fundamentals;
USE SCHEMA fundamentals;
SHOW SCHEMAS;

-- This will create table named "orders_of_sales" and we verify it with SHOW
CREATE TABLE IF NOT EXISTS orders_of_sales(
     order_name VARCHAR(50),
     order_id   INT,
     order_price FLOAT
);
SHOW TABLES;

-- This will insert data into table "order_of_sales" and we verify it with SELECT
INSERT INTO orders_of_sales VALUES
     ('PS5', 0101, 55000),
     ('XBOX 360', 0102, 30000),
     ('PSP 2', 0103, 25000);
SELECT * FROM orders_of_sales;

-- Truncate will Empty the table and Drop will delete the table and we verify it with SHOW
TRUNCATE TABLE orders_of_sales;
DROP TABLE orders_of_sales;
SHOW TABLES;

-- Again run the create table and Insert data queries as we will use it further here

-- This will add new column named "order_ratings" to table "orders_of_sales"
ALTER TABLE orders_of_sales
ADD COLUMN order_ratings FLOAT

-- This will rename the column from order_ratings to order_rating
ALTER TABLE orders_of_sales
RENAME COLUMN order_ratings TO order_rating;

-- This will delete a specific record(row) from the table "orders_of_sales"
BEGIN;
    DELETE FROM orders_of_sales
    WHERE order_id = 103;
COMMIT;

-- This will delete a specific column from the table "orders_of_sales"
BEGIN;
    ALTER TABLE orders_of_sales
    DROP COLUMN order_rating;
COMMIT;

-- END --
