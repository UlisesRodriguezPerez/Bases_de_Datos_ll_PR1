-- Table: public.SubCategoria

-- DROP TABLE public."SubCategoria";

CREATE TABLE public."SubCategoria"
(
    "IdSubCategoria" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "IdCategoria" bigint,
    "Nombre" character varying(60) COLLATE pg_catalog."default",
    CONSTRAINT "SubCategoria_pkey" PRIMARY KEY ("IdSubCategoria"),
    CONSTRAINT "SubCategoria_IdCategoria_fkey" FOREIGN KEY ("IdCategoria")
        REFERENCES public."Categoria" ("IdCategoria") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."SubCategoria"
    OWNER to postgres;