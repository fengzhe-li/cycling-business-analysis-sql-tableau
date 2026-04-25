-- View: public.monthly_kpi

-- DROP VIEW public.monthly_kpi;

CREATE OR REPLACE VIEW public.monthly_kpi
 AS
 SELECT date_trunc('month'::text, order_date::timestamp with time zone) AS month,
    count(*) AS total_orders,
    count(DISTINCT customer_id) AS active_customers,
    count(DISTINCT store_id) AS active_stores,
    round(100.0 * sum(
        CASE
            WHEN shipped_date > required_date THEN 1
            ELSE 0
        END)::numeric / count(*)::numeric, 2) AS delay_rate_pct
   FROM orders_raw
  GROUP BY (date_trunc('month'::text, order_date::timestamp with time zone))
  ORDER BY (date_trunc('month'::text, order_date::timestamp with time zone));

ALTER TABLE public.monthly_kpi
    OWNER TO postgres;

