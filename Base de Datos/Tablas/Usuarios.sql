-- Table: public.Usuarios

-- DROP TABLE public."Usuarios";

CREATE TABLE public."Usuarios"
(
    "Cedula" bigint NOT NULL,
    "Nombre" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "PrimerApellido" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "SegundoApellido" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "Alias" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "Correo" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Password" character varying(15) COLLATE pg_catalog."default" NOT NULL,
    "CuantosSubastados" smallint NOT NULL,
    "CuantosComprados" smallint NOT NULL,
    "EsAdmin" boolean NOT NULL,
    "TelefonoCelular" character varying(20) COLLATE pg_catalog."default",
    "TelefonoCasa" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "TelefonoTrabajo" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Usuarios_pkey" PRIMARY KEY ("Cedula")
)

TABLESPACE pg_default;

ALTER TABLE public."Usuarios"
    OWNER to postgres;