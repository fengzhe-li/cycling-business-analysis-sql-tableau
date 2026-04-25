-- Calculate average delivery lead time by store

SELECT
    store_id,
    AVG(shipped_date - order_date) AS avg_delivery_days
FROM orders_raw
GROUP BY store_id;