-- Table: public.ComentariosAVendedores

-- DROP TABLE public."ComentariosAVendedores";

CREATE TABLE public."ComentariosAVendedores"
(
    "IdSubasta" bigint,
    "Comentario" character varying(500) COLLATE pg_catalog."default",
    "Evaluacion" smallint,
    CONSTRAINT fktest FOREIGN KEY ("IdSubasta")
        REFERENCES public."Subasta" ("IdSubasta") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."ComentariosAVendedores"
    OWNER to postgres;