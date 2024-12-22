# RETAIL SALES ANALYSIS PROJECT (MySQL)
## Project Title: Retail Sales Analysis
Database: `sql_project_1`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.

## Objective
Set up a database: Create and populate a retail sales database with the provided sales data.
Data Cleaning: Identify and remove any records with missing or null values.
Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.
Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure 
1. Creation of Database and Table. <br>
- The projects starts by creating a database named `sql_project_1`
- Then created a table named `retail_sales`
- The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.
```sql
CREATE DATABASE sql_project_1;

CREATE TABLE retail_sales
(
transaction_id INT PRIMARY KEY,
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(10),
age INT,
category VARCHAR(50),
quantity INT,
price_per_unit FLOAT,
cogs FLOAT,
total_sales FLOAT
);

SELECT * 
FROM retail_sales;
```
2. Data Exploration & Cleaning <br>
- Record Count: <br>
Determine the total number of records in the dataset. <br>
- Customer Count: <br>
Find out how many unique customers are in the dataset. <br>
- Category Count: <br>
Identify all unique product categories in the dataset. <br>
- Null Value Check: <br>
Check for any null values in the dataset and delete records with missing data.

