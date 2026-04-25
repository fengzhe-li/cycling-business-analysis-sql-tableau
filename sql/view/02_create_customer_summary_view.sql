-- View: public.customer_summary

-- DROP VIEW public.customer_summary;

CREATE OR REPLACE VIEW public.customer_summary
 AS
 SELECT customer_id,
    count(*) AS total_orders,
    min(order_date) AS first_order,
    max(order_date) AS last_order
   FROM orders_raw
  GROUP BY customer_id;

ALTER TABLE public.customer_summary
    OWNER TO postgres;

