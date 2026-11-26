-- Name: MUDAHINYUKA ESENGO Alkad
-- Student ID: 28978
-- Project: CISCS
-- File: 02_constraints.sql

-- 1. Primary Keys (pk_<table>)
ALTER TABLE Suppliers ADD CONSTRAINT pk_suppliers PRIMARY KEY (SupplierID);
ALTER TABLE Ingredients ADD CONSTRAINT pk_ingredients PRIMARY KEY (IngredientID);
ALTER TABLE Menu_Items ADD CONSTRAINT pk_menu_items PRIMARY KEY (MenuItemID);
ALTER TABLE Orders ADD CONSTRAINT pk_orders PRIMARY KEY (OrderID);
ALTER TABLE Order_Items ADD CONSTRAINT pk_order_items PRIMARY KEY (OrderID, MenuItemID, IngredientID);

-- 2. Not Null Constraints
ALTER TABLE Suppliers MODIFY SupplierName NOT NULL;
ALTER TABLE Ingredients MODIFY Name NOT NULL;
ALTER TABLE Menu_Items MODIFY Name NOT NULL;
ALTER TABLE Orders MODIFY OrderDate NOT NULL;

-- 3. Check Constraints (ck_<table>_<column>)
ALTER TABLE Ingredients ADD CONSTRAINT ck_ingredients_stock CHECK (Current_Stock >= 0);
ALTER TABLE Ingredients ADD CONSTRAINT ck_ingredients_threshold CHECK (Min_Threshold > 0);
ALTER TABLE Menu_Items ADD CONSTRAINT ck_menu_items_price CHECK (Price > 0);
ALTER TABLE Orders ADD CONSTRAINT ck_orders_price CHECK (TotalPrice >= 0);
ALTER TABLE Order_Items ADD CONSTRAINT ck_order_items_qty CHECK (Quantity > 0);

-- 4. Foreign Keys (fk_<child>_<parent>) with Referential Actions (Task 4)
ALTER TABLE Ingredients ADD CONSTRAINT fk_ingredients_suppliers 
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID) ON DELETE SET NULL;

ALTER TABLE Order_Items ADD CONSTRAINT fk_order_items_orders 
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE;

ALTER TABLE Order_Items ADD CONSTRAINT fk_order_items_menu 
    FOREIGN KEY (MenuItemID) REFERENCES Menu_Items(MenuItemID); -- NO ACTION

ALTER TABLE Order_Items ADD CONSTRAINT fk_order_items_ingredients 
    FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID); -- NO ACTION
