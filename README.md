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
- Write a SQL query to retrieve all columns for sales made on '2022-08-09':
```sql
SELECT * 
FROM retail_sales 
WHERE sale_date = '2022-08-09';
```
- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022:
```sql
SELECT * 
FROM retail_sales 
WHERE category = 'clothing' AND 
quantity > 3 AND 
MONTH(sale_date) = 11 ;
```
- Write a SQL query to calculate the total sales (total_sale) for each category.
```sql
SELECT category, SUM(total_sales) AS net_sales, COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;
```
- Write a SQL query to find the average age of customers who purchased items from the 'Electronics' category.
```sql
SELECT category, AVG(age) 
FROM retail_sales 
GROUP BY category
HAVING category = 'Electronics';
```
- Write a SQL query to find all transactions where the total_sale is greater than 1000.
```sql
SELECT *
FROM retail_sales
WHERE total_sales > 1000;
```
- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
```sql
SELECT gender, category, COUNT(*) AS total_transactions
FROM retail_sales 
GROUP BY gender, category
ORDER BY gender;
```
- Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.


- Write a SQL query to find the top 10 customers based on the highest total sales.
```sql
SELECT customer_id, COUNT(total_sales) 
FROM retail_sales
GROUP BY customer_id
ORDER BY COUNT(total_sales) DESC
LIMIT 10;
```
- Write a SQL query to find the number of unique customers who purchased items from each category.
```sql
SELECT category, COUNT(DISTINCT customer_id) as unique_customers
FROM retail_sales
GROUP BY category;
```
## Findings

- Customer Demographics: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty. 
- High-Value Transactions: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- Sales Trends: Monthly analysis shows variations in sales, helping identify peak seasons.
- Customer Insights: The analysis identifies the top-spending customers and the most popular product categories.
