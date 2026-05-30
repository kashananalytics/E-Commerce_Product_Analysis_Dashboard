<img width="628" height="353" alt="Overview" src="https://github.com/user-attachments/assets/23f890ad-fd00-4f1d-842f-b83a131dfc83" />
<img width="628" height="352" alt="Product Performance" src="https://github.com/user-attachments/assets/a309cfb1-e7a8-4a9b-910a-0f94fa87b0c1" />
<img width="627" height="350" alt="Operational Insights" src="https://github.com/user-attachments/assets/d3e23fdc-3f81-46f8-bb6b-01f853fa3da2" />
# E-Commerce_Product_Analysis_Dashboard
Analyzed a complete E-Commerce dlDataset in SQL first, then built a 3-page Power BI Dashboard that shows exactly which products are winning, which categories drive the most revenue, and where the operational gaps are hiding.

# 🛒 E-Commerce Product Analysis Dashboard — Power BI + SQL

> A 3-page Power BI dashboard built on top of SQL data analysis — covering revenue trends, product performance, seller rankings, geographic distribution, and operational delivery insights for a complete e-commerce business view.

---

## 📸 Dashboard Preview

Overview Page
<br>
![Dashboard Preview](dashboard.png)

Product Performance Page
<br>
![Dashboard Preview](dashboard.png)

Operational Insights Page
<br>
![Dashboard Preview](dashboard.png)



---

## 📌 Project Summary

This project combines **MySQL data analysis** with **Power BI visualization** to analyze a full e-commerce dataset. The data was first explored and queried in SQL before being connected to Power BI where a 3-page interactive dashboard was built.

**At a glance:** 4M total revenue · 1,400 orders · 4,130 units sold · 2,959 average order value

---

## 🔢 KPI Cards (All Pages)

| KPI | Value |
|---|---|
| 💰 Total Revenue | 4M |
| 📋 Total Orders | 1,400 |
| 📦 Total Quantity | 4,130 |
| 🛒 Average Order Value | 2,959 |

---

## 🎛️ Filters & Slicers

| Filter | Options |
|---|---|
| Category | All categories dropdown |
| Product | All products dropdown |
| Seller | All sellers dropdown |
| Order Status | All statuses dropdown |
| Order Date | 26/02/2024 to 25/02/2025 |
| Delivery Date | 28/02/2024 to 07/03/2025 |
| Month | All months dropdown |

---

## 📊 Page 1 — Overview

**1. Monthly Revenue Trend — Area Line Chart**
Tracks revenue across all 12 months. Peaked in August—September, dipped in February and March.

**2. Top Performing Categories — Bar Chart**

| Category | Revenue |
|---|---|
| Electronics | 0.69M |
| Automotive | 0.63M |
| Beauty | 0.61M |
| Sports | 0.60M |
| Books | 0.56M |
| Home Appliances | 0.54M |
| Fashion | 0.51M |

**3. Revenue by Category — Horizontal Bar Chart**
Same data as above displayed horizontally for easy comparison.

**4. Order Status Distribution — Donut Chart**

| Status | Count |
|---|---|
| Delivered | 375 |
| Pending | 353 |
| Cancelled | 341 |
| Returned | 331 |

**5. Payment Method — Donut Chart**

| Method | Amount |
|---|---|
| Online Banking | 1M |
| Cash on Delivery | 1M |
| Credit Card | 1M |
| Debit Card | 1M |

All four methods are almost equally distributed — no single method dominates.

---

## 📊 Page 2 — Product Performance

**6. Top Performing Products — Treemap**

| Product | Revenue |
|---|---|
| Sleek Laptop | 79K |
| Budget Sneakers | 74K |
| Budget Smartwatch | 68K |
| Modern Jeans | 66K |
| Smart Watch | 66K |
| Premium Backpack | 65K |
| Innovative Smartwatch | 64K |
| Sleek Smartwatch | 64K |

**7. Top Performing Sellers — Bar Chart**

| Seller | Revenue |
|---|---|
| Allen LLC | 0.014M |
| Turner Group | 0.014M |
| Schultz Inc | 0.013M |
| Williams and Co | 0.011M |
| Gonzalez LLC | 0.010M |
| Stark-English | 0.010M |
| Dominguez LLC | 0.010M |

**8. Quantity vs Revenue — Scatter Plot**
Positive correlation between quantity sold and revenue generated. Higher quantity products trend toward higher revenue with some outliers.

**9. City Wise Performance — Bing Map**
Geographic distribution of sales performance across Europe, Turkey, Ukraine, Romania, France, Germany, Austria and Central Asia.

---

## 📊 Page 3 — Operational Insights

**10. Monthly Sales Growth — Area Line Chart**
Tracks sales volume month by month. September peak at 0.07M dropping toward year end.

**11. Order Status by Category — Grouped Bar Chart**
Shows Cancelled, Delivered, Pending and Returned counts side by side per category — useful for spotting which categories have the highest return or cancellation rates.

**12. Delivery Time Analysis — Bar Chart**

| Month | Delivery Volume |
|---|---|
| January | 0.002M |
| February | 0.003M |
| March | 0.023M |
| April | 0.010M |
| May | 0.020M |
| June | 0.020M |
| August | 0.020M |
| September | 0.008M |
| November | 0.005M |

March had the highest delivery volume — nearly 3x the months around it.

---

## 🗃️ SQL Analysis

Before building the Power BI dashboard, the data was explored and analyzed in MySQL. Key queries written:

```sql
-- Total revenue by category
SELECT category,
       ROUND(SUM(revenue), 2) AS Total_Revenue
FROM ecommerce_orders
GROUP BY category
ORDER BY Total_Revenue DESC;

-- Top performing products
SELECT product_name,
       ROUND(SUM(revenue), 2) AS Product_Revenue
FROM ecommerce_orders
GROUP BY product_name
ORDER BY Product_Revenue DESC
LIMIT 10;

-- Order status breakdown
SELECT order_status, COUNT(*) AS Total_Orders
FROM ecommerce_orders
GROUP BY order_status
ORDER BY Total_Orders DESC;

-- Monthly revenue trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS Month,
       ROUND(SUM(revenue), 2) AS Monthly_Revenue
FROM ecommerce_orders
GROUP BY Month
ORDER BY Month;

-- Top sellers by revenue
SELECT seller_name,
       ROUND(SUM(revenue), 2) AS Seller_Revenue
FROM ecommerce_orders
GROUP BY seller_name
ORDER BY Seller_Revenue DESC
LIMIT 10;

-- Average order value
SELECT ROUND(AVG(order_value), 2) AS Avg_Order_Value
FROM ecommerce_orders;
```

---

## 🧮 DAX Measures

```dax
-- Total Revenue
Total Revenue = SUM('Orders'[Revenue])

-- Total Orders
Total Orders = COUNTROWS('Orders')

-- Total Quantity
Total Quantity = SUM('Orders'[Quantity])

-- Average Order Value
Avg Order Value = DIVIDE([Total Revenue], [Total Orders])

-- Revenue by Category
Revenue by Category =
  CALCULATE([Total Revenue],
  ALLEXCEPT('Orders', 'Orders'[Category]))
```

---

## 💡 Key Insights

- 🏆 **Electronics is the top category** at 0.69M — leads every other category
- 💻 **Sleek Laptop is the best single product** at 79K in revenue
- 📅 **Revenue peaked in August—September** and declined toward year end
- 🚚 **March had the highest delivery volume** — nearly 3x surrounding months
- 💳 **Payment methods are evenly split** — no single method dominates at all
- 🌍 **Sales are geographically spread** across Europe and Central Asia
- ⚠️ **Cancelled and Returned orders are almost equal to Delivered** — worth investigating further
- 📈 **Quantity and Revenue are positively correlated** — confirmed via scatter plot

---

## 🛠️ Tools Used

- **MySQL** — data exploration and analysis
- **Microsoft Excel** — raw data source
- **Power Query** — data cleaning and transformation
- **Power BI Desktop** — 3-page dashboard design
- **DAX** — all KPI measures and calculations
- **Bing Maps** — city wise geographic performance

---

## 🚀 How to Use

1. Download the `.pbix` file and `analysis.sql` file
2. Run the SQL file in MySQL Workbench to explore raw analysis
3. Open the `.pbix` file in Power BI Desktop
4. Use the **dropdown slicers** on the left to filter by category, product or seller
5. Navigate between pages using **Overview, Product Performance and Operational Insights** tabs
6. Use **date range slicers** on Page 2 to filter by order or delivery date
7. Click any chart to cross-filter all other visuals

---

*Feel free to fork this or use the SQL queries and DAX measures for your own e-commerce or retail analytics projects.*
