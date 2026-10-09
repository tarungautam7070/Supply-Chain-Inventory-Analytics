-- Inventory Analysis
SELECT i.product_id,i.warehouse_id,i.stock_quantity,i.reorder_level,
CASE WHEN i.stock_quantity<i.reorder_level 
THEN 'Low Stock' 
WHEN i.stock_quantity=i.reorder_level 
THEN 'At Reorder Level' 
ELSE 'Sufficient Stock' 
END AS stock_status
FROM inventory i;

SELECT i.product_id,i.warehouse_id,i.stock_quantity,i.reorder_level
FROM inventory i 
WHERE i.stock_quantity<i.reorder_level 
ORDER BY i.stock_quantity;

SELECT i.warehouse_id,SUM(i.stock_quantity) AS total_stock,SUM(i.reorder_level) AS total_reorder_level
FROM inventory i 
GROUP BY i.warehouse_id 
ORDER BY total_stock DESC;
