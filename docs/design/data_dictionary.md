# Data Dictionary (3NF Logical Design)

### 1. Orders
- `OrderID` (PK, Number) - Unique identifier for each order.
- `OrderDate` (Date, Required) - The date the order was placed.
- `TotalPrice` (Number, Required) - Total cost of the order.

### 2. Menu_Items
- `MenuItemID` (PK, Number) - Unique identifier for the dish.
- `Name` (String, Required) - Name of the dish.
- `Price` (Number, Required) - Selling price of the dish.

### 3. Order_Items
- `OrderID` (PK, FK -> Orders) - Links to the order.
- `MenuItemID` (PK, FK -> Menu_Items) - Links to the menu item.
- `IngredientID` (PK, FK -> Ingredients) - Links to the ingredient.
- `Quantity` (Number, Required) - How much of the ingredient was used.

### 4. Suppliers
- `SupplierID` (PK, Number) - Unique identifier for the supplier.
- `SupplierName` (String, Required) - Name of the supplier.

### 5. Ingredients
- `IngredientID` (PK, Number) - Unique identifier for the ingredient.
- `Name` (String, Required) - Name of the ingredient.
- `SupplierID` (FK -> Suppliers) - The supplier who provides this ingredient.
- `Min_Threshold` (Number, Required) - Minimum stock before reordering.
- `Current_Stock` (Number, Required) - Amount currently in stock.
