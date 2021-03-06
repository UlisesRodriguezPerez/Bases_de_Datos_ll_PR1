PGDMP     %                    y            Bases2_Prueba    13.2    13.2 >    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    16411    Bases2_Prueba    DATABASE     p   CREATE DATABASE "Bases2_Prueba" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Costa Rica.1252';
    DROP DATABASE "Bases2_Prueba";
                postgres    false            ?            1255    24759    buscarsubasta(integer)    FUNCTION     ?   CREATE FUNCTION public.buscarsubasta(pidsubasta integer) RETURNS integer
    LANGUAGE sql
    AS $$
SELECT 
		"IdSubasta"
		
FROM 
	"Subasta"
WHERE
	pidsubasta = "IdSubasta"
$$;
 8   DROP FUNCTION public.buscarsubasta(pidsubasta integer);
       public          postgres    false            ?            1259    16412    Usuarios    TABLE     l  CREATE TABLE public."Usuarios" (
    "Cedula" bigint NOT NULL,
    "Nombre" character varying(20) NOT NULL,
    "PrimerApellido" character varying(20) NOT NULL,
    "SegundoApellido" character varying(20) NOT NULL,
    "Alias" character varying(20) NOT NULL,
    "Correo" character varying(50) NOT NULL,
    "Password" character varying(15) NOT NULL,
    "CuantosSubastados" smallint NOT NULL,
    "CuantosComprados" smallint NOT NULL,
    "EsAdmin" boolean NOT NULL,
    "TelefonoCelular" character varying(20),
    "TelefonoCasa" character varying(20) NOT NULL,
    "TelefonoTrabajo" character varying(20) NOT NULL
);
    DROP TABLE public."Usuarios";
       public         heap    postgres    false            ?            1255    24638    buscarusuario(integer)    FUNCTION     y  CREATE FUNCTION public.buscarusuario(pid integer) RETURNS public."Usuarios"
    LANGUAGE sql
    AS $$
SELECT 
		"Cedula",
		"Nombre",
		"PrimerApellido",
		"SegundoApellido",
		"Alias",
		"Correo",
		"Password",
		"CuantosSubastados",
		"CuantosComprados",
		"EsAdmin",
		"TelefonoCelular",
		"TelefonoCasa",
		"TelefonoTrabajo"
		
FROM 
	"Usuarios"
WHERE
	pId = "Cedula"
$$;
 1   DROP FUNCTION public.buscarusuario(pid integer);
       public          postgres    false    200            ?            1255    24642 ?   editarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, boolean)    FUNCTION     ?  CREATE FUNCTION public.editarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, pcuantossubastados integer, pcuantoscomprados integer, ptipousuario boolean) RETURNS void
    LANGUAGE sql
    AS $$
UPDATE 
	"Usuarios"
SET
		"Cedula" = pCedula,
		"Nombre" = pNombre,
		"PrimerApellido" = pPrimerApellido,
		"SegundoApellido" = pSegundoApellido,
		"Alias" = pAlias,
		"Correo" = pCorreo,
		"Password" = pPassword,
		"CuantosSubastados" = pCuantosSubastados,
		"CuantosComprados" = pCuantosComprados,
		"EsAdmin" = pTipoUsuario
WHERE
	pCedula = "Cedula";
$$;
 6  DROP FUNCTION public.editarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, pcuantossubastados integer, pcuantoscomprados integer, ptipousuario boolean);
       public          postgres    false            ?            1255    24728 ?   editarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, boolean, character varying, character varying, character varying)    FUNCTION     ?  CREATE FUNCTION public.editarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, pcuantossubastados integer, pcuantoscomprados integer, ptipousuario boolean, ptelefonocelular character varying, ptelefonocasa character varying, ptelefonotrabajo character varying) RETURNS void
    LANGUAGE sql
    AS $$
UPDATE 
	"Usuarios"
