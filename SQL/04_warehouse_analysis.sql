-- Warehouse Analysis
SELECT w.warehouse_id,w.warehouse_name,w.region, SUM(o.sales) AS total_sales
FROM warehouses w 
JOIN orders o 
ON w.warehouse_id=o.warehouse_id
GROUP BY w.warehouse_id,w.warehouse_name,w.region 
ORDER BY total_sales DESC;

SELECT w.warehouse_name,SUM(o.quantity) AS total_quantity
FROM warehouses w 
JOIN orders o 
ON w.warehouse_id=o.warehouse_id
GROUP BY w.warehouse_name 
ORDER BY total_quantity DESC;

SELECT w.warehouse_name,p.product_name,SUM(o.quantity) AS total_quantity,SUM(o.sales) AS total_sales
FROM warehouses w 
JOIN orders o 
ON w.warehouse_id=o.warehouse_id 
JOIN products p 
ON o.product_id=p.product_id
GROUP BY w.warehouse_name,p.product_name 
ORDER BY w.warehouse_name,total_sales DESC;
