-- Multi-table JOIN Analysis
SELECT o.order_id,o.order_date,p.product_name,p.category,w.warehouse_name,w.region,o.quantity,o.sales
  FROM orders o 
  JOIN products p 
  ON o.product_id=p.product_id 
  JOIN warehouses w 
  ON o.warehouse_id=w.warehouse_id
  ORDER BY o.order_date DESC;

SELECT p.product_id,p.product_name,p.category,s.supplier_name,s.country,s.lead_time_days
FROM products p 
  JOIN suppliers s
  ON p.supplier_id=s.supplier_id 
  ORDER BY p.product_name;
