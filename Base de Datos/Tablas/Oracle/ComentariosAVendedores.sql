-- Table: public.ComentariosAVendedores

-- DROP TABLE public."ComentariosAVendedores";

CREATE TABLE "ComentariosAVendedores"
(
    "IdSubasta" NUMBER,
    "Comentario" character varying(500),
    "Evaluacion" smallint,
    CONSTRAINT fkSubasta FOREIGN KEY ("IdSubasta")
        REFERENCES "Subasta" ("IdSubasta")
)

--TABLESPACE pg_default;

--ALTER TABLE "ComentariosAVendedores"
--    OWNER to postgres;