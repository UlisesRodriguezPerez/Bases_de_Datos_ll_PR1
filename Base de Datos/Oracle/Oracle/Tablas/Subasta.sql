-- Table: public.Subasta

-- DROP TABLE public.Subasta;

CREATE TABLE "Subasta"
(
    "IdSubasta" NUMBER GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 2 ) PRIMARY KEY,
    "IdVendedor" NUMBER,
    "IdComprador" NUMBER,
    "IdSubCategoria" NUMBER,
    "Descripcion" character varying(50),
    "FormaEntrega" character varying(50),
    "PrecioInicial" real,
    "FechaInicio" date,
    "FechaFinal" date,
    CONSTRAINT "Subasta_IdComprador_fkey" FOREIGN KEY ("IdComprador")
        REFERENCES "Usuarios" ("Cedula"),
    CONSTRAINT "Subasta_IdSubCategoria_fkey" FOREIGN KEY ("IdSubCategoria")
        REFERENCES "SubCategoria" ("IdSubCategoria"),
    CONSTRAINT "Subasta_IdVendedor_fkey" FOREIGN KEY ("IdVendedor")
        REFERENCES "Usuarios" ("Cedula")
)

--TABLESPACE pg_default;

--ALTER TABLE public.Subasta
--    OWNER to postgres;