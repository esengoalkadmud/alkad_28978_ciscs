-- Name: MUDAHINYUKA ESENGO Alkad
-- Student ID: 28978
-- Project: CISCS
-- File: 03_indexes.sql

-- Index every Foreign Key (prevents full table scans on joins/deletes)
CREATE INDEX idx_ingredients_supplier ON Ingredients(SupplierID) TABLESPACE ciscs_idx;
CREATE INDEX idx_order_items_orders ON Order_Items(OrderID) TABLESPACE ciscs_idx;
CREATE INDEX idx_order_items_menu ON Order_Items(MenuItemID) TABLESPACE ciscs_idx;
CREATE INDEX idx_order_items_ingredients ON Order_Items(IngredientID) TABLESPACE ciscs_idx;

-- Composite Index (frequently searched together)
CREATE INDEX idx_orders_date_total ON Orders(OrderDate, TotalPrice) TABLESPACE ciscs_idx;

-- Unique Index
CREATE UNIQUE INDEX uq_ingredients_name ON Ingredients(Name) TABLESPACE ciscs_idx;
