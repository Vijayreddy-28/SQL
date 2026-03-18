# Task 4 - Multi-Table JOINs and HAVING Clause

## Objective
Combine data from two related tables using JOIN operations and filter results using the HAVING clause.

---

## Requirements

- Create two related tables:
  - `Customers` → stores customer details
  - `Orders` → stores order details with a **foreign key** referencing `Customers`
- Use `INNER JOIN` to retrieve combined information (e.g., customer names with their orders)
- Experiment with `LEFT JOIN` to include customers who may not have orders
- Use aggregate functions and the `HAVING` clause to filter grouped results

---

## Quries and output

### Find all orders along with customer names where the order was placed in March 2026

![Output](images\q1-output.png)

