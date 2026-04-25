-- Table: public.stores

-- DROP TABLE IF EXISTS public.stores;

CREATE TABLE IF NOT EXISTS public.stores
(
    store_id integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.stores
    OWNER to postgres;