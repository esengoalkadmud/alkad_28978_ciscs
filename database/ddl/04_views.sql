-- Name: MUDAHINYUKA ESENGO Alkad
-- Student ID: 28978
-- Project: CISCS
-- File: 04_views.sql

-- 1. Reporting View (Joins multiple tables into one readable result)
CREATE OR REPLACE VIEW vw_order_details AS
SELECT o.OrderID, o.OrderDate, m.Name AS MenuItem, i.Name AS Ingredient, oi.Quantity
FROM Orders o
JOIN Order_Items oi ON o.OrderID = oi.OrderID
JOIN Menu_Items m ON oi.MenuItemID = m.MenuItemID
JOIN Ingredients i ON oi.IngredientID = i.IngredientID;

-- 2. Summary View (Uses GROUP BY)
CREATE OR REPLACE VIEW vw_daily_sales AS
SELECT OrderDate, COUNT(OrderID) AS TotalOrders, SUM(TotalPrice) AS DailyRevenue
FROM Orders
GROUP BY OrderDate;

-- 3. Protected View (WITH READ ONLY to prevent DML)
CREATE OR REPLACE VIEW vw_low_stock AS
SELECT Name, Current_Stock, Min_Threshold
FROM Ingredients
WHERE Current_Stock <= Min_Threshold
WITH READ ONLY;
