-- View: public.store_performance

-- DROP VIEW public.store_performance;

CREATE OR REPLACE VIEW public.store_performance
 AS
 SELECT o.store_id,
    s.store_name,
    s.region,
    count(*) AS total_orders,
    count(DISTINCT o.customer_id) AS unique_customers,
    count(DISTINCT o.staff_id) AS active_staff,
    round(count(*)::numeric * 1.0 / count(DISTINCT o.staff_id)::numeric, 2) AS orders_per_staff
   FROM orders_raw o
     LEFT JOIN store_lookup s ON o.store_id = s.store_id
  GROUP BY o.store_id, s.store_name, s.region;

ALTER TABLE public.store_performance
    OWNER TO postgres;

