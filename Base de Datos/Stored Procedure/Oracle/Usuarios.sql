-- Table: public.Usuarios

-- DROP TABLE public.Usuarios;

CREATE TABLE public.Usuarios
(
    Cedula NUMBER NOT NULL,
    Nombre character varying(20),
    PrimerApellido character varying(20),
    SegundoApellido character varying(20),
    Alias character varying(20),
    Correo character varying(50),
    Password character varying(15),
    CuantosSubastados smallint NOT NULL,
    CuantosComprados smallint NOT NULL,
    EsAdmin boolean NOT NULL,
    TelefonoCelular character varying(20),
    TelefonoCasa character varying(20),
    TelefonoTrabajo character varying(20),
    CONSTRAINT Usuarios_pkey PRIMARY KEY (Cedula)
)

--TABLESPACE pg_default;

--ALTER TABLE public.Usuarios
--    OWNER to postgres;