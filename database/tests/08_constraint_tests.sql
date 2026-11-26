-- Name: MUDAHINYUKA ESENGO Alkad
-- Student ID: 28978
-- Project: CISCS
-- File: 08_constraint_tests.sql

-- Test 1: CHECK constraint (Current_Stock cannot be negative)
INSERT INTO Ingredients (IngredientID, Name, Current_Stock, Min_Threshold) 
VALUES (99, 'Bad Food', -5, 10);

-- Test 2: PRIMARY KEY (Duplicate ID)
INSERT INTO Suppliers (SupplierID, SupplierName) 
VALUES (1, 'Fake Supplier');

-- Test 3: FOREIGN KEY (Invalid Supplier ID)
INSERT INTO Ingredients (IngredientID, Name, Current_Stock, Min_Threshold, SupplierID) 
VALUES (100, 'Test', 10, 5, 999);
