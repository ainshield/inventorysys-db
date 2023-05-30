-- Database: inventoryschema

-- DROP DATABASE IF EXISTS inventoryschema;

CREATE DATABASE inventoryschema
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- SCHEMA: public

-- DROP SCHEMA IF EXISTS public ;

CREATE SCHEMA IF NOT EXISTS public
    AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA public
    IS 'standard public schema';

GRANT USAGE ON SCHEMA public TO PUBLIC;

GRANT ALL ON SCHEMA public TO pg_database_owner;

-- Table: public.category

-- DROP TABLE IF EXISTS public.category;

CREATE TABLE IF NOT EXISTS public.category
(
    id integer NOT NULL DEFAULT nextval('category_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    is_void boolean,
    created_by character varying(255) COLLATE pg_catalog."default",
    modified_by character varying(255) COLLATE pg_catalog."default",
    notes text COLLATE pg_catalog."default",
    CONSTRAINT category_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.category
    OWNER to postgres;

-- Table: public.equipment

-- DROP TABLE IF EXISTS public.equipment;

CREATE TABLE IF NOT EXISTS public.equipment
(
    id integer NOT NULL DEFAULT nextval('equipment_id_seq'::regclass),
    category_id integer,
    name character varying(255) COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    brand character varying(255) COLLATE pg_catalog."default",
    unit character varying(255) COLLATE pg_catalog."default",
    date_acquired date,
    irri_tag character varying(255) COLLATE pg_catalog."default",
    serial_no character varying(255) COLLATE pg_catalog."default",
    issued_to character varying(255) COLLATE pg_catalog."default",
    accountable_to character varying(255) COLLATE pg_catalog."default",
    supplier_id integer,
    program_id integer,
    price numeric(10,2),
    status character varying(255) COLLATE pg_catalog."default",
    located_at character varying(255) COLLATE pg_catalog."default",
    other_details text COLLATE pg_catalog."default",
    is_void boolean,
    created_by character varying(255) COLLATE pg_catalog."default",
    modified_by character varying(255) COLLATE pg_catalog."default",
    notes text COLLATE pg_catalog."default",
    CONSTRAINT equipment_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.equipment
    OWNER to postgres;

-- Table: public.maintenance

-- DROP TABLE IF EXISTS public.maintenance;

CREATE TABLE IF NOT EXISTS public.maintenance
(
    id integer NOT NULL DEFAULT nextval('maintenance_id_seq'::regclass),
    equipment_id integer,
    date_maintenance date,
    description text COLLATE pg_catalog."default",
    conducted_by character varying(255) COLLATE pg_catalog."default",
    is_void boolean,
    created_by character varying(255) COLLATE pg_catalog."default",
    modified_by character varying(255) COLLATE pg_catalog."default",
    notes text COLLATE pg_catalog."default",
    CONSTRAINT maintenance_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.maintenance
    OWNER to postgres;

-- Table: public.maintenance_schedule

-- DROP TABLE IF EXISTS public.maintenance_schedule;

CREATE TABLE IF NOT EXISTS public.maintenance_schedule
(
    id integer NOT NULL DEFAULT nextval('maintenance_schedule_id_seq'::regclass),
    equipment_id integer,
    date_schedule date,
    description text COLLATE pg_catalog."default",
    user_incharge character varying(255) COLLATE pg_catalog."default",
    is_void boolean,
    created_by character varying(255) COLLATE pg_catalog."default",
    modified_by character varying(255) COLLATE pg_catalog."default",
    notes text COLLATE pg_catalog."default",
    CONSTRAINT maintenance_schedule_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.maintenance_schedule
    OWNER to postgres;

-- Table: public.permission

-- DROP TABLE IF EXISTS public.permission;

CREATE TABLE IF NOT EXISTS public.permission
(
    id integer NOT NULL DEFAULT nextval('permission_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default",
    is_void boolean,
    created_by character varying(255) COLLATE pg_catalog."default",
    modified_by character varying(255) COLLATE pg_catalog."default",
    notes text COLLATE pg_catalog."default",
    CONSTRAINT permission_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.permission
    OWNER to postgres;

-- Table: public.program

-- DROP TABLE IF EXISTS public.program;

CREATE TABLE IF NOT EXISTS public.program
(
    id integer NOT NULL DEFAULT nextval('program_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default",
    is_void boolean,
    created_by character varying(255) COLLATE pg_catalog."default",
    modified_by character varying(255) COLLATE pg_catalog."default",
    notes text COLLATE pg_catalog."default",
    CONSTRAINT program_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.program
    OWNER to postgres;

-- Table: public.role

-- DROP TABLE IF EXISTS public.role;

CREATE TABLE IF NOT EXISTS public.role
(
    id integer NOT NULL DEFAULT nextval('role_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default",
    is_void boolean,
    created_by character varying(255) COLLATE pg_catalog."default",
    modified_by character varying(255) COLLATE pg_catalog."default",
    notes text COLLATE pg_catalog."default",
    CONSTRAINT role_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.role
    OWNER to postgres;

-- Table: public.supplier

-- DROP TABLE IF EXISTS public.supplier;

CREATE TABLE IF NOT EXISTS public.supplier
(
    id integer NOT NULL DEFAULT nextval('supplier_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default",
    address text COLLATE pg_catalog."default",
    contact_no character varying(255) COLLATE pg_catalog."default",
    mobile_no character varying(255) COLLATE pg_catalog."default",
    is_void boolean,
    created_by character varying(255) COLLATE pg_catalog."default",
    modified_by character varying(255) COLLATE pg_catalog."default",
    notes text COLLATE pg_catalog."default",
    CONSTRAINT supplier_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.supplier
    OWNER to postgres;

-- Table: public.user

-- DROP TABLE IF EXISTS public."user";

CREATE TABLE IF NOT EXISTS public."user"
(
    id integer NOT NULL DEFAULT nextval('user_id_seq'::regclass),
    firstname character varying(255) COLLATE pg_catalog."default",
    lastname character varying(255) COLLATE pg_catalog."default",
    middlename character varying(255) COLLATE pg_catalog."default",
    program_id integer,
    role_id integer,
    permission_id integer,
    contact_no character varying(255) COLLATE pg_catalog."default",
    mobile_no character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    "position" character varying(255) COLLATE pg_catalog."default",
    username character varying(255) COLLATE pg_catalog."default",
    password character varying(255) COLLATE pg_catalog."default",
    is_void boolean,
    created_by character varying(255) COLLATE pg_catalog."default",
    modified_by character varying(255) COLLATE pg_catalog."default",
    notes text COLLATE pg_catalog."default",
    CONSTRAINT user_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."user"
    OWNER to postgres;
