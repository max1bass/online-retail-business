# The purpose of this project is to design and implement a database system for an online retail business specialising in combat sports gear and equipment. The project's objective is to create a scalable and efficient database to support the business's operations, including managing customers, suppliers, products, orders, payments, and product returns.

Main Features:

Entity-Relationship Diagram (ERD):
Developed to visually represent the relationships between six key entities:
- Customers: Tracks buyer information.
- Suppliers: Stores details of product suppliers.
- Products: Includes product information and stock levels.
- Orders: Manages order details linking customers and products.
- Payments: Tracks payment transactions and services used.
- Returns: Records returned products, reasons, and refunds.

Database Development:
- Built using MySQL Workbench 8.0.
- Includes six relational tables with primary and foreign keys ensuring data integrity.
- Sample data for all tables were generated using Mockaroo.

Key SQL Functionalities:

Views:
- Weekly transactions.
- Stock details by supplier and stock sold.
Triggers:
- Automatic stock level updates after sales.
Advanced Queries:
- Monthly and yearly sales totals with roll-ups.
- Sales growth percentage from the start of operations.
- List of all product returns.

Data Mart:
Consolidates results from select views (e.g., weekly transactions, stock details) for analysis.

Use Cases:
- Inventory management through automated updates.
- Sales tracking and reporting for decision-making.
- Handling returns efficiently with recorded reasons and refunds.

This project demonstrates how a well-designed database can streamline and enhance operations for an online retail business.
