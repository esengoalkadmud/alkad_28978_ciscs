-- Name: MUDAHINYUKA ESENGO Alkad
-- Student ID: 28978
-- Project: CISCS
-- File: 01_create_tables.sql

CREATE TABLE Suppliers (
    SupplierID NUMBER(6),
    SupplierName VARCHAR2(100)
);

CREATE TABLE Ingredients (
    IngredientID NUMBER(6),
    Name VARCHAR2(100),
    Current_Stock NUMBER(10,2) DEFAULT 0,
    Min_Threshold NUMBER(10,2),
    SupplierID NUMBER(6)
);

CREATE TABLE Menu_Items (
    MenuItemID NUMBER(6),
    Name VARCHAR2(100),
    Price NUMBER(10,2)
);

CREATE TABLE Orders (
    OrderID NUMBER(10),
    OrderDate DATE DEFAULT SYSDATE,
    TotalPrice NUMBER(10,2)
);

CREATE TABLE Order_Items (
    OrderID NUMBER(10),
    MenuItemID NUMBER(6),
    IngredientID NUMBER(6),
    Quantity NUMBER(10,2)
);
