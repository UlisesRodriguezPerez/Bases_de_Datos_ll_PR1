-- Table: public.Categoria

-- DROP TABLE public."Categoria";

CREATE TABLE public."Categoria"
(
    "IdCategoria" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "Nombre" character varying(60) COLLATE pg_catalog."default",
    CONSTRAINT "Categoria_pkey" PRIMARY KEY ("IdCategoria")
)

TABLESPACE pg_default;

ALTER TABLE public."Categoria"
    OWNER to postgres;