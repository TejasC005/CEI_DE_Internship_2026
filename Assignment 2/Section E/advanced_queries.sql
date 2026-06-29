/*
  SQL Assignment
  File: Section_E/advanced_queries.sql

  Section E - Advanced SQL Concepts

  Topics Covered
  • CASE Statement
  • CASE with Aggregate Functions
  • ACID Properties
  • Transactions

  Author: Tejas Chaudhari

  Author Note: Before you run advanced_queries.sql, 
  comment out or remove the example INSERT statement in Q23 from joins_queries.sql
  Otherwise, Q27 in advanced_queries.sql also inserts order_id = 1011, 
  which will cause a Duplicate entry for PRIMARY KEY error.
*/


-- Q24. Classify products into price tiers using CASE.
-- Budget: unit_price < 1000
-- Mid-Range: unit_price BETWEEN 1000 AND 3000
-- Premium: unit_price > 3000

SELECT
    product_name,
    unit_price,

    CASE

        WHEN unit_price < 1000
            THEN 'Budget'

        WHEN unit_price BETWEEN 1000 AND 3000
            THEN 'Mid-Range'

        ELSE 'Premium'

    END AS price_tier

FROM products
ORDER BY unit_price;

-- Explanation:
-- CASE works like an IF-ELSE statement.
-- It classifies each product according to its price.





-- Q25.
-- Count Delivered vs Not Delivered orders using CASE inside aggregate functions.


SELECT

    SUM(
        CASE
            WHEN status = 'Delivered'
            THEN 1
            ELSE 0
        END
    ) AS Delivered_Orders,

    SUM(
        CASE
            WHEN status <> 'Delivered'
            THEN 1
            ELSE 0
        END
    ) AS Not_Delivered_Orders

FROM orders;

-- Explanation:
-- CASE converts matching rows into 1 and others into 0.
-- SUM() counts the total.



-- Q26.
-- Explain ACID Properties

/*

ACID Properties ensure that every database transaction
is processed safely and reliably.

------------
A → Atomicity
------------

Meaning
Either the entire transaction succeeds or nothing happens.

Example
A bank transfer of ₹5000

Step 1:
Debit Account A

Step 2:
Credit Account B

If Step 2 fails,
Step 1 is automatically rolled back.
No partial transaction is saved.

------------
C → Consistency
------------

Meaning
A transaction always keeps the database in a valid state.

Example
If total bank balance before transfer is ₹1,50,000 it must remain ₹1,50,000 after transfer.
Database constraints remain valid.

------------
I → Isolation
------------

Meaning
Multiple users can perform transactions simultaneously without interfering with each other.

Example

Two users booking the last product at exactly the same time.
Only one booking succeeds.
The second user receives an error or waits until the first transaction completes.

------------
D → Durability
------------

Meaning
Once COMMIT is executed, the data is permanently saved.
Even if the server crashes, the committed transaction is not lost.

Example

Online payment succeeds.
Power failure occurs immediately.
When the database restarts, the payment record is still available.

------------

Summary

Atomicity - All or Nothing

Consistency - Valid Database State

Isolation - Concurrent Transactions Don't Interfere

Durability - Committed Data is Permanent

*/



-- Q27.
-- Transaction Example
--
-- Requirements
--
-- 1. Insert new order
-- 2. Insert order items
-- 3. Update stock
-- 4. Rollback if any step fails



START TRANSACTION;

-- Step 1
-- Insert New Order

INSERT INTO orders
(
    order_id,
    customer_id,
    order_date,
    status,
    total_amount
)

VALUES
(
    1011,
    102,
    CURRENT_DATE,
    'Pending',
    1598.00
);

----
-- Step 2
-- Insert Order Items
----

INSERT INTO order_items
VALUES
(
    5016,
    1011,
    206,
    1,
    1299.00,
    0
);

INSERT INTO order_items
VALUES
(
    5017,
    1011,
    208,
    1,
    299.00,
    0
);

----
-- Step 3
-- Update Product Stock
---

UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 206;

UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 208;

----
-- Step 4
-- Commit Transaction
----

COMMIT;

----
-- If any statement fails,
-- execute
----

-- ROLLBACK;

-- Explanation:
-- START TRANSACTION begins the transaction.
-- All operations are treated as one unit.
-- If every statement executes successfully,
-- COMMIT permanently saves the changes.
-- If any statement fails before COMMIT,
-- ROLLBACK restores the database to its previous consistent state.



-- Additional Practice Queries


-- Categorize customers based on Premium membership

SELECT

    customer_id,
    first_name,
    last_name,

    CASE

        WHEN is_premium = TRUE
        THEN 'Premium Customer'

        ELSE 'Regular Customer'

    END AS customer_type

FROM customers;



-- Display order priority

SELECT

    order_id,

    status,

    CASE

        WHEN status = 'Pending'
            THEN 'High Priority'

        WHEN status = 'Shipped'
            THEN 'Medium Priority'

        WHEN status = 'Delivered'
            THEN 'Completed'

        ELSE 'Cancelled'

    END AS order_priority

FROM orders;

