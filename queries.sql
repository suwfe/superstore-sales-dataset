-- Monthly revenue
SELECT 
  substr("Order Date", 7, 4) || '-' || substr("Order Date", 4, 2) AS month,
  SUM("Sales") AS revenue
FROM orders
GROUP BY month
ORDER BY month;

-- Revenue by category
SELECT 
  "Category",
  SUM("Sales") AS revenue
FROM orders
GROUP BY "Category"
ORDER BY revenue DESC;

-- Revenue by region
SELECT 
  "Region",
  SUM("Sales") AS revenue
FROM orders
GROUP BY "Region"
ORDER BY revenue DESC;

-- Top customers by spend
SELECT 
  "Customer ID",
  SUM("Sales") AS total_spent
FROM orders
GROUP BY "Customer ID"
ORDER BY total_spent DESC
LIMIT 10;

-- Customer behavior
SELECT 
  "Customer ID",
  COUNT(*) AS num_orders,
  SUM("Sales") AS total_spent
FROM orders
GROUP BY "Customer ID"
ORDER BY num_orders DESC
LIMIT 10;

-- Summary stats
SELECT 
  COUNT(DISTINCT "Customer ID") AS total_customers,
  COUNT(*) AS total_orders,
  SUM("Sales") AS total_revenue
FROM orders;
