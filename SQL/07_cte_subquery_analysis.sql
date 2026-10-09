-- CTE and Subquery Analysis
WITH product_sales AS (
 SELECT p.product_id,p.product_name,p.category,SUM(o.sales) AS total_sales
 FROM products p 
 JOIN orders o 
 ON p.product_id=o.product_id
 GROUP BY p.product_id,p.product_name,p.category)
SELECT * FROM product_sales 
WHERE total_sales>(SELECT AVG(total_sales) FROM product_sales) 
ORDER BY total_sales DESC;

WITH warehouse_sales AS (
 SELECT w.warehouse_id,w.warehouse_name,w.region,SUM(o.sales) 
 AS total_sales
 FROM warehouses w 
 JOIN orders o 
 ON w.warehouse_id=o.warehouse_id
 GROUP BY w.warehouse_id,w.warehouse_name,w.region)
SELECT * FROM warehouse_sales 
ORDER BY total_sales DESC;

SELECT p.product_id,p.product_name,p.category 
FROM products p 
WHERE p.product_id IN (SELECT DISTINCT product_id FROM orders);
