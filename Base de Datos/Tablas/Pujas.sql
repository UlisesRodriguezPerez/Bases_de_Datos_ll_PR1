-- Table: public.Pujas

-- DROP TABLE public."Pujas";

CREATE TABLE public."Pujas"
(
    "IdPuja" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    "IdSubasta" bigint,
    "IdUsuario" bigint,
    "Incremento" real,
    "PrecioFinal" real,
    "FechaSubida" date,
    "FueCompra" boolean,
    CONSTRAINT "Pujas_pkey" PRIMARY KEY ("IdPuja"),
    CONSTRAINT "Pujas_IdUsuario_fkey" FOREIGN KEY ("IdUsuario")
        REFERENCES public."Usuarios" ("Cedula") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fktest FOREIGN KEY ("IdSubasta")
        REFERENCES public."Subasta" ("IdSubasta") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Pujas"
    OWNER to postgres;