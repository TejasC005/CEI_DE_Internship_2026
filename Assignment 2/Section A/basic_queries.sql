/*
  SQL Assignment
  File: Section_A/basic_queries.sql

  Section A - SQL Basics
  Topics Covered:
  • SELECT
  • DISTINCT
  • Primary Key
  • Constraints
*/


-- Q1. Display all columns and rows from the customers table.

SELECT * FROM customers;

-- Explanation:
-- The '*' wildcard retrieves every column and every row
-- from the customers table.




-- Q2. Retrieve only first_name, last_name, and city.


SELECT first_name, last_name, city FROM customers;

-- Explanation:
-- Only the required columns are selected instead
-- of retrieving the complete table.




-- Q3. List all unique product categories.


SELECT DISTINCT category FROM products;

-- Explanation:
-- DISTINCT removes duplicate values and displays
-- each category only once.




-- Q4. Identify the Primary Key of each table.
-- Explain why Primary Keys are UNIQUE and NOT NULL.


/*

Primary Keys

customers
-----------
customer_id

products
----------
product_id

orders
--------
order_id

order_items
------------
item_id


Explanation

A Primary Key is a column (or combination of columns)
that uniquely identifies every record in a table.

Properties

1. UNIQUE
   No two rows can have the same Primary Key value.

2. NOT NULL
   Every row must contain a Primary Key value.

Importance

• Prevents duplicate records.
• Maintains data integrity.
• Allows relationships using Foreign Keys.
• Enables faster searching and indexing.

Example

Correct

customer_id
-----------
101
102
103

Incorrect

customer_id
-----------
101
101   ← Duplicate (Not Allowed)

NULL  ← Not Allowed

*/



-- Q5. Constraints on email column.


/*

The email column has two constraints.

1. UNIQUE
   Every customer must have a different email address.

2. NOT NULL
   Email cannot be empty.

Definition

email VARCHAR(100) UNIQUE NOT NULL

Example of duplicate email

INSERT INTO customers
VALUES
(
109,
'Rahul',
'Verma',
'aarav.s@email.com',
'Nagpur',
'Maharashtra',
'2024-09-01',
TRUE
);

Result

ERROR:
Duplicate entry for UNIQUE KEY 'email'

Reason

The email
aarav.s@email.com

already exists in the customers table.

*/




-- Q6. Insert a product with unit_price = -50.
-- Explain what happens.




INSERT INTO products
VALUES
(
209,
'USB Cable',
'Electronics',
'Logitech',
-50,
100
);

-- Expected Result

/*
ERROR

CHECK constraint failed

Reason

The products table contains the constraint CHECK (unit_price > 0)
Since -50 is less than zero,
the database rejects the INSERT statement.
This prevents invalid product prices from being stored,
thereby maintaining data integrity.

Constraint Responsible

CHECK (unit_price > 0)

*/

