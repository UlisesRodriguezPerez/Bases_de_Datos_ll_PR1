-- Table: public.ComentariosAClientes

-- DROP TABLE public."ComentariosAClientes";

CREATE TABLE "ComentariosAClientes"
(
    "idSubasta" NUMBER,
    "Comentario" character varying(500),
    "Evaluacion" smallint,
    CONSTRAINT fkCAC_Subasta FOREIGN KEY ("idSubasta")
        REFERENCES "Subasta" ("IdSubasta")
)

--TABLESPACE pg_default;

--ALTER TABLE public."ComentariosAClientes"
--    OWNER to postgres;