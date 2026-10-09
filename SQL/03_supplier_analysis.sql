-- Supplier Analysis
SELECT s.supplier_id,s.supplier_name,SUM(o.sales) AS total_sales
FROM suppliers s 
JOIN products p 
ON s.supplier_id=p.supplier_id 
JOIN orders o
ON p.product_id=o.product_id
GROUP BY s.supplier_id,s.supplier_name 
ORDER BY total_sales DESC;

SELECT s.supplier_name,SUM(o.quantity) AS total_quantity,SUM(o.sales) AS total_sales
FROM suppliers s 
JOIN products p 
ON s.supplier_id=p.supplier_id 
JOIN orders o 
ON p.product_id=o.product_id
GROUP BY s.supplier_name 
ORDER BY total_sales DESC;

SELECT s.supplier_name,SUM(o.sales) AS total_sales
FROM suppliers s 
JOIN products p 
ON s.supplier_id=p.supplier_id 
JOIN orders o 
ON p.product_id=o.product_id
GROUP BY s.supplier_name 
HAVING SUM(o.sales)>10000 
ORDER BY total_sales DESC;
