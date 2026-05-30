create database ecommerce_product_analysis;
use ecommerce_product_analysis;
CREATE TABLE ecommerce_product_analysis (
    Order_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Customer_City VARCHAR(100),
    Product_Name VARCHAR(200),
    Category VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT,
    Order_Date DATE,
    Delivery_Date DATE,
    Payment_Method VARCHAR(50),
    Order_Status VARCHAR(50),
    Seller_Name VARCHAR(200)
);
select * from ecommerce_product_analysis

-- DATA CLEANING IN SQL
-- CHECK NULL 
SELECT * FROM ecommerce_product_analysis
WHERE Product_Name IS NULL
   OR Price IS NULL

   -- REMOVE DUPLICATE
WITH CTE AS (
SELECT *,
ROW NUMBER() OVER(
PARTITION BY Order_ID
ORDER BY Order_ID
) AS rn
FROM ecommerce_product_analysis
)

DELETE FROM CTE
WHERE rn > 1;

-- CREATING BUSINESS KPIs USING SQL
-- 1 TOTAL REVENUE
SELECT
SUM(Price * Quantity) AS Total_Revenue
FROM ecommerce_product_analysis;

-- 2 TOTAL ORDERS
SELECT COUNT(Order_ID) AS Total_Orders
FROM ecommerce_product_analysis;

-- 3 AVERAGE ORDER VALUE
SELECT
SUM(Price * Quantity) / COUNT(Order_ID) AS Avg_Order_Value
FROM ecommerce_product_analysis;

-- 4 TOTAL QUANTITY SOLD 
SELECT
SUM(Quantity) AS Total_Products_Sold
FROM ecommerce_product_analysis;

-- 5 TOP SELLING CATEGORY
SELECT Category,
SUM(Price * Quantity) AS Revenue
FROM ecommerce_product_analysis
GROUP BY Category
ORDER BY Revenue DESC;

-- 6 TOP SELLING PRODUCT
SELECT Product_Name,
SUM(Price * Quantity) AS Revenue
FROM ecommerce_product_analysis
GROUP BY Product_Name
ORDER BY Revenue DESC;

-- 7 DELIEVERY PERFORMANCE
SELECT
AVG(DATEDIFF(Order_Date, Delivery_Date)) AS Avg_Delivery_Days
FROM ecommerce_product_analysis;

-- 7 ORDER STATUS ANALYSIS
SELECT
Order_Status,
COUNT(*) AS Total_Orders
FROM ecommerce_product_analysis
GROUP BY Order_Status;

-- ADVANCED SQL ANALYSIS
-- 1 MONTHLY REVENUE TREND
SELECT
YEAR(Order_Date) AS Year,
MONTH(Order_Date) AS Month,
SUM(Price * Quantity) AS Revenue
FROM ecommerce_product_analysis
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month;

-- 2 TOP 10 PRODUCTS
SELECT
Product_Name,
SUM(Quantity) AS Units_Sold,
SUM(Price * Quantity) AS Revenue
FROM ecommerce_product_analysis
GROUP BY Product_Name
ORDER BY Revenue DESC;

-- 3 BEST PERFORMING SELLERS
SELECT
Seller_Name,
SUM(Price * Quantity) AS Revenue
FROM ecommerce_product_analysis
GROUP BY Seller_Name
ORDER BY Revenue DESC;

-- 4 CITY WISE SALES
SELECT
Customer_City,
SUM(Price * Quantity) AS Revenue
FROM ecommerce_product_analysis
GROUP BY Customer_City
ORDER BY Revenue DESC;

-- 5 PAYEMENT METHOD ANALYSIS
SELECT
Payment_Method,
COUNT(*) AS Orders,
SUM(Price * Quantity) AS Revenue
FROM ecommerce_product_analysis
GROUP BY Payment_Method;

-- 6 CATEGORY PERFORMANCE
SELECT
Category,
SUM(Quantity) AS Units_Sold,
SUM(Price * Quantity) AS Revenue
FROM ecommerce_product_analysis
GROUP BY Category
ORDER BY Revenue DESC;