CREATE TABLE "Categoria"
(                                                                                                                       --No perminte inciar con 1
    "IdCategoria" NUMBER GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9223372036854775807) NOT NULL PRIMARY KEY,
    "Nombre" character varying(60)
)

CREATE TABLE "Usuarios"
(
    "Cedula" NUMBER PRIMARY KEY,
    "Nombre" character varying(20),
    "PrimerApellido" character varying(20),
    "SegundoApellido" character varying(20),
    "Alias" character varying(20),
    "Correo" character varying(50),
    "Password" character varying(15),
    "CuantosSubastados" smallint NOT NULL,
    "CuantosComprados" smallint NOT NULL,
    "EsAdmin" CHAR(1 BYTE),
    "TelefonoCelular" character varying(20),
    "TelefonoCasa" character varying(20),
    "TelefonoTrabajo" character varying(20)
)

CREATE TABLE VariablesSistema
(
    "porcentajeMejora" smallint,
    "incrementoMinimo" real
)

CREATE TABLE "SubCategoria"
(
    "IdSubCategoria" NUMBER GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9223372036854775807 ) PRIMARY KEY,
    "IdCategoria" NUMBER,
    "Nombre" character varying(60),
    CONSTRAINT "SubCategoria_IdCategoria_fkey" FOREIGN KEY ("IdCategoria")
        REFERENCES "Categoria" ("IdCategoria")
)


CREATE TABLE "Subasta"
(
    "IdSubasta" NUMBER GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 2 ) PRIMARY KEY,
    "IdVendedor" NUMBER,
    "IdComprador" NUMBER,
    "IdSubCategoria" NUMBER,
    "Descripcion" character varying(50),
    "FormaEntrega" character varying(50),
    "PrecioInicial" real,
    "FechaInicio" date,
    "FechaFinal" date,
    CONSTRAINT "Subasta_IdComprador_fkey" FOREIGN KEY ("IdComprador")
        REFERENCES "Usuarios" ("Cedula"),
    CONSTRAINT "Subasta_IdSubCategoria_fkey" FOREIGN KEY ("IdSubCategoria")
        REFERENCES "SubCategoria" ("IdSubCategoria"),
    CONSTRAINT "Subasta_IdVendedor_fkey" FOREIGN KEY ("IdVendedor")
        REFERENCES "Usuarios" ("Cedula")
)


CREATE TABLE "ComentariosAClientes"
(
    "idSubasta" NUMBER,
    "Comentario" character varying(500),
    "Evaluacion" smallint,
    CONSTRAINT fkCAC_Subasta FOREIGN KEY ("idSubasta")
        REFERENCES "Subasta" ("IdSubasta")
)


CREATE TABLE "ComentariosAVendedores"
(
    "IdSubasta" NUMBER,
    "Comentario" character varying(500),
    "Evaluacion" smallint,
    CONSTRAINT fkSubasta FOREIGN KEY ("IdSubasta")
        REFERENCES "Subasta" ("IdSubasta")
)


CREATE TABLE "Pujas"
(
    "IdPuja" NUMBER GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 2 ) PRIMARY KEY ,
    "IdSubasta" NUMBER,
    "IdUsuario" NUMBER,
    "Incremento" real,
    "PrecioFinal" real,
    "FechaSubida" date,
    "FueCompra" char(1 BYTE),
    CONSTRAINT "Pujas_IdUsuario_fkey" FOREIGN KEY ("IdUsuario")
        REFERENCES "Usuarios" ("Cedula"),
    CONSTRAINT fktest FOREIGN KEY ("IdSubasta")
        REFERENCES "Subasta" ("IdSubasta")
)


