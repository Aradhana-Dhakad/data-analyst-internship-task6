#  Retail Sales Trend Analysis — Data Analyst Internship (Task 6)

This project is part of my **Data Analyst Internship**. The aim was to perform a comprehensive sales trend analysis using SQL, focusing on monthly revenue and order volume, based on a real-world retail sales dataset.

---

##  Project Objective

The goal of this project was to apply **SQL Aggregation and Grouping techniques** to:

- Calculate **Monthly Total Revenue**.
- Calculate **Monthly Order Volume**.
- Discover sales trends and business insights for the retail dataset.

---

##  Dataset Overview

| Column Name         | Description                                       |
|----------------------|---------------------------------------------------|
| `Transaction ID`     | Unique identifier for each sales transaction.      |
| `Date`               | Date when the transaction occurred.               |
| `Customer ID`        | Unique customer identifier.                       |
| `Gender`             | Gender of the customer.                           |
| `Age`                | Age of the customer.                              |
| `Product Category`   | Category of the purchased product.                |
| `Quantity`           | Units purchased in the transaction.               |
| `Price per Unit`     | Price for a single unit of the product.           |
| `Total Amount`       | Total transaction value (`Quantity` x `Price`).    |

---

##  Tools & Technologies

-  **MySQL Workbench**  
-  **SQL**
-  **Retail Sales Dataset**  
-  SQL Concepts Used:
  - `SUM()` for revenue calculations.
  - `COUNT(DISTINCT)` for unique order counting.
  - `GROUP BY` for month and year aggregation.
  - `ORDER BY` for sorting trends chronologically.
  - `YEAR()` and `MONTH()` for date extraction.

---
