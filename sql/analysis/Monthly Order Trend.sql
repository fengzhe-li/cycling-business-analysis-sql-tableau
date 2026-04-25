-- Calculate total number of orders by month
SELECT
    DATE_TRUNC('month', order_date) AS month,
    COUNT(*) AS total_orders
FROM orders_raw
GROUP BY 1
ORDER BY 1;
