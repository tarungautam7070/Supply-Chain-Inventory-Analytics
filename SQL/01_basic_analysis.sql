-- Basic Supply Chain Analysis
SELECT COUNT(DISTINCT order_id) AS total_orders, SUM(sales) AS total_sales, SUM(quantity) AS total_quantity 
  FROM orders;
SELECT p.category, SUM(o.sales) AS total_sales 
  FROM products p 
  JOIN orders o 
  ON p.product_id=o.product_id 
  GROUP BY p.category 
  ORDER BY total_sales DESC;
SELECT p.product_id, p.product_name, SUM(o.sales) AS total_sales 
  FROM products p
  JOIN orders o
  ON p.product_id=o.product_id 
  GROUP BY p.product_id,p.product_name 
  ORDER BY total_sales DESC;
