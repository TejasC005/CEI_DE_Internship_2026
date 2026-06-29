/*
  SQL Assignment
  File: Section_B/filtering_queries.sql

  Section B - Filtering & Optimization
  Topics:
  • WHERE
  • BETWEEN
  • AND / OR
  • Indexes
  • Query Optimization 

  Author : Tejas Chaudhari
*/

-- Q7. Retrieve all Delivered orders.

SELECT * FROM orders WHERE status = 'Delivered';

-- Explanation:
-- Retrieves all orders whose status is 'Delivered'.



-- Q8. Electronics products with price greater than ₹2000.

SELECT * FROM products WHERE category = 'Electronics' AND unit_price > 2000;

-- Explanation:
-- Filters products belonging to Electronics category
-- and costing more than ₹2000.



-- Q9. Customers who joined in 2024 and belong to Maharashtra.


SELECT * FROM customers WHERE join_date BETWEEN '2024-01-01' AND '2024-12-31' AND state = 'Maharashtra';

-- Explanation:
-- Uses BETWEEN for date filtering and
-- retrieves only Maharashtra customers.




-- Q10. Orders between 10-Aug-2024 and 25-Aug-2024
-- excluding Cancelled orders.


SELECT * FROM orders WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25' AND status <> 'Cancelled';

-- Explanation:
-- BETWEEN includes both boundary dates.
-- <> means NOT EQUAL TO.



-- Q11. Explain idx_orders_date Index.


/*

Index Name

idx_orders_date

Created On

orders(order_date)

Purpose

The index stores order_date values in sorted order,
allowing the database to locate matching records
without scanning the entire table.

Benefits

Faster filtering, Faster sorting, Faster range searches

Example Query

*/

SELECT * FROM orders WHERE order_date BETWEEN '2024-08-01' AND '2024-08-31';

/*

Without Index we do Full Table Scan and Database checks every row.

With Index only Index Scan is done and Database jumps directly to the required dates,
making the query much faster.

*/



-- Q12. Will YEAR(join_date) use an index?

/*

Query

SELECT *
FROM customers
WHERE YEAR(join_date)=2024;

Answer

No.

Reason

Applying YEAR() to the indexed column forces the
database to calculate YEAR(join_date) for every row,
preventing efficient index usage.

Such queries are called NON-SARGable.

SARGable
(Search ARGument Able) means the database can efficiently use an index.

*/

-- Non-SARGable Query

SELECT * FROM customers WHERE YEAR(join_date)=2024;

-- Optimized (SARGable) Query

SELECT * FROM customers WHERE join_date >= '2024-01-01' AND join_date < '2025-01-01';

/*

Advantages

Uses index, Faster execution, Better scalability, Recommended in production databases

*/
