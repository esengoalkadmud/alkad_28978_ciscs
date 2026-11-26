# Data Dictionary & Design Justification

## Table Justifications

### 1. Suppliers
- **Purpose:** Stores the real-world entities that provide raw ingredients.
- **Normalization:** 3NF. Contains no repeating groups; all attributes depend solely on `SupplierID`.
- **Keys:** `SupplierID` is a surrogate PK (auto-generated for consistency).

### 2. Ingredients
- **Purpose:** Stores raw materials used in meals, tracking current stock and spoilage thresholds.
- **Normalization:** 3NF. `SupplierID` is a foreign key to avoid repeating supplier details (transitive dependency removed).
- **Keys:** `IngredientID` is a surrogate PK.

### 3. Menu_Items
- **Purpose:** Stores the dishes sold to customers and their selling price.
- **Normalization:** 3NF. 
- **Keys:** `MenuItemID` is a surrogate PK.

### 4. Orders
- **Purpose:** Stores the header information for a customer transaction.
- **Normalization:** 3NF.
- **Keys:** `OrderID` is a surrogate PK.

### 5. Order_Items (Junction Table)
- **Purpose:** Resolves the many-to-many relationship between Orders, Menu_Items, and Ingredients. It shows exactly which ingredients were used in which order.
- **Normalization:** 3NF. Contains only FKs and the dependent attribute (Quantity).
- **Keys:** Composite PK `(OrderID, MenuItemID, IngredientID)`.

---

## Detailed Data Dictionary

### Table: Suppliers
| Column | Data type | Null? | Constraint | Why / description |
|---|---|---|---|---|
| SupplierID | NUMBER(6) | No | PK (pk_suppliers) | Unique identifier for the supplier. |
| SupplierName | VARCHAR2(100) | No | NOT NULL | Name of the vendor. |

### Table: Ingredients
| Column | Data type | Null? | Constraint | Why / description |
|---|---|---|---|---|
| IngredientID | NUMBER(6) | No | PK (pk_ingredients) | Unique identifier for the ingredient. |
| Name | VARCHAR2(100) | No | NOT NULL | Name of the raw food item. |
| Current_Stock | NUMBER(10,2) | No | CHECK >= 0 | Real-time quantity in storage. Cannot be negative. |
| Min_Threshold | NUMBER(10,2) | No | CHECK > 0 | Triggers a reorder alert when stock falls below this. |
| SupplierID | NUMBER(6) | No | FK (fk_ingredients_suppliers) | Links to the supplier who provides it. |

### Table: Menu_Items
| Column | Data type | Null? | Constraint | Why / description |
|---|---|---|---|---|
| MenuItemID | NUMBER(6) | No | PK (pk_menu_items) | Unique identifier for the dish. |
| Name | VARCHAR2(100) | No | NOT NULL | Name of the dish on the menu. |
| Price | NUMBER(10,2) | No | CHECK > 0 | Selling price. Cannot be zero or negative. |

### Table: Orders
| Column | Data type | Null? | Constraint | Why / description |
|---|---|---|---|---|
| OrderID | NUMBER(10) | No | PK (pk_orders) | Unique identifier for the transaction. |
| OrderDate | DATE | No | DEFAULT SYSDATE | Date and time the order was placed. |
| TotalPrice | NUMBER(10,2) | No | CHECK >= 0 | Total cost of the order. |

### Table: Order_Items
| Column | Data type | Null? | Constraint | Why / description |
|---|---|---|---|---|
| OrderID | NUMBER(10) | No | PK, FK (fk_oi_orders) | Links to the order. |
| MenuItemID | NUMBER(6) | No | PK, FK (fk_oi_menu) | Links to the menu item. |
| IngredientID | NUMBER(6) | No | PK, FK (fk_oi_ingredients) | Links to the ingredient used. |
| Quantity | NUMBER(10,2) | No | CHECK > 0 | Amount of ingredient used for this order. |

---

## Foreign Key Decision Table
| Foreign key name | Child table | Parent table | Rule chosen | Why this rule |
|---|---|---|---|---|
| fk_ingredients_suppliers | Ingredients | Suppliers | ON DELETE SET NULL | If a supplier leaves, the ingredient still exists in inventory; it just needs a new supplier later. |
| fk_oi_orders | Order_Items | Orders | ON DELETE CASCADE | If an order is cancelled/deleted, the items used for that order must be removed from the system. |
| fk_oi_menu | Order_Items | Menu_Items | NO ACTION | A menu item cannot be deleted if it has been used in historical orders (protects sales history). |
| fk_oi_ingredients | Order_Items | Ingredients | NO ACTION | An ingredient cannot be deleted if it has been used in an order. |

**Key Updates:** Since Oracle does not support `ON UPDATE CASCADE`, we use surrogate Primary Keys (like `SupplierID` or `OrderID`) that never change. If a natural key (like a Supplier's Name) changes, it doesn't affect the child tables because they reference the ID, not the name.
