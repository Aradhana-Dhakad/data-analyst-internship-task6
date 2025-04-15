CREATE DATABASE Project;
-- Importing data in the Project database->right click on Table->Table Data Import Wizard->then select the path of csv file->then again and Next then FInish
-- Step1 DATA Preparation and Cleaning
USE Project;
SELECT * FROM sales_data  
LIMIT 10;   -- Sample Data Preview

-- Step1. Data CLeaning and Processing
-- Handling Missing Data or Check for Missing Data
--  Query for Gender
SELECT COUNT(*) AS MissingGender FROM sales_data WHERE Gender IS NULL;
 -- Query for Age
SELECT COUNT(*) AS MissingAge FROM sales_data WHERE Age IS NULL;
-- Query for Product Category
SELECT COUNT(*) AS MissingCategory FROM sales_data WHERE `Product Category` IS NULL; 

-- If missing values are found, you can replace them with `"Unknown"` or `NULL` where appropriate
-- UPDATE sales_data SET Gender = 'Unknown' WHERE Gender IS NULL;

-- Check for duplicate Transaction IDs
-- Use backticks ` instead of single quotation it will resolve the error
SELECT `Transaction ID`, COUNT(*) AS DuplicateCount 
FROM sales_data
GROUP BY `Transaction ID`
HAVING COUNT(*) > 1;

-- Validate Data Types Query:
DESCRIBE sales_data ;  -- Check coln types

-- Step 2: SQL Analysis (Business Queries)**
 -- 5.Total Revenue by Product Category
 
SELECT `Product Category` , SUM(`Total Amount`) AS TotalRevenue
FROM sales_data
GROUP BY `Product Category`
ORDER BY TotalRevenue DESC; 

-- 6.Monthly Sales Trends**:
   SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, SUM(`Total Amount`) AS MonthlySales
   FROM sales_data
   GROUP BY Year, Month
   ORDER BY Year, Month DESC;  

-- 7.Sales by Gender
   SELECT Gender, SUM(`Total Amount`) AS TotalSales
   FROM sales_data
   GROUP BY Gender
   ORDER BY TotalSales DESC;
   
-- 8.Average Spend per Customer
   SELECT `Customer ID`, AVG(`Total Amount`) AS AvgSpend
   FROM sales_data
   GROUP BY `Customer ID`
   ORDER BY AvgSpend DESC; -- `Customer ID`;

-- 9.Top 5 Best-Selling Product Categories by Quantity
   SELECT `Product Category`, SUM(Quantity) AS TotalUnitsSold
   FROM sales_data
   GROUP BY `Product Category`
   ORDER BY TotalUnitsSold DESC
   LIMIT 5;
   
-- 10.Sales Distribution by Age Group
   SELECT MIN(Age), MAX(Age) FROM sales_data;
   
   SELECT 
        CASE 
            WHEN Age BETWEEN 18 AND 24 THEN '18-24'
            WHEN Age BETWEEN 25 AND 32 THEN '25-32'
            WHEN Age BETWEEN 33 AND 39 THEN '33-39'
            WHEN Age BETWEEN 40 AND 47 THEN '40-47'
            WHEN Age BETWEEN 48 AND 54 THEN '48-54'
            WHEN Age BETWEEN 55 AND 60 THEN '55-60'
            ELSE '60+' 
        END AS AgeGroup,
        SUM(`Total Amount`) AS TotalSales
    FROM sales_data
    GROUP BY AgeGroup
    ORDER BY TotalSales DESC;
    
-- 11.Customer Purchasing Frequency ( I can remove this ques)
    SELECT `Customer ID`, COUNT(DISTINCT `Transaction ID`) AS PurchaseCount -- DISTINCT -> queries returns only unique values , removes duplicate values
    FROM sales_data
    GROUP BY `Customer ID`
    ORDER BY PurchaseCount DESC;    
    

-- 12.Top 5 Customers by Total Spend ( Advanced)
    SELECT `Customer ID`, SUM(`Total Amount`) AS TotalSpend
    FROM sales_data
    GROUP BY `Customer ID`
    ORDER BY TotalSpend DESC 
    LIMIT 5;
    
-- 13.Sales by Day of the Week (Advanced)   -- (1=Sunday, 7=Saturday)
    SELECT DAYOFWEEK(Date) AS DayOfWeek, SUM(`Total Amount`) AS TotalSales
    FROM sales_data
    GROUP BY DayOfWeek
    ORDER BY TotalSales DESC; 
    
-- 15.Create View for Monthly Sales Trends (SQL Views)
    CREATE VIEW MonthlySales AS
    SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, SUM(`Total Amount`) AS MonthlySales
    FROM sales_data
    GROUP BY Year, Month
    ORDER BY Year, Month DESC;
SELECT * FROM MonthlySales;

-- 16.Create View for Sales by Product Category
    CREATE VIEW SalesByCategory AS
    SELECT `Product Category`, SUM(`Total Amount`) AS TotalRevenue
    FROM sales_data
    GROUP BY `Product Category`;
SELECT * FROM SalesByCategory;  