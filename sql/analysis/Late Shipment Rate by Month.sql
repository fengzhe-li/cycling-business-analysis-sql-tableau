-- Monthly late shipment percentage

SELECT
    DATE_TRUNC('month', order_date) AS month,
    ROUND(
        100.0 *
        SUM(CASE WHEN shipped_date > required_date THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS late_rate_pct
FROM orders_raw
GROUP BY 1
ORDER BY 1;