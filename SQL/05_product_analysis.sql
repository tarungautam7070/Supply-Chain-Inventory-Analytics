-- Product Analysis
SELECT p.product_id,p.product_name,p.category,SUM(o.quantity) AS total_quantity,SUM(o.sales) AS total_sales
FROM products p 
JOIN orders o 
ON p.product_id=o.product_id
GROUP BY p.product_id,p.product_name,p.category
ORDER BY total_sales DESC;

WITH product_sales AS (
 SELECT p.product_id,p.product_name,SUM(o.sales) AS total_sales
 FROM products p 
 JOIN orders o 
 ON p.product_id=o.product_id
 GROUP BY p.product_id,p.product_name)
SELECT * FROM product_sales 
WHERE total_sales>(SELECT AVG(total_sales) FROM product_sales) 
ORDER BY total_sales DESC;

SELECT p.category,COUNT(DISTINCT p.product_id) AS product_count,SUM(o.quantity) AS total_quantity,SUM(o.sales) AS total_sales
FROM products p 
JOIN orders o ON p.product_id=o.product_id 
GROUP BY p.category 
ORDER BY total_sales DESC;
