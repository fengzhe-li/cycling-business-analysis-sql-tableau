-- View: public.customer_segments

-- DROP VIEW public.customer_segments;

CREATE OR REPLACE VIEW public.customer_segments
 AS
 SELECT customer_id,
    count(order_id) AS total_orders,
        CASE
            WHEN count(order_id) = 1 THEN 'New'::text
            WHEN count(order_id) >= 2 AND count(order_id) <= 4 THEN 'Repeat'::text
            WHEN count(order_id) >= 5 THEN 'Loyal'::text
            ELSE NULL::text
        END AS customer_type
   FROM orders_raw
  GROUP BY customer_id;

ALTER TABLE public.customer_segments
    OWNER TO postgres;

