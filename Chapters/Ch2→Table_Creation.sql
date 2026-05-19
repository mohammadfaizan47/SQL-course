-- =========================================================
-- TABLE 1: customers
-- =========================================================

USE ecom;
USE SCHEMA dim_customer_schema;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    age INT,
    signup_date DATE,
    membership_type VARCHAR(20),
    total_points INT
);

INSERT INTO customers VALUES
(101, 'Aarav',   'Delhi',     24, '2023-01-10', 'Gold',     1200),
(102, 'Diya',    'Mumbai',    29, '2022-05-18', 'Silver',    850),
(103, 'Kabir',   'Bangalore', 31, '2021-11-22', 'Platinum', 2200),
(104, 'Anaya',   'Pune',      27, '2023-03-14', 'Gold',     1500),
(105, 'Vivaan',  'Delhi',     35, '2020-08-09', 'Silver',    950),
(106, 'Meera',   'Chennai',   26, '2024-01-05', 'Bronze',    400),
(107, 'Aditya',  'Hyderabad', 30, '2022-09-11', 'Gold',     1700),
(108, 'Sara',    'Kolkata',   28, '2021-07-30', 'Platinum', 2600),
(109, 'Reyansh', 'Jaipur',    23, '2024-02-15', 'Bronze',    300),
(110, 'Ishita',  'Ahmedabad', 32, '2020-12-19', 'Silver',   1100);



-- =========================================================
-- TABLE 2: orders
-- =========================================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    category VARCHAR(30),
    order_amount DECIMAL(10,2),
    quantity INT,
    order_date DATE,
    payment_mode VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(1001, 101, 'Laptop',      'Electronics', 75000, 1, '2024-01-10', 'UPI'),
(1002, 102, 'Shoes',       'Fashion',      3500, 2, '2024-01-15', 'Card'),
(1003, 103, 'Mobile',      'Electronics', 50000, 1, '2024-02-01', 'UPI'),
(1004, 101, 'Headphones',  'Electronics', 2500, 1, '2024-02-05', 'Cash'),
(1005, 104, 'Watch',       'Accessories', 7000, 1, '2024-02-10', 'Card'),
(1006, 105, 'Bag',         'Fashion',      2000, 1, '2024-02-18', 'UPI'),
(1007, 106, 'Tablet',      'Electronics', 30000, 1, '2024-03-01', 'NetBanking'),
(1008, 107, 'Camera',      'Electronics', 45000, 1, '2024-03-07', 'Card'),
(1009, 108, 'T-Shirt',     'Fashion',      1500, 3, '2024-03-15', 'Cash'),
(1010, 101, 'Mouse',       'Electronics', 1200, 2, '2024-03-20', 'UPI');

SHOW TABLES;

SELECT * FROM customers;
SELECT * FROM orders;