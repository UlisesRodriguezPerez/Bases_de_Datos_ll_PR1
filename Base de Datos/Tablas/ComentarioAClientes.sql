-- Table: public.ComentariosAClientes

-- DROP TABLE public."ComentariosAClientes";

CREATE TABLE public."ComentariosAClientes"
(
    "idSubasta" bigint,
    "Comentario" character varying(500) COLLATE pg_catalog."default",
    "Evaluacion" smallint,
    CONSTRAINT fktest FOREIGN KEY ("idSubasta")
        REFERENCES public."Subasta" ("IdSubasta") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."ComentariosAClientes"
    OWNER to postgres;