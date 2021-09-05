BEGIN;
CREATE TABLE public.sales (
    id           SERIAL PRIMARY KEY
    units        BIGINT
    dollars      NUMERIC(39,2)
    date_of_sale TIMESTAMP
    state_sold   CHAR(2)
    product_id   BIGINT FOREIGN KEY REFERENCES (products.id)
    customer_id  BIGINT FOREIGN KEY REFERENCES (customers.id)
)
;
CREATE TABLE public.products (
    id                SERIAL PRIMARY KEY
    vendor_id         BIGINT FOREIGN KEY REFERENCES (vendors.id)
    category_id       BIGINT
    cost              NUMERIC(39,2)
    minimum_order_qty BIGINT
    description       TEXT
    last_modified_at  TIMESTAMP
    created_at        TIMESTAMP
)
;

CREATE TABLE public.customers (
    id                SERIAL PRIMARY KEY
    created_at        TIMESTAMP
    last_modified_at  TIMESTAMP
)
;

CREATE TABLE public.categories (
    id                SERIAL PRIMARY KEY
    category_mgr_id   BIGINT FORIEGN KEY REFERENCES (public.employees)
    description       TEXT
    created_at        TIMESTAMP
    last_modified_at  TIMESTAMP
)
;

CREATE TABLE public.vendors (
    id                SERIAL PRIMARY KEY
    created_at        TIMESTAMP
    last_modified_at  TIMESTAMP
)
;

CREATE TABLE public.vendors (
    id                SERIAL PRIMARY KEY
    created_at        TIMESTAMP
    last_modified_at  TIMESTAMP
)
;


COMMIT;
