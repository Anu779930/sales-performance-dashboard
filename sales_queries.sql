-- ============================
-- Sales Performance SQL Queries
-- Dataset: Superstore
-- ============================

-- 1) Sales by Region
SELECT
    Region,
    SUM(Sales)  AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 2) Profit by Category
SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- 3) Monthly Sales Trend
-- SQL Server syntax shown (use DATE_FORMAT for MySQL, TO_CHAR for PostgreSQL)
SELECT
    FORMAT([Order Date], 'yyyy-MM') AS YearMonth,
    SUM(Sales) AS Monthly_Sales
FROM Superstore
GROUP BY FORMAT([Order Date], 'yyyy-MM')
ORDER BY YearMonth;

-- 4) Top 10 Products by Sales
SELECT
    [Product Name],
    SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY [Product Name]
ORDER BY Total_Sales DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
