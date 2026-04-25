-- View: public.monthly_growth

-- DROP VIEW public.monthly_growth;

CREATE OR REPLACE VIEW public.monthly_growth
 AS
 WITH m AS (
         SELECT date_trunc('month'::text, orders_raw.order_date::timestamp with time zone) AS month,
            count(*) AS total_orders
           FROM orders_raw
          GROUP BY (date_trunc('month'::text, orders_raw.order_date::timestamp with time zone))
        )
 SELECT month,
    total_orders,
    lag(total_orders) OVER (ORDER BY month) AS prev_orders
   FROM m;

ALTER TABLE public.monthly_growth
    OWNER TO postgres;