SET
		"Cedula" = pCedula,
		"Nombre" = pNombre,
		"PrimerApellido" = pPrimerApellido,
		"SegundoApellido" = pSegundoApellido,
		"Alias" = pAlias,
		"Correo" = pCorreo,
		"Password" = pPassword,
		"CuantosSubastados" = pCuantosSubastados,
		"CuantosComprados" = pCuantosComprados,
		"EsAdmin" = pTipoUsuario,
		"TelefonoCelular" = pTelefonoCelular,
		"TelefonoCasa" = pTelefonoCasa,
		"TelefonoTrabajo" = pTelefonoTrabajo
WHERE
	pCedula = "Cedula";
$$;
 ?  DROP FUNCTION public.editarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, pcuantossubastados integer, pcuantoscomprados integer, ptipousuario boolean, ptelefonocelular character varying, ptelefonocasa character varying, ptelefonotrabajo character varying);
       public          postgres    false            ?            1255    24755    eliminarusuario(integer)    FUNCTION     ?   CREATE FUNCTION public.eliminarusuario(pid integer) RETURNS void
    LANGUAGE sql
    AS $$
DELETE FROM "Usuarios"
WHERE
	pId = "Cedula"
$$;
 3   DROP FUNCTION public.eliminarusuario(pid integer);
       public          postgres    false            ?            1255    24760 A   insertarcomentarioacomprador(integer, character varying, integer)    FUNCTION        CREATE FUNCTION public.insertarcomentarioacomprador(idsubasta integer, comentario character varying, evaluacion integer) RETURNS void
    LANGUAGE sql
    AS $$

INSERT INTO 
	"ComentariosAClientes"
VALUES
	(
		idsubasta,
		comentario,
		evaluacion
	)
$$;
 x   DROP FUNCTION public.insertarcomentarioacomprador(idsubasta integer, comentario character varying, evaluacion integer);
       public          postgres    false            ?            1255    24758 @   insertarcomentarioavendedor(integer, character varying, integer)    FUNCTION     B  CREATE FUNCTION public.insertarcomentarioavendedor(idsubasta integer, comentario character varying, evaluacion integer) RETURNS void
    LANGUAGE sql
    AS $$
--DECLARE fechaActual date;

--SET "fechaActual" = current_time;
INSERT INTO 
	"ComentariosAVendedores"
VALUES
	(
		idsubasta,
		comentario,
		evaluacion
	)

$$;
 w   DROP FUNCTION public.insertarcomentarioavendedor(idsubasta integer, comentario character varying, evaluacion integer);
       public          postgres    false            ?            1255    24644 ?   insertarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, boolean)    FUNCTION     n  CREATE FUNCTION public.insertarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, ptipousuario boolean) RETURNS void
    LANGUAGE sql
    AS $$

INSERT INTO "Usuarios"(
		"Cedula",
		"Nombre",
		"PrimerApellido",
		"SegundoApellido",
		"Alias",
		"Correo",
		"Password",
		"CuantosSubastados",
		"CuantosComprados",
		"EsAdmin"
	)
	VALUES(
		pCedula,
		pNombre,
		pPrimerApellido,
		pSegundoApellido,
		pAlias,
		pCorreo,
		pPassword,
		0,
		0,
		pTipoUsuario
	);
$$;
   DROP FUNCTION public.insertarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, ptipousuario boolean);
       public          postgres    false            ?            1255    24729 ?   insertarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, boolean, character varying, character varying, character varying)    FUNCTION     M  CREATE FUNCTION public.insertarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, ptipousuario boolean, ptelefonocelular character varying, ptelefonocasa character varying, ptelefonotrabajo character varying) RETURNS void
    LANGUAGE sql
    AS $$
INSERT INTO "Usuarios"(
		"Cedula",
		"Nombre",
		"PrimerApellido",
		"SegundoApellido",
		"Alias",
		"Correo",
		"Password",
		"CuantosSubastados",
		"CuantosComprados",
		"EsAdmin",
		"TelefonoCelular",
		"TelefonoCasa",
		"TelefonoTrabajo"
	
	)
	VALUES(
		pCedula,
		pNombre,
		pPrimerApellido,
		pSegundoApellido,
		pAlias,
		pCorreo,
		pPassword,
		0,
		0,
		pTipoUsuario,
		pTelefonoCelular,
		pTelefonoCasa,
		pTelefonoTrabajo
	);
$$;
 j  DROP FUNCTION public.insertarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, ptipousuario boolean, ptelefonocelular character varying, ptelefonocasa character varying, ptelefonotrabajo character varying);
       public          postgres    false            ?            1255    24757    mostrarcompradas(integer)    FUNCTION     ?  CREATE FUNCTION public.mostrarcompradas(pcedula integer) RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial real, fechainicio date, fechafinal date)
    LANGUAGE sql
    AS $$
--DECLARE fechaActual date;

--SET "fechaActual" = current_time;
SELECT 
		S."IdSubasta", 
		UV."Cedula", 
		UC."Cedula", 
		Sca."IdSubCategoria", 
		Ca."IdCategoria", 
		UC."Nombre", --Comprador
		UV."Nombre" ,--vendedor
		Ca."Nombre" ,--categoria
		Sca."Nombre", --SubCategoria
		S."Descripcion",
		S."FormaEntrega",
		S."PrecioInicial",
		S."FechaInicio",
		S."FechaFinal"
		
FROM 
	"Subasta"  S
INNER JOIN "Usuarios" UV ON UV."Cedula" = S."IdVendedor"
INNER JOIN "SubCategoria"  Sca ON Sca."IdSubCategoria" = S."IdSubCategoria"
INNER JOIN "Categoria"  Ca ON Ca."IdCategoria" = Sca."IdCategoria"
INNER JOIN "Usuarios"  UC ON UC."Cedula" = S."IdComprador"

WHERE
	UC."Cedula" = pcedula
	
$$;
 8   DROP FUNCTION public.mostrarcompradas(pcedula integer);
       public          postgres    false            ?            1255    24794    mostrarinfovendedor(integer)    FUNCTION     6  CREATE FUNCTION public.mostrarinfovendedor(pcedula integer) RETURNS TABLE(nombrecomprador character varying, nombrevendedor character varying, comentario character varying, puntaje integer)
    LANGUAGE sql
    AS $$
SELECT 
		UC."Nombre", --Comprador
		UV."Nombre" ,--vendedor
		cmtV."Comentario",
		cmtV."Evaluacion"
FROM 
	"Subasta"  S
INNER JOIN "Usuarios" UV ON UV."Cedula" = S."IdVendedor"
INNER JOIN "Usuarios"  UC ON UC."Cedula" = S."IdComprador"
INNER JOIN "ComentariosAVendedores" cmtV ON cmtv."IdSubasta" = S."IdSubasta"

WHERE
	UV."Cedula" = pcedula
$$;
 ;   DROP FUNCTION public.mostrarinfovendedor(pcedula integer);
       public          postgres    false            ?            1255    24756    mostrarsubastadas(integer)    FUNCTION     ?  CREATE FUNCTION public.mostrarsubastadas(pcedula integer) RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial real, fechainicio date, fechafinal date)
    LANGUAGE sql
    AS $$
--DECLARE fechaActual date;

--SET "fechaActual" = current_time;
SELECT 
		S."IdSubasta", 
		UV."Cedula", 
		UC."Cedula", 
		Sca."IdSubCategoria", 
		Ca."IdCategoria", 
		UC."Nombre", --Comprador
		UV."Nombre" ,--vendedor
		Ca."Nombre" ,--categoria
		Sca."Nombre", --SubCategoria
		S."Descripcion",
		S."FormaEntrega",
		S."PrecioInicial",
		S."FechaInicio",
		S."FechaFinal"
		
FROM 
	"Subasta"  S
INNER JOIN "Usuarios" UV ON UV."Cedula" = S."IdVendedor"
INNER JOIN "SubCategoria"  Sca ON Sca."IdSubCategoria" = S."IdSubCategoria"
INNER JOIN "Categoria"  Ca ON Ca."IdCategoria" = Sca."IdCategoria"
INNER JOIN "Usuarios"  UC ON UC."Cedula" = S."IdComprador"

WHERE
	UV."Cedula" = pcedula
	
$$;
 9   DROP FUNCTION public.mostrarsubastadas(pcedula integer);
       public          postgres    false            ?            1255    24753    mostrarsubastasactivas()    FUNCTION     ?  CREATE FUNCTION public.mostrarsubastasactivas() RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial real, fechainicio date, fechafinal date)
    LANGUAGE sql
    AS $$
--DECLARE fechaActual date;

--SET "fechaActual" = current_time;
SELECT 
		S."IdSubasta", 
		UV."Cedula", 
		UC."Cedula", 
		Sca."IdSubCategoria", 
		Ca."IdCategoria", 
		UC."Alias", --Comprador
		UV."Alias" ,--vendedor
		Ca."Nombre" ,--categoria
		Sca."Nombre", --SubCategoria
		S."Descripcion",
		S."FormaEntrega",
		S."PrecioInicial",
		S."FechaInicio",
		S."FechaFinal"
FROM 
	"Subasta"  S
INNER JOIN "Usuarios" UV ON UV."Cedula" = S."IdVendedor"
INNER JOIN "SubCategoria"  Sca ON Sca."IdSubCategoria" = S."IdSubCategoria"
INNER JOIN "Categoria"  Ca ON Ca."IdCategoria" = Sca."IdCategoria"
INNER JOIN "Usuarios"  UC ON UC."Cedula" = S."IdComprador"

WHERE
	current_date >= S."FechaInicio" AND current_date <= S."FechaFinal";
$$;
 /   DROP FUNCTION public.mostrarsubastasactivas();
       public          postgres    false            ?            1255    24754    mostrartodassubastas()    FUNCTION     X  CREATE FUNCTION public.mostrartodassubastas() RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial real, fechainicio date, fechafinal date)
    LANGUAGE sql
    AS $$
--DECLARE fechaActual date;

--SET "fechaActual" = current_time;
SELECT 
		S."IdSubasta", 
		UV."Cedula", 
		UC."Cedula", 
		Sca."IdSubCategoria", 
		Ca."IdCategoria", 
		UC."Nombre", --Comprador
		UV."Nombre" ,--vendedor
		Ca."Nombre" ,--categoria
		Sca."Nombre", --SubCategoria
		S."Descripcion",
		S."FormaEntrega",
		S."PrecioInicial",
		S."FechaInicio",
		S."FechaFinal"
		
FROM 
	"Subasta"  S
INNER JOIN "Usuarios" UV ON UV."Cedula" = S."IdVendedor"
INNER JOIN "SubCategoria"  Sca ON Sca."IdSubCategoria" = S."IdSubCategoria"
INNER JOIN "Categoria"  Ca ON Ca."IdCategoria" = Sca."IdCategoria"
INNER JOIN "Usuarios"  UC ON UC."Cedula" = S."IdComprador"

	
$$;
 -   DROP FUNCTION public.mostrartodassubastas();
       public          postgres    false            ?            1255    24730    mostrarusuarios()    FUNCTION     ?  CREATE FUNCTION public.mostrarusuarios() RETURNS TABLE(cedula bigint, nombre character varying, primerapellido character varying, segundoapellido character varying, aliass character varying, correo character varying, password character varying, cuantossubastados integer, cuantoscomprados integer, esadmin boolean, telefonocelular character varying, telefonocasa character varying, telefonotrabajo character varying)
    LANGUAGE sql
    AS $$
SELECT 
		"Cedula",
		"Nombre",
		"PrimerApellido",
		"SegundoApellido",
		"Alias",
		"Correo",
		"Password",
		"CuantosSubastados",
		"CuantosComprados",
		"EsAdmin",
		"TelefonoCelular",
		"TelefonoCasa",
		"TelefonoTrabajo"
	FROM "Usuarios"
$$;
 (   DROP FUNCTION public.mostrarusuarios();
       public          postgres    false            ?            1255    24612    mostrarusuarios(bigint) 	   PROCEDURE     ?   CREATE PROCEDURE public.mostrarusuarios(INOUT pcedula bigint)
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN

SELECT ("Cedula") FROM  public."Usuarios";

END;
$$;
 =   DROP PROCEDURE public.mostrarusuarios(INOUT pcedula bigint);
       public          postgres    false            ?            1255    24611 -   mostrarusuarios(bigint, character, character) 	   PROCEDURE     ?   CREATE PROCEDURE public.mostrarusuarios(INOUT pcedula bigint, INOUT pnombre character, INOUT pprimerapellido character)
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN

pCedula := Usuario.Cedula FROM  public."Usuarios";

END;
$$;
 w   DROP PROCEDURE public.mostrarusuarios(INOUT pcedula bigint, INOUT pnombre character, INOUT pprimerapellido character);
       public          postgres    false            ?            1255    24769 `   subastaritem(integer, character varying, character varying, character varying, real, date, date)    FUNCTION     ?  CREATE FUNCTION public.subastaritem(idusuario integer, subcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial real, fechainicio date, fechafinal date) RETURNS void
    LANGUAGE sql
    AS $$
INSERT INTO "Subasta"(
		"IdVendedor",
		"IdComprador",
		"IdSubCategoria",
		"Descripcion",
		"FormaEntrega",
		"PrecioInicial",
		"FechaInicio",
		"FechaFinal"
	)
	VALUES(
		idusuario,
		0,
		(SELECT Sca."IdSubCategoria" FROM "SubCategoria" Sca WHERE Sca."Nombre" = subcategoria),
		descripcion,
		formaentrega,
		precioinicial,
		fechainicio,
		fechafinal
	)
	--INNER JOIN "SubCategoria" Sca ON Sca."Nombre" = subcategoria;
$$;
 ?   DROP FUNCTION public.subastaritem(idusuario integer, subcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial real, fechainicio date, fechafinal date);
       public          postgres    false            ?            1255    24777 ?   subastaritem(integer, character varying, character varying, character varying, real, timestamp without time zone, timestamp without time zone)    FUNCTION     ?  CREATE FUNCTION public.subastaritem(idusuario integer, subcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial real, fechainicio timestamp without time zone, fechafinal timestamp without time zone) RETURNS void
    LANGUAGE sql
    AS $$
INSERT INTO "Subasta"(
		
		"IdVendedor",
		"IdComprador",
		"IdSubCategoria",
		"Descripcion",
		"FormaEntrega",
		"PrecioInicial",
		"FechaInicio",
		"FechaFinal"
	)
	VALUES(
		idusuario,
		0,
		(SELECT Sca."IdSubCategoria" FROM "SubCategoria" Sca WHERE Sca."Nombre" = subcategoria),
		descripcion,
		formaentrega,
		precioinicial,
		fechainicio,
		fechafinal
	)
	--INNER JOIN "SubCategoria" Sca ON Sca."Nombre" = subcategoria;
$$;
 ?   DROP FUNCTION public.subastaritem(idusuario integer, subcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial real, fechainicio timestamp without time zone, fechafinal timestamp without time zone);
       public          postgres    false            ?            1255    24775 z   subastaritem(integer, character varying, character varying, character varying, real, character varying, character varying)    FUNCTION     ?  CREATE FUNCTION public.subastaritem(idusuario integer, subcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial real, fechainicio character varying, fechafinal character varying) RETURNS void
    LANGUAGE sql
    AS $$
INSERT INTO "Subasta"(
		"IdVendedor",
		"IdComprador",
		"IdSubCategoria",
		"Descripcion",
		"FormaEntrega",
		"PrecioInicial",
		"FechaInicio",
		"FechaFinal"
	)
	VALUES(
		idusuario,
		0,
		(SELECT Sca."IdSubCategoria" FROM "SubCategoria" Sca WHERE Sca."Nombre" = subcategoria),
		descripcion,
		formaentrega,
		precioinicial,
		(SELECT TO_DATE(fechainicio,'YYYYMMDD')),
		(SELECT TO_DATE(fechafinal,'YYYYMMDD'))
	)
	--INNER JOIN "SubCategoria" Sca ON Sca."Nombre" = subcategoria;
$$;
 ?   DROP FUNCTION public.subastaritem(idusuario integer, subcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial real, fechainicio character varying, fechafinal character varying);
       public          postgres    false            ?            1255    24643 *   validarusuario(integer, character varying)    FUNCTION     ?  CREATE FUNCTION public.validarusuario(pcedula integer, ppassword character varying) RETURNS public."Usuarios"
    LANGUAGE sql
    AS $$
SELECT 
		"Cedula",
		"Nombre",
		"PrimerApellido",
		"SegundoApellido",
		"Alias",
		"Correo",
		"Password",
		"CuantosSubastados",
		"CuantosComprados",
		"EsAdmin",
		"TelefonoCelular",
		"TelefonoCasa",
		"TelefonoTrabajo"
FROM 
	"Usuarios"
WHERE
	pcedula = "Cedula" AND ppassword = "Password"
$$;
 S   DROP FUNCTION public.validarusuario(pcedula integer, ppassword character varying);
       public          postgres    false    200            ?            1259    24670 	   Categoria    TABLE     k   CREATE TABLE public."Categoria" (
    "IdCategoria" bigint NOT NULL,
    "Nombre" character varying(60)
);
    DROP TABLE public."Categoria";
       public         heap    postgres    false            ?            1259    24680    Categoria_IdCategoria_seq    SEQUENCE     ?   ALTER TABLE public."Categoria" ALTER COLUMN "IdCategoria" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Categoria_IdCategoria_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    206            ?            1259    24648    ComentariosAClientes    TABLE     ?   CREATE TABLE public."ComentariosAClientes" (
    "idSubasta" bigint,
    "Comentario" character varying(500),
    "Evaluacion" smallint
);
 *   DROP TABLE public."ComentariosAClientes";
       public         heap    postgres    false            ?            1259    24654    ComentariosAVendedores    TABLE     ?   CREATE TABLE public."ComentariosAVendedores" (
    "IdSubasta" bigint,
    "Comentario" character varying(500),
    "Evaluacion" smallint
);
 ,   DROP TABLE public."ComentariosAVendedores";
       public         heap    postgres    false            ?            1259    24665    Pujas    TABLE     ?   CREATE TABLE public."Pujas" (
    "IdPuja" bigint NOT NULL,
    "IdSubasta" bigint,
    "IdUsuario" bigint,
    "Incremento" real,
    "PrecioFinal" real,
    "FechaSubida" date,
    "FueCompra" boolean
);
    DROP TABLE public."Pujas";
       public         heap    postgres    false            ?            1259    24682    Pujas_IdPuja_seq    SEQUENCE     ?   ALTER TABLE public."Pujas" ALTER COLUMN "IdPuja" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Pujas_IdPuja_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    205            ?            1259    24675    SubCategoria    TABLE     ?   CREATE TABLE public."SubCategoria" (
    "IdSubCategoria" bigint NOT NULL,
    "IdCategoria" bigint,
    "Nombre" character varying(60)
);
 "   DROP TABLE public."SubCategoria";
       public         heap    postgres    false            ?            1259    24684    SubCategoria_IdSubCategoria_seq    SEQUENCE     ?   ALTER TABLE public."SubCategoria" ALTER COLUMN "IdSubCategoria" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."SubCategoria_IdSubCategoria_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    207            ?            1259    24660    Subasta    TABLE     /  CREATE TABLE public."Subasta" (
    "IdSubasta" bigint NOT NULL,
    "IdVendedor" bigint,
    "IdComprador" bigint,
    "IdSubCategoria" bigint,
    "Descripcion" character varying(50),
    "FormaEntrega" character varying(50),
    "PrecioInicial" real,
    "FechaInicio" date,
    "FechaFinal" date
);
    DROP TABLE public."Subasta";
       public         heap    postgres    false            ?            1259    24686    Subasta_IdSubasta_seq    SEQUENCE     ?   ALTER TABLE public."Subasta" ALTER COLUMN "IdSubasta" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Subasta_IdSubasta_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    204            ?            1259    24645    VariablesSistema    TABLE     i   CREATE TABLE public."VariablesSistema" (
    "porcentajeMejora" smallint,
    "incrementoMinimo" real
);
 &   DROP TABLE public."VariablesSistema";
       public         heap    postgres    false            ?          0    24670 	   Categoria 
   TABLE DATA           >   COPY public."Categoria" ("IdCategoria", "Nombre") FROM stdin;
    public          postgres    false    206   ݃       ?          0    24648    ComentariosAClientes 
   TABLE DATA           Y   COPY public."ComentariosAClientes" ("idSubasta", "Comentario", "Evaluacion") FROM stdin;
    public          postgres    false    202   ?       ?          0    24654    ComentariosAVendedores 
   TABLE DATA           [   COPY public."ComentariosAVendedores" ("IdSubasta", "Comentario", "Evaluacion") FROM stdin;
    public          postgres    false    203   ,?       ?          0    24665    Pujas 
   TABLE DATA           ~   COPY public."Pujas" ("IdPuja", "IdSubasta", "IdUsuario", "Incremento", "PrecioFinal", "FechaSubida", "FueCompra") FROM stdin;
    public          postgres    false    205   n?       ?          0    24675    SubCategoria 
   TABLE DATA           S   COPY public."SubCategoria" ("IdSubCategoria", "IdCategoria", "Nombre") FROM stdin;
    public          postgres    false    207   ??       ?          0    24660    Subasta 
   TABLE DATA           ?   COPY public."Subasta" ("IdSubasta", "IdVendedor", "IdComprador", "IdSubCategoria", "Descripcion", "FormaEntrega", "PrecioInicial", "FechaInicio", "FechaFinal") FROM stdin;
    public          postgres    false    204   ބ       ?          0    16412    Usuarios 
   TABLE DATA           ?   COPY public."Usuarios" ("Cedula", "Nombre", "PrimerApellido", "SegundoApellido", "Alias", "Correo", "Password", "CuantosSubastados", "CuantosComprados", "EsAdmin", "TelefonoCelular", "TelefonoCasa", "TelefonoTrabajo") FROM stdin;
    public          postgres    false    200   r?       ?          0    24645    VariablesSistema 
   TABLE DATA           T   COPY public."VariablesSistema" ("porcentajeMejora", "incrementoMinimo") FROM stdin;
    public          postgres    false    201   ?                  0    0    Categoria_IdCategoria_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Categoria_IdCategoria_seq"', 1, true);
          public          postgres    false    208                       0    0    Pujas_IdPuja_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Pujas_IdPuja_seq"', 3, true);
          public          postgres    false    209                       0    0    SubCategoria_IdSubCategoria_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."SubCategoria_IdSubCategoria_seq"', 1, true);
          public          postgres    false    210                       0    0    Subasta_IdSubasta_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Subasta_IdSubasta_seq"', 11, true);
          public          postgres    false    211            b           2606    24674    Categoria Categoria_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Categoria"
    ADD CONSTRAINT "Categoria_pkey" PRIMARY KEY ("IdCategoria");
 F   ALTER TABLE ONLY public."Categoria" DROP CONSTRAINT "Categoria_pkey";
       public            postgres    false    206            `           2606    24669    Pujas Pujas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Pujas"
    ADD CONSTRAINT "Pujas_pkey" PRIMARY KEY ("IdPuja");
 >   ALTER TABLE ONLY public."Pujas" DROP CONSTRAINT "Pujas_pkey";
       public            postgres    false    205            d           2606    24679    SubCategoria SubCategoria_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."SubCategoria"
    ADD CONSTRAINT "SubCategoria_pkey" PRIMARY KEY ("IdSubCategoria");
 L   ALTER TABLE ONLY public."SubCategoria" DROP CONSTRAINT "SubCategoria_pkey";
       public            postgres    false    207            ^           2606    24664    Subasta Subasta_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Subasta"
    ADD CONSTRAINT "Subasta_pkey" PRIMARY KEY ("IdSubasta");
 B   ALTER TABLE ONLY public."Subasta" DROP CONSTRAINT "Subasta_pkey";
       public            postgres    false    204            \           2606    16416    Usuarios Usuarios_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "Usuarios_pkey" PRIMARY KEY ("Cedula");
 D   ALTER TABLE ONLY public."Usuarios" DROP CONSTRAINT "Usuarios_pkey";
       public            postgres    false    200            k           2606    24703    Pujas Pujas_IdUsuario_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Pujas"
    ADD CONSTRAINT "Pujas_IdUsuario_fkey" FOREIGN KEY ("IdUsuario") REFERENCES public."Usuarios"("Cedula");
 H   ALTER TABLE ONLY public."Pujas" DROP CONSTRAINT "Pujas_IdUsuario_fkey";
       public          postgres    false    205    2908    200            l           2606    24723 *   SubCategoria SubCategoria_IdCategoria_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."SubCategoria"
    ADD CONSTRAINT "SubCategoria_IdCategoria_fkey" FOREIGN KEY ("IdCategoria") REFERENCES public."Categoria"("IdCategoria");
 X   ALTER TABLE ONLY public."SubCategoria" DROP CONSTRAINT "SubCategoria_IdCategoria_fkey";
       public          postgres    false    207    206    2914            h           2606    24713     Subasta Subasta_IdComprador_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Subasta"
    ADD CONSTRAINT "Subasta_IdComprador_fkey" FOREIGN KEY ("IdComprador") REFERENCES public."Usuarios"("Cedula");
 N   ALTER TABLE ONLY public."Subasta" DROP CONSTRAINT "Subasta_IdComprador_fkey";
       public          postgres    false    200    2908    204            i           2606    24718 #   Subasta Subasta_IdSubCategoria_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Subasta"
    ADD CONSTRAINT "Subasta_IdSubCategoria_fkey" FOREIGN KEY ("IdSubCategoria") REFERENCES public."SubCategoria"("IdSubCategoria");
 Q   ALTER TABLE ONLY public."Subasta" DROP CONSTRAINT "Subasta_IdSubCategoria_fkey";
       public          postgres    false    207    2916    204            g           2606    24708    Subasta Subasta_IdVendedor_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Subasta"
    ADD CONSTRAINT "Subasta_IdVendedor_fkey" FOREIGN KEY ("IdVendedor") REFERENCES public."Usuarios"("Cedula");
 M   ALTER TABLE ONLY public."Subasta" DROP CONSTRAINT "Subasta_IdVendedor_fkey";
       public          postgres    false    2908    200    204            e           2606    24688    ComentariosAClientes fktest    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ComentariosAClientes"
    ADD CONSTRAINT fktest FOREIGN KEY ("idSubasta") REFERENCES public."Subasta"("IdSubasta");
 G   ALTER TABLE ONLY public."ComentariosAClientes" DROP CONSTRAINT fktest;
       public          postgres    false    204    202    2910            f           2606    24693    ComentariosAVendedores fktest    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ComentariosAVendedores"
    ADD CONSTRAINT fktest FOREIGN KEY ("IdSubasta") REFERENCES public."Subasta"("IdSubasta");
 I   ALTER TABLE ONLY public."ComentariosAVendedores" DROP CONSTRAINT fktest;
       public          postgres    false    2910    203    204            j           2606    24698    Pujas fktest    FK CONSTRAINT     ~   ALTER TABLE ONLY public."Pujas"
    ADD CONSTRAINT fktest FOREIGN KEY ("IdSubasta") REFERENCES public."Subasta"("IdSubasta");
 8   ALTER TABLE ONLY public."Pujas" DROP CONSTRAINT fktest;
       public          postgres    false    2910    204    205            ?   "   x?3?(??M-JTpN,IM?/:?6?+F??? xAs      ?      x?????? ? ?      ?   2   x???t-.IUH-V(?SH??M?+I,??WHIU((*MMJ??4?????? *??      ?   (   x?3???4?45 NS?id`d?k`?kh?Y????? j??      ?   (   x?3?4?(??M-JT.MRpN,IM?/:?6?+F??? ?U	?      ?   ?   x???1?0???>?/ ?S?ҙ? ]d?Ԓʁ?7,43?l??>?0<l??GM??4Y?)???@??Q??Fq???bX??3?c'w?\y?{?/???k?W???=???r???W%??/C?#??E?/d      ?   ?   x???1?0@??>EN?`a?h?H%?\e??8?@w???˲?	??):?nJ???朮??VǹFͭ???Z????A6?6??????cߗ?h+i?f3??? ]-???Ň;?}?8??e?߿1?{D|X?jG      ?      x?????? ? ?     