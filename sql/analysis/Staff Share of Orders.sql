-- Calculate each staff member's share of total orders

SELECT
    staff_id,
    COUNT(*) AS total_orders,
    ROUND(
        100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),
        2
    ) AS share_pct
FROM orders_raw
GROUP BY staff_id;