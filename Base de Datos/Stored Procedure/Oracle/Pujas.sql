-- Table: public.Pujas

-- DROP TABLE public."Pujas";

CREATE TABLE Pujas
(
    IdPuja NUMBER GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ) NOT NULL ,
    IdSubasta NUMBER,
    IdUsuario NUMBER,
    Incremento real,
    PrecioFinal real,
    FechaSubida date,
    FueCompra boolean,
    CONSTRAINT Pujas_pkey PRIMARY KEY (IdPuja),
    CONSTRAINT Pujas_IdUsuario_fkey FOREIGN KEY (IdUsuario)
        REFERENCES Usuarios (Cedula),
    CONSTRAINT fktest FOREIGN KEY (IdSubasta)
        REFERENCES Subasta (IdSubasta)
)

--TABLESPACE pg_default;

--ALTER TABLE public."Pujas"
--    OWNER to postgres;