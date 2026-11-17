# Normalization Process (UNF to 3NF)

### Unnormalized Form (UNF)
The raw data (`raw_data.csv`) contains repeating groups in the `Ingredients_Used` and `Supplier` columns. One order contains multiple ingredients in a single cell.

| OrderID | OrderDate | MenuItem | TotalPrice | Ingredients_Used | Supplier |
|---|---|---|---|---|---|
| 1001 | 2026-10-01 | Beef Burger | 12.50 | Beef, Bun, Cheese | MeatCo, BakeryInc |

### First Normal Form (1NF)
**Dependency Removed:** Repeating groups. 
We create a new row for each ingredient used in the order. Every cell now contains only atomic (single) values.

| OrderID | OrderDate | MenuItem | TotalPrice | Ingredient | Supplier |
|---|---|---|---|---|---|
| 1001 | 2026-10-01 | Beef Burger | 12.50 | Beef | MeatCo |
| 1001 | 2026-10-01 | Beef Burger | 12.50 | Bun | BakeryInc |
| 1001 | 2026-10-01 | Beef Burger | 12.50 | Cheese | DairyCo |

### Second Normal Form (2NF)
**Dependency Removed:** Partial dependencies. 
`OrderDate`, `MenuItem`, and `TotalPrice` depend only on `OrderID`, not on the specific ingredient. We split the table into `Orders` and `Order_Items`.

**Orders Table:**
| OrderID | OrderDate | TotalPrice |
|---|---|---|
| 1001 | 2026-10-01 | 12.50 |

**Order_Items Table:**
| OrderID | Ingredient | Supplier |
|---|---|---|
| 1001 | Beef | MeatCo |
| 1001 | Bun | BakeryInc |

### Third Normal Form (3NF)
**Dependency Removed:** Transitive dependencies. 
The `Supplier` depends on the `Ingredient`, not directly on the `Order`. We create an `Ingredients` table and a `Suppliers` table.

**Final 3NF Tables:**
1. **Orders:** (OrderID, OrderDate, TotalPrice)
2. **Menu_Items:** (MenuItemID, Name, Price)
3. **Order_Items:** (OrderID, MenuItemID, IngredientID, Quantity)
4. **Ingredients:** (IngredientID, Name, SupplierID)
5. **Suppliers:** (SupplierID, SupplierName)
