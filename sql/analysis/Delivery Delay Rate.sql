-- Measure delayed shipments where shipped date exceeded required date
SELECT
    COUNT(*) AS total_orders,
    SUM(
        CASE
            WHEN shipped_date > required_date THEN 1
            ELSE 0
        END
    ) AS delayed_orders
FROM orders_raw;