-- Table: public.SubCategoria

-- DROP TABLE public.SubCategoria;

CREATE TABLE "SubCategoria"
(
    "IdSubCategoria" NUMBER GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9223372036854775807 ) PRIMARY KEY,
    "IdCategoria" NUMBER,
    "Nombre" character varying(60),
    CONSTRAINT "SubCategoria_IdCategoria_fkey" FOREIGN KEY ("IdCategoria")
        REFERENCES "Categoria" ("IdCategoria")
)

--TABLESPACE pg_default;

--ALTER TABLE public.SubCategoria
--    OWNER to postgres;