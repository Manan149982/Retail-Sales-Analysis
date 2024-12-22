--- "Database and Table creation" ---

CREATE DATABASE sql_project_1;
USE sql_project_1;
CREATE TABLE retail_sales (
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
SELECT * FROM retail_sales;

--- "Total no. of records in the dataset" ---
SELECT count(*) FROM retail_sales;

--- "No. of unique customers"---
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

--- "Identify all the unique products" ---
SELECT DISTINCT category FROM retail_sales;

--- "Check for null values and delete records with missing data" ---
SELECT * FROM retail_sales
WHERE transaction_id IS NOT NULL OR sale_date IS NOT NULL OR 
sale_time IS NOT NULL OR customer_id IS NOT NULL OR gender IS NOT NULL OR 
age IS NOT NULL OR category IS NOT NULL OR quantity IS NOT NULL OR 
price_per_unit IS NOT NULL OR cogs IS NOT NULL OR total_sales IS NOT NULL; 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM retail_sales 
WHERE transaction_id IS NULL OR sale_date IS NULL OR 
sale_time IS NULL OR customer_id IS NULL OR gender IS NULL OR 
age IS NULL OR category IS NULL OR quantity IS NULL OR 
price_per_unit IS NULL OR cogs IS NULL OR total_sales IS NULL;

--- "Retrieve sales made on 9th August 2022" ---
SELECT * FROM retail_sales WHERE sale_date = '2022-08-09';

--- "Retreive transactions of clothing category made in the month of November and quantity is more than 3" ---
SELECT * FROM retail_sales 
WHERE category = 'clothing' AND quantity > 3 AND MONTH(sale_date) = 11 ;

--- "Calculate total sales for each category " ---
SELECT category, SUM(total_sales) as net_sales, COUNT(*) as total_orders
FROM retail_sales
GROUP BY category;

--- "Find average age of customers purchased for Electronics" ---
SELECT category, AVG(age) 
FROM retail_sales 
GROUP BY category
HAVING category = 'Electronics';

--- "Find total number of transactions made by each gender in each category" ---
SELECT gender, category, COUNT(*) as total_transactions
FROM retail_sales 
GROUP BY gender, category
ORDER BY gender;

--- "Calculate average sales for each month and find out best selling month from each year" ---



--- "Find top 10 customers based on the highest total sales" ---
SELECT customer_id, COUNT(total_sales) 
FROM retail_sales
GROUP BY customer_id
ORDER BY COUNT(total_sales) DESC
LIMIT 10;

--- "Find the number of unique customers who purchased items from each category" ---
SELECT category, COUNT(DISTINCT customer_id) as unique_customers
FROM retail_sales
GROUP BY category;

