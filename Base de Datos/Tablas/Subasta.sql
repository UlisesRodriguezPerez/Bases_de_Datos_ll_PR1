-- Table: public.Subasta

-- DROP TABLE public."Subasta";

CREATE TABLE public."Subasta"
(
    "IdSubasta" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "IdVendedor" bigint,
    "IdComprador" bigint,
    "IdSubCategoria" bigint,
    "Descripcion" character varying(50) COLLATE pg_catalog."default",
    "FormaEntrega" character varying(50) COLLATE pg_catalog."default",
    "PrecioInicial" real,
    "FechaInicio" date,
    "FechaFinal" date,
    CONSTRAINT "Subasta_pkey" PRIMARY KEY ("IdSubasta"),
    CONSTRAINT "Subasta_IdComprador_fkey" FOREIGN KEY ("IdComprador")
        REFERENCES public."Usuarios" ("Cedula") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Subasta_IdSubCategoria_fkey" FOREIGN KEY ("IdSubCategoria")
        REFERENCES public."SubCategoria" ("IdSubCategoria") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Subasta_IdVendedor_fkey" FOREIGN KEY ("IdVendedor")
        REFERENCES public."Usuarios" ("Cedula") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Subasta"
    OWNER to postgres;