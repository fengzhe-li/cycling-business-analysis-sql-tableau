-- Table: public.orders_raw

-- DROP TABLE IF EXISTS public.orders_raw;

CREATE TABLE IF NOT EXISTS public.orders_raw
(
    order_id integer,
    customer_id integer,
    order_status integer,
    order_date date,
    required_date date,
    shipped_date date,
    store_id integer,
    staff_id integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.orders_raw
    OWNER to postgres;