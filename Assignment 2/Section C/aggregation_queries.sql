/*
  SQL Assignment
  File: Section_C/aggregation_queries.sql

  Section C - Aggregation
  Topics Covered:
  • COUNT()
  • SUM()
  • AVG()
  • MIN()
  • MAX()
  • GROUP BY
  • HAVING

  Author : Tejas Chaudhari
*/


-- Q13. Count the total number of orders.

SELECT COUNT(*) AS total_orders FROM orders;

-- Explanation:
-- COUNT(*) returns the total number of rows present in the orders table.




-- Q14. Find the total revenue from all Delivered orders.

SELECT SUM(total_amount) AS total_revenue FROM orders WHERE status = 'Delivered';

-- Explanation:
-- SUM() calculates the total revenue generated from only Delivered orders.



-- Q15. Calculate the average unit price for each product category.

SELECT category, AVG(unit_price) AS average_price FROM products GROUP BY category;

-- Explanation:
-- GROUP BY groups records category-wise and AVG() calculates the average price.



-- Q16. Count of orders and total revenue for each order status. Sort by revenue descending.

SELECT status, COUNT(order_id) AS total_orders, SUM(total_amount) AS total_revenue FROM orders GROUP BY status ORDER BY total_revenue DESC;

-- Explanation:
-- COUNT() counts orders.
-- SUM() calculates total revenue.
-- ORDER BY sorts revenue from highest to lowest.




-- Q17. Find the costliest and cheapest product in each category.

SELECT category, MAX(unit_price) AS highest_price, MIN(unit_price) AS lowest_price FROM products GROUP BY category;

-- Explanation:
-- MAX() returns highest price.
-- MIN() returns lowest price.
-- GROUP BY performs the calculation separately for each category.




-- Q18. Categories having average price greater than ₹2000.

SELECT category, AVG(unit_price) AS average_price FROM products GROUP BY category HAVING AVG(unit_price) > 2000;

-- Explanation:
-- HAVING filters grouped results.
-- WHERE cannot be used with aggregate values.
-- Only categories with average price greater than ₹2000 are displayed.


-- Additional Practice Queries

-- Total products available in each category

SELECT category, COUNT(product_id) AS total_products FROM products GROUP BY category;

-- Average stock available category-wise

SELECT category, AVG(stock_qty) AS average_stock FROM products GROUP BY category;

-- Highest order amount

SELECT MAX(total_amount) AS highest_order_amount FROM orders;

-- Lowest order amount

SELECT MIN(total_amount) AS lowest_order_amount FROM orders;

-- Average order amount

SELECT AVG(total_amount) AS average_order_amount FROM orders;
