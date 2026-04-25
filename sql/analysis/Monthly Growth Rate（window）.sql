-- Calculate month-over-month order growth

WITH monthly_orders AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        COUNT(*) AS total_orders
    FROM orders_raw
    GROUP BY 1
)

SELECT
    month,
    total_orders,
    LAG(total_orders) OVER (ORDER BY month) AS previous_month,
    ROUND(
        100.0 *
        (total_orders - LAG(total_orders) OVER (ORDER BY month))
        / LAG(total_orders) OVER (ORDER BY month),
        2
    ) AS growth_pct
FROM monthly_orders;