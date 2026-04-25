-- Rank staff members by total processed orders
SELECT
    staff_id,
    COUNT(*) AS handled_orders
FROM orders_raw
GROUP BY staff_id
ORDER BY handled_orders DESC;