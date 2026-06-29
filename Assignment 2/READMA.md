# SQL Assignment

## Project Overview

This project is a SQL assignment based on the **ShopEase E-commerce Database**. The objective is to demonstrate SQL concepts by designing a relational database, loading sample data, and writing queries to retrieve meaningful business insights.

The assignment covers database creation, data retrieval, filtering, aggregation, joins, conditional logic, and transaction management.

---

## Database Schema

The database consists of four related tables:

* **customers** – Stores customer information.
* **products** – Stores product details.
* **orders** – Stores customer order information.
* **order_items** – Stores individual products associated with each order.

### Entity Relationships

* One customer can place multiple orders.
* One order can contain multiple order items.
* One product can appear in multiple order items.

---

## Technologies Used

* SQL
* MySQL (Compatible with other SQL-compliant RDBMS such as PostgreSQL with minor syntax changes)

---

## Project Structure

```text
sql-assignment/
│
├── database_setup.sql
├── README.md
│
├── Section_A/
│   └── basic_queries.sql
│
├── Section_B/
│   └── filtering_queries.sql
│
├── Section_C/
│   └── aggregation_queries.sql
│
├── Section_D/
│   └── joins_queries.sql
│
└── Section_E/
    └── advanced_queries.sql
```

---

## Assignment Sections

### Section A – SQL Basics

* Basic SELECT statements
* DISTINCT
* Primary Keys
* Constraints

### Section B – Filtering & Optimization

* WHERE clause
* BETWEEN
* Logical operators
* Index concepts
* Query optimization

### Section C – Aggregation

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* GROUP BY
* HAVING

### Section D – Joins & Relationships

* INNER JOIN
* LEFT JOIN
* Multi-table JOIN
* Foreign Keys
* Relationship analysis

### Section E – Advanced SQL

* CASE statements
* Conditional aggregation
* ACID properties
* Transactions
* COMMIT and ROLLBACK

---

## Database Setup

1. Execute `database_setup.sql`.

2. The script will:

   * Create the database.
   * Create all required tables.
   * Create indexes.
   * Insert sample data.

3. Execute the SQL files inside each section folder in order:

   * Section_A
   * Section_B
   * Section_C
   * Section_D
   * Section_E

---

## SQL Concepts Demonstrated

* Database Creation
* Table Design
* Primary Keys
* Foreign Keys
* Constraints
* Indexes
* Data Insertion
* Filtering
* Aggregate Functions
* GROUP BY
* HAVING
* INNER JOIN
* LEFT JOIN
* CASE Statements
* Transactions
* ACID Properties

---

## Notes

* The project follows standard SQL syntax.
* Queries are organized section-wise for better readability.
* Comments have been included within the SQL files to improve understanding and maintainability.

---

## Author

**Name:** Tejas Chaudhari

Computer Engineering Undergraduate

Data Engineering Intern 

CEI Internship Program 2026

Maharashtra, India

* Github: https://github.com/TejasC005

* Linkedin : www.linkedin.com/in/tejas-chaudhari-a2817329a

