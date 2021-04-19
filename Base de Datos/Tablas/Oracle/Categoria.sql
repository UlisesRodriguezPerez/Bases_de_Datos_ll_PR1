-- Table: public.Categoria

-- DROP TABLE public."Categoria";

CREATE TABLE Categoria
(                                                                                                                       --No perminte inciar con 1
    IdCategoria NUMBER GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 2 ) NOT NULL,
    Nombre character varying(60),
    CONSTRAINT Categoria_pkey PRIMARY KEY (IdCategoria)
)

--TABLESPACE pg_default;

--ALTER TABLE public."Categoria"
--    OWNER to postgres;