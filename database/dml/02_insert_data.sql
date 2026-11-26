-- Name: MUDAHINYUKA ESENGO Alkad
-- Student ID: 28978
-- Project: CISCS
-- File: 02_insert_data.sql

-- 1. Insert Suppliers
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (1, 'MeatCo');
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (2, 'BakeryInc');
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (3, 'FarmFresh');
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (4, 'SeafoodLtd');
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (5, 'DairyCo');

-- 2. Insert Ingredients
INSERT INTO Ingredients (IngredientID, Name, Current_Stock, Min_Threshold, SupplierID) VALUES (1, 'Beef', 50, 10, 1);
INSERT INTO Ingredients (IngredientID, Name, Current_Stock, Min_Threshold, SupplierID) VALUES (2, 'Bun', 100, 20, 2);
INSERT INTO Ingredients (IngredientID, Name, Current_Stock, Min_Threshold, SupplierID) VALUES (3, 'Cheese', 30, 5, 5);
INSERT INTO Ingredients (IngredientID, Name, Current_Stock, Min_Threshold, SupplierID) VALUES (4, 'Dough', 40, 10, 2);
INSERT INTO Ingredients (IngredientID, Name, Current_Stock, Min_Threshold, SupplierID) VALUES (5, 'Tomato', 80, 15, 3);
INSERT INTO Ingredients (IngredientID, Name, Current_Stock, Min_Threshold, SupplierID) VALUES (6, 'Chicken', 40, 10, 1);
INSERT INTO Ingredients (IngredientID, Name, Current_Stock, Min_Threshold, SupplierID) VALUES (7, 'Fish', 20, 5, 4);

-- 3. Insert Menu Items
INSERT INTO Menu_Items (MenuItemID, Name, Price) VALUES (1, 'Beef Burger', 12.50);
INSERT INTO Menu_Items (MenuItemID, Name, Price) VALUES (2, 'Veggie Pizza', 15.00);
INSERT INTO Menu_Items (MenuItemID, Name, Price) VALUES (3, 'Chicken Salad', 10.00);
INSERT INTO Menu_Items (MenuItemID, Name, Price) VALUES (4, 'Fish and Chips', 18.00);

-- 4. Insert Orders
INSERT INTO Orders (OrderID, OrderDate, TotalPrice) VALUES (1001, TO_DATE('2026-10-01', 'YYYY-MM-DD'), 12.50);
INSERT INTO Orders (OrderID, OrderDate, TotalPrice) VALUES (1002, TO_DATE('2026-10-01', 'YYYY-MM-DD'), 15.00);
INSERT INTO Orders (OrderID, OrderDate, TotalPrice) VALUES (1003, TO_DATE('2026-10-02', 'YYYY-MM-DD'), 10.00);

-- 5. Insert Order Items
INSERT INTO Order_Items (OrderID, MenuItemID, IngredientID, Quantity) VALUES (1001, 1, 1, 2);
INSERT INTO Order_Items (OrderID, MenuItemID, IngredientID, Quantity) VALUES (1001, 1, 2, 1);
INSERT INTO Order_Items (OrderID, MenuItemID, IngredientID, Quantity) VALUES (1002, 2, 4, 1);
INSERT INTO Order_Items (OrderID, MenuItemID, IngredientID, Quantity) VALUES (1003, 3, 6, 1);

COMMIT;
