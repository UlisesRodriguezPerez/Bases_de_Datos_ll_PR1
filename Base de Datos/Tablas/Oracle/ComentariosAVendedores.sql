-- Table: public.ComentariosAVendedores

-- DROP TABLE public."ComentariosAVendedores";

CREATE TABLE ComentariosAVendedores
(
    IdSubasta LONGINTEGER,
    Comentario character varying(500),
    Evaluacion smallint,
    CONSTRAINT fktest FOREIGN KEY (IdSubasta)
        REFERENCES Subasta (IdSubasta)
)

--TABLESPACE pg_default;

--ALTER TABLE "ComentariosAVendedores"
--    OWNER to postgres;