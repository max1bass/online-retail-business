# Creating a Data Mart containing the results ONLY from Views (Questions 1, 3 and 4)
CREATE DATABASE DataMart;
USE DataMart;

#Query 1 (View) - View all transactions for a given week in your business.
CREATE TABLE DataMart.WeekTransactions AS SELECT * FROM MartialArtsGear.WeekTransactions;
select * from WeekTransactions;

#Query 3 (View) - View of stock (by supplier) purchased by you.
CREATE TABLE DataMart.MyPurchasedStock AS SELECT * FROM MartialArtsGear.MyPurchasedStock;
select * from MyPurchasedStock;

#Query 4 (View) - View of total stock sold to general public (group by supplier).
CREATE TABLE DataMart.TotalStockSold AS SELECT * FROM MartialArtsGear.TotalStockSold;
select * from TotalStockSold;