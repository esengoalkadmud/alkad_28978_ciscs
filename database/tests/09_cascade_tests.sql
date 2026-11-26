-- Name: MUDAHINYUKA ESENGO Alkad
-- Student ID: 28978
-- Project: CISCS
-- File: 09_cascade_tests.sql

-- Test 1: ON DELETE CASCADE
-- Deleting an order should automatically delete its Order_Items
DELETE FROM Orders WHERE OrderID = 1001;
SELECT * FROM Order_Items WHERE OrderID = 1001; 
-- (Should return 0 rows)

-- Test 2: ON DELETE SET NULL
-- Deleting a supplier should set the SupplierID in Ingredients to NULL
DELETE FROM Suppliers WHERE SupplierID = 1;
SELECT IngredientID, Name, SupplierID FROM Ingredients WHERE IngredientID = 1;
-- (Should show SupplierID as empty/NULL)
