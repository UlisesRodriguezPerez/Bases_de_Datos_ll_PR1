-- Table: public.Categoria

-- DROP TABLE public."Categoria";

CREATE TABLE "Categoria"
(                                                                                                                       --No perminte inciar con 1
    "IdCategoria" NUMBER GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9223372036854775807) NOT NULL PRIMARY KEY,
    "Nombre" character varying(60)
)

--TABLESPACE pg_default;

--ALTER TABLE public."Categoria"
--    OWNER to postgres;