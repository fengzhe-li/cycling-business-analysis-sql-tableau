-- Compare total orders handled by each store
SELECT
    store_id,
    COUNT(*) AS total_orders
FROM orders_raw
GROUP BY store_id
ORDER BY total_orders DESC;