-- Analyze distribution of order statuses
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders_raw
GROUP BY order_status
ORDER BY total_orders DESC;