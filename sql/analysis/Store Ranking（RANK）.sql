-- Rank stores by total orders

SELECT
    store_id,
    COUNT(*) AS total_orders,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS store_rank
FROM orders_raw
GROUP BY store_id;