-- View: public.delivery_performance

-- DROP VIEW public.delivery_performance;

CREATE OR REPLACE VIEW public.delivery_performance
 AS
 SELECT store_id,
    round(avg(shipped_date - order_date), 2) AS avg_delivery_days
   FROM orders_raw
  GROUP BY store_id;

ALTER TABLE public.delivery_performance
    OWNER TO postgres;

