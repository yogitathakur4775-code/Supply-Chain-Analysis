# step - 1 create data set
CREATE DATABASE supply_chain;
USE supply_chain;
# STEP 2 — Create Table using MySQL Workbench  name supply_chain_data

# STEP 3 — Verify Import
SELECT * FROM supply_chain_data;

#STEP 4 — Explore Dataset
SELECT COUNT(*) FROM supply_chain_data;  # explore dataset

SELECT * FROM supply_chain_data
LIMIT 10;        # Show first records

DESCRIBE supply_chain_data; # DESCRIBE supply_chain_data

# STEP 5 — Basic Queries
SELECT DISTINCT `Product type`
FROM supply_chain_data;

SELECT DISTINCT `Supplier name`
FROM supply_chain_data;

SELECT DISTINCT `Transportation modes`
FROM supply_chain_data;


# STEP 6 — Aggregate Functions
SELECT AVG(Price)
FROM supply_chain_data;

SELECT MAX(Price)
FROM supply_chain_data;

SELECT MIN(Price)
FROM supply_chain_data;

#
SELECT SUM(`Revenue generated`)
FROM supply_chain_data;



SELECT AVG(`Shipping costs`)
FROM supply_chain_data;



# STEP 7 — Filtering (WHERE)
#Products costing more than 80
SELECT *
FROM supply_chain_data
WHERE Price > 80;

#Revenue greater than 8000
SELECT *
FROM supply_chain_data
WHERE `Revenue generated` > 8000;

#Haircare Products
SELECT *
FROM supply_chain_data
WHERE `Product type`='haircare';


# Excellent Inspection Results
SELECT *
FROM supply_chain_data
WHERE `Inspection results`='Pass';

# STEP 8 — Sorting
#Highest Revenue
SELECT *
FROM supply_chain_data
ORDER BY `Revenue generated` DESC;

#Lowest Revenue
SELECT *
FROM supply_chain_data
ORDER BY `Revenue generated`;

# Highest Manufacturing Cost
SELECT *
FROM supply_chain_data
ORDER BY `Manufacturing costs` DESC;


# STEP 9 — GROUP BY
#Average Revenue by Product Type
SELECT
`Product type`,
AVG(`Revenue generated`) AS Avg_Revenue
FROM supply_chain_data
GROUP BY `Product type`;

#Total Revenue by Product Type
SELECT
`Product type`,
SUM(`Revenue generated`) AS Total_Revenue
FROM supply_chain_data
GROUP BY `Product type`;

#Average Price by Product Type
SELECT
`Product type`,
AVG(Price)
FROM supply_chain_data
GROUP BY `Product type`;

#Average Manufacturing Cost
SELECT
`Supplier name`,
AVG(`Manufacturing costs`)
FROM supply_chain_data
GROUP BY `Supplier name`;

#Average Defect Rate
SELECT
`Supplier name`,
AVG(`Defect rates`)
FROM supply_chain_data
GROUP BY `Supplier name`;

# Transportation Mode Usage
SELECT
`Transportation modes`,
COUNT(*) AS Total
FROM supply_chain_data
GROUP BY `Transportation modes`;

#Inspection Results Count
SELECT
`Inspection results`,
COUNT(*) AS Total
FROM supply_chain_data
GROUP BY `Inspection results`;


# STEP 10 — HAVING
# Product Types generating revenue above 200000
SELECT
`Product type`,
SUM(`Revenue generated`) AS Revenue
FROM supply_chain_data
GROUP BY `Product type`
HAVING Revenue > 200000;


# STEP 11 — CASE Statement
#Price Category
SELECT

Price,

CASE

WHEN Price<30 THEN 'Low'

WHEN Price<70 THEN 'Medium'

ELSE 'High'

END AS Price_Category

FROM supply_chain_data;



# STEP 12 — LIMIT
# Top 5 Highest Revenue Products

SELECT *
FROM supply_chain_data
ORDER BY `Revenue generated` DESC
LIMIT 5;

# Top 10 Expensive Products

SELECT *
FROM supply_chain_data
ORDER BY Price DESC
LIMIT 10;


# STEP 13 — Views (Bonus)
#Create a reusable view for supplier performance.

#CREATE VIEW supplier_performance AS
SELECT
`Supplier name`,
AVG(`Manufacturing costs`) AS Avg_Cost,
AVG(`Defect rates`) AS Avg_Defect
FROM supply_chain_data
GROUP BY `Supplier name`;
