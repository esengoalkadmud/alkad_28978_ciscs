# Dataset Card

- **Source:** Synthetically generated for the Culinary Inventory & Spoilage Control System (CISCS) project.
- **Licence:** Open Data (CC0)
- **Format:** CSV
- **Size:** 500 records
- **Date Collected:** November 2026
- **What one record represents:** One customer order, including the date, the menu item sold, the total price, a comma-separated list of ingredients used (repeating group), and the suppliers involved.
- **Data Quality Issues Identified:**
  - 0 missing values found.
  - 20 duplicate `OrderID` rows identified (due to multiple ingredients in one order).
  - Repeating groups in `Ingredients_Used` (multiple values in one cell).
  - Repeating groups in `Supplier` (multiple values in one cell).
  - Data is not normalized (violates 1NF).
