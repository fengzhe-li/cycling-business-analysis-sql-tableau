-- Table: public.store_lookup

-- DROP TABLE IF EXISTS public.store_lookup;

CREATE TABLE IF NOT EXISTS public.store_lookup
(
    store_id integer,
    store_name text COLLATE pg_catalog."default",
    region text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.store_lookup
    OWNER to postgres;