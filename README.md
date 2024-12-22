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
- Record Count: Determine the total number of records in the dataset. <br>
- Customer Count: Find out how many unique customers are in the dataset. <br>
- Category Count: Identify all unique product categories in the dataset. <br>
- Null Value Check: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT count(*)
FROM retail_sales;

SELECT COUNT(DISTINCT customer_id) 
FROM retail_sales;

SELECT DISTINCT category 
FROM retail_sales;

SELECT * 
FROM retail_sales
WHERE transaction_id IS NOT NULL OR 
sale_date IS NOT NULL OR 
sale_time IS NOT NULL OR 
customer_id IS NOT NULL OR 
gender IS NOT NULL OR 
age IS NOT NULL OR 
category IS NOT NULL OR 
quantity IS NOT NULL OR 
price_per_unit IS NOT NULL OR 
cogs IS NOT NULL OR 
total_sales IS NOT NULL; 

SET SQL_SAFE_UPDATES = 0;

DELETE FROM retail_sales 
WHERE transaction_id IS NULL OR 
sale_date IS NULL OR 
sale_time IS NULL OR 
customer_id IS NULL OR 
gender IS NULL OR 
age IS NULL OR 
category IS NULL OR 
quantity IS NULL OR 
price_per_unit IS NULL OR 
cogs IS NULL OR 
total_sales IS NULL;
```
3. Data Analysis & Findings <br>
The following SQL queries were developed to answer specific business questions: <br>

