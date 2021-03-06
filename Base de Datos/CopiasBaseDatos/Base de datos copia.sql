PGDMP     7    0                y            Bases2_Prueba    13.2    13.2 c               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16411    Bases2_Prueba    DATABASE     p   CREATE DATABASE "Bases2_Prueba" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Costa Rica.1252';
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
       public          postgres    false            ?            1259    16412    Usuarios    TABLE     d  CREATE TABLE public."Usuarios" (
    "Cedula" bigint NOT NULL,
    "Nombre" character varying(20) NOT NULL,
    "PrimerApellido" character varying(20) NOT NULL,
    "SegundoApellido" character varying(20) NOT NULL,
    "Alias" character varying(20) NOT NULL,
    "Correo" character varying(50) NOT NULL,
    "Password" character varying(100) NOT NULL,
    "CuantosSubastados" smallint NOT NULL,
    "CuantosComprados" smallint NOT NULL,
    "EsAdmin" boolean NOT NULL,
    "TelefonoCelular" character varying(20) NOT NULL,
    "TelefonoCasa" character varying(20),
    "TelefonoTrabajo" character varying(20)
);
    DROP TABLE public."Usuarios";
       public         heap    postgres    false            ?            1255    24638    buscarusuario(integer)    FUNCTION     ?  CREATE FUNCTION public.buscarusuario(pid integer) RETURNS public."Usuarios"
    LANGUAGE sql SECURITY DEFINER
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
       public          postgres    false    200                       0    0 #   FUNCTION buscarusuario(pid integer)    ACL     ?   REVOKE ALL ON FUNCTION public.buscarusuario(pid integer) FROM PUBLIC;
GRANT ALL ON FUNCTION public.buscarusuario(pid integer) TO usuario;
          public          postgres    false    227            ?            1255    24923    buscarvariablessistema()    FUNCTION     ?   CREATE FUNCTION public.buscarvariablessistema() RETURNS TABLE(porcentajemejora integer, incrementominimo numeric)
    LANGUAGE sql SECURITY DEFINER
    AS $$
SELECT 
		"porcentajeMejora",
		"incrementoMinimo"
		
FROM 
	"VariablesSistema"
$$;
 /   DROP FUNCTION public.buscarvariablessistema();
       public          postgres    false                       0    0 !   FUNCTION buscarvariablessistema()    ACL     ?   REVOKE ALL ON FUNCTION public.buscarvariablessistema() FROM PUBLIC;
GRANT ALL ON FUNCTION public.buscarvariablessistema() TO usuario;
          public          postgres    false    233            ?            1255    24944    cargarcategorias()    FUNCTION     ?	  CREATE FUNCTION public.cargarcategorias() RETURNS void
    LANGUAGE sql
    AS $$
	TRUNCATE "Usuarios" RESTART IDENTITY CASCADE;
	TRUNCATE "Categoria" RESTART IDENTITY CASCADE;
	TRUNCATE "SubCategoria" RESTART IDENTITY CASCADE;
	TRUNCATE "CategoriaSubCategoria" RESTART IDENTITY CASCADE;
	COPY "CategoriaSubCategoria"("NombreCategoria","NombreSubCategoria") 
	FROM E'C:\\Ulises\\Bases_de_Datos_ll_PR1\\CategoriasSubCategorias.csv' WITH delimiter '	' csv header encoding 'latin1';
	--DELETE FROM "CategoriaSubCategoria"


	INSERT INTO 
		"Categoria"("Nombre") 
	SELECT DISTINCT 
		("NombreCategoria") 
	FROM 
		"CategoriaSubCategoria" 
	ORDER BY ("NombreCategoria");

	INSERT INTO 
		"SubCategoria"("IdCategoria", "Nombre") 
	SELECT 
		C."IdCategoria", Cs."NombreSubCategoria" 
	FROM 
		"Categoria" C 
	INNER JOIN "CategoriaSubCategoria" Cs ON C."Nombre" = Cs."NombreCategoria" 
	ORDER BY (Cs."NombreSubCategoria");
	
	INSERT INTO "VariablesSistema" VALUES(5,5000);
	
	
	CREATE USER "admin1" WITH PASSWORD 'admin1pw';
	CREATE USER "normal" WITH PASSWORD 'normal';
	INSERT INTO "Usuarios" VALUES(1,'admin','apellido1','apellido2','admin1','@gmail','admin1pw',0,0,true,'1','1','1');
	INSERT INTO "Usuarios" VALUES(2,'normal','apellido1','apellido2','normal','@gmail','normal',0,0,false,'2','2','2');
	
	ALTER FUNCTION validarusuario(integer, character varying) SECURITY DEFINER;
	ALTER FUNCTION mostrarusuarios() SECURITY DEFINER;
	ALTER FUNCTION insertarusuario(IN pcedula integer,IN pnombre character varying,IN pprimerapellido character varying,IN psegundoapellido character varying,IN palias character varying,IN pcorreo character varying,IN ppassword character varying,IN ptipousuario boolean,IN ptelefonocelular character varying,IN ptelefonocasa character varying,IN ptelefonotrabajo character varying) SECURITY DEFINER;
	
	GRANT EXECUTE ON FUNCTION validarusuario(integer, character varying) TO "admin1";
	GRANT EXECUTE ON FUNCTION validarusuario(integer, character varying) TO "normal";
	GRANT EXECUTE ON FUNCTION insertarusuario(IN pcedula integer,IN pnombre character varying,IN pprimerapellido character varying,IN psegundoapellido character varying,IN palias character varying,IN pcorreo character varying,IN ppassword character varying,IN ptipousuario boolean,IN ptelefonocelular character varying,IN ptelefonocasa character varying,IN ptelefonotrabajo character varying) TO "admin1";
	GRANT EXECUTE ON FUNCTION mostrarusuarios() TO "admin1";
	
$$;
 )   DROP FUNCTION public.cargarcategorias();
       public          postgres    false            ?            1255    24728 ?   editarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, boolean, character varying, character varying, character varying)    FUNCTION     ?  CREATE FUNCTION public.editarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, pcuantossubastados integer, pcuantoscomprados integer, ptipousuario boolean, ptelefonocelular character varying, ptelefonocasa character varying, ptelefonotrabajo character varying) RETURNS void
    LANGUAGE sql SECURITY DEFINER
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
       public          postgres    false                       0    0 ?  FUNCTION editarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, pcuantossubastados integer, pcuantoscomprados integer, ptipousuario boolean, ptelefonocelular character varying, ptelefonocasa character varying, ptelefonotrabajo character varying)    ACL     e  REVOKE ALL ON FUNCTION public.editarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, pcuantossubastados integer, pcuantoscomprados integer, ptipousuario boolean, ptelefonocelular character varying, ptelefonocasa character varying, ptelefonotrabajo character varying) FROM PUBLIC;
GRANT ALL ON FUNCTION public.editarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, pcuantossubastados integer, pcuantoscomprados integer, ptipousuario boolean, ptelefonocelular character varying, ptelefonocasa character varying, ptelefonotrabajo character varying) TO admin1;
          public          postgres    false    228            ?            1255    24924 (   editarvariablessistema(integer, numeric)    FUNCTION       CREATE FUNCTION public.editarvariablessistema(porcentajemejora integer, preciominimo numeric) RETURNS void
    LANGUAGE sql SECURITY DEFINER
    AS $$
UPDATE 
	"VariablesSistema"
SET
		"porcentajeMejora" = porcentajemejora,
		"incrementoMinimo" = preciominimo
$$;
 ]   DROP FUNCTION public.editarvariablessistema(porcentajemejora integer, preciominimo numeric);
       public          postgres    false                       0    0 O   FUNCTION editarvariablessistema(porcentajemejora integer, preciominimo numeric)    ACL     ?   REVOKE ALL ON FUNCTION public.editarvariablessistema(porcentajemejora integer, preciominimo numeric) FROM PUBLIC;
GRANT ALL ON FUNCTION public.editarvariablessistema(porcentajemejora integer, preciominimo numeric) TO admin1;
          public          postgres    false    239            ?            1255    24755    eliminarusuario(integer)    FUNCTION     ?   CREATE FUNCTION public.eliminarusuario(pid integer) RETURNS void
    LANGUAGE sql SECURITY DEFINER
    AS $$
DELETE FROM "Usuarios"
WHERE
	pId = "Cedula"
$$;
 3   DROP FUNCTION public.eliminarusuario(pid integer);
       public          postgres    false                       0    0 %   FUNCTION eliminarusuario(pid integer)    ACL     ?   REVOKE ALL ON FUNCTION public.eliminarusuario(pid integer) FROM PUBLIC;
GRANT ALL ON FUNCTION public.eliminarusuario(pid integer) TO admin1;
          public          postgres    false    234            ?            1255    24760 A   insertarcomentarioacomprador(integer, character varying, integer)    FUNCTION       CREATE FUNCTION public.insertarcomentarioacomprador(idsubasta integer, comentario character varying, evaluacion integer) RETURNS void
    LANGUAGE sql SECURITY DEFINER
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
       public          postgres    false                       0    0 j   FUNCTION insertarcomentarioacomprador(idsubasta integer, comentario character varying, evaluacion integer)    ACL       REVOKE ALL ON FUNCTION public.insertarcomentarioacomprador(idsubasta integer, comentario character varying, evaluacion integer) FROM PUBLIC;
GRANT ALL ON FUNCTION public.insertarcomentarioacomprador(idsubasta integer, comentario character varying, evaluacion integer) TO normal;
          public          postgres    false    235            ?            1255    24758 @   insertarcomentarioavendedor(integer, character varying, integer)    FUNCTION     S  CREATE FUNCTION public.insertarcomentarioavendedor(idsubasta integer, comentario character varying, evaluacion integer) RETURNS void
    LANGUAGE sql SECURITY DEFINER
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
       public          postgres    false                       0    0 i   FUNCTION insertarcomentarioavendedor(idsubasta integer, comentario character varying, evaluacion integer)    ACL       REVOKE ALL ON FUNCTION public.insertarcomentarioavendedor(idsubasta integer, comentario character varying, evaluacion integer) FROM PUBLIC;
GRANT ALL ON FUNCTION public.insertarcomentarioavendedor(idsubasta integer, comentario character varying, evaluacion integer) TO normal;
          public          postgres    false    237            ?            1255    24729 ?   insertarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, boolean, character varying, character varying, character varying)    FUNCTION     ^  CREATE FUNCTION public.insertarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, ptipousuario boolean, ptelefonocelular character varying, ptelefonocasa character varying, ptelefonotrabajo character varying) RETURNS void
    LANGUAGE sql SECURITY DEFINER
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
       public          postgres    false                       0    0 \  FUNCTION insertarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, ptipousuario boolean, ptelefonocelular character varying, ptelefonocasa character varying, ptelefonotrabajo character varying)    ACL     ?  REVOKE ALL ON FUNCTION public.insertarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, ptipousuario boolean, ptelefonocelular character varying, ptelefonocasa character varying, ptelefonotrabajo character varying) FROM PUBLIC;
GRANT ALL ON FUNCTION public.insertarusuario(pcedula integer, pnombre character varying, pprimerapellido character varying, psegundoapellido character varying, palias character varying, pcorreo character varying, ppassword character varying, ptipousuario boolean, ptelefonocelular character varying, ptelefonocasa character varying, ptelefonotrabajo character varying) TO admin1;
          public          postgres    false    238            ?            1255    24935    mostrarcategorias()    FUNCTION     ?   CREATE FUNCTION public.mostrarcategorias() RETURNS TABLE(idcategoria bigint, nombrecategoria character varying)
    LANGUAGE sql SECURITY DEFINER
    AS $$
SELECT 
		Ca."IdCategoria",
		Ca."Nombre"
FROM 
	"Categoria"  Ca
$$;
 *   DROP FUNCTION public.mostrarcategorias();
       public          postgres    false                       0    0    FUNCTION mostrarcategorias()    ACL     |   REVOKE ALL ON FUNCTION public.mostrarcategorias() FROM PUBLIC;
GRANT ALL ON FUNCTION public.mostrarcategorias() TO usuario;
          public          postgres    false    230            ?            1255    24925    mostrarcompradas(integer)    FUNCTION     ?  CREATE FUNCTION public.mostrarcompradas(pcedula integer) RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone)
    LANGUAGE sql SECURITY DEFINER
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
       public          postgres    false                       0    0 *   FUNCTION mostrarcompradas(pcedula integer)    ACL     ?   REVOKE ALL ON FUNCTION public.mostrarcompradas(pcedula integer) FROM PUBLIC;
GRANT ALL ON FUNCTION public.mostrarcompradas(pcedula integer) TO normal;
          public          postgres    false    243            ?            1255    24926    mostrarhistorialpujas(integer)    FUNCTION     ?  CREATE FUNCTION public.mostrarhistorialpujas(idsubasta integer) RETURNS TABLE(nombre character varying, alias character varying, incremento numeric, preciofinal numeric, fechasubida timestamp without time zone)
    LANGUAGE sql SECURITY DEFINER
    AS $$
SELECT 
		U."Nombre",
		U."Alias",
		Pu."Incremento",
		Pu."PrecioFinal",
		Pu."FechaSubida"

FROM 
	"Pujas" Pu
INNER JOIN "Usuarios" U ON U."Cedula" = PU."IdUsuario"
WHERE Pu."IdSubasta" = idsubasta AND U."Cedula" <> 0
ORDER BY Pu."IdPuja" DESC;
;
$$;
 ?   DROP FUNCTION public.mostrarhistorialpujas(idsubasta integer);
       public          postgres    false                       0    0 1   FUNCTION mostrarhistorialpujas(idsubasta integer)    ACL     ?   REVOKE ALL ON FUNCTION public.mostrarhistorialpujas(idsubasta integer) FROM PUBLIC;
GRANT ALL ON FUNCTION public.mostrarhistorialpujas(idsubasta integer) TO usuario;
          public          postgres    false    231            ?            1255    24851    mostrarinfocomprador(integer)    FUNCTION     F  CREATE FUNCTION public.mostrarinfocomprador(pcedula integer) RETURNS TABLE(nombrecomprador character varying, nombrevendedor character varying, comentario character varying, puntaje integer)
    LANGUAGE sql SECURITY DEFINER
    AS $$
SELECT 
		UC."Nombre", --Comprador
		UV."Nombre" ,--vendedor
		cmtC."Comentario",
		cmtC."Evaluacion"
FROM 
	"Subasta"  S
INNER JOIN "Usuarios" UV ON UV."Cedula" = S."IdVendedor"
INNER JOIN "Usuarios"  UC ON UC."Cedula" = S."IdComprador"
INNER JOIN "ComentariosAClientes" cmtC ON cmtC."idSubasta" = S."IdSubasta"

WHERE
	UC."Cedula" = pcedula
$$;
 <   DROP FUNCTION public.mostrarinfocomprador(pcedula integer);
       public          postgres    false                       0    0 .   FUNCTION mostrarinfocomprador(pcedula integer)    ACL     ?   REVOKE ALL ON FUNCTION public.mostrarinfocomprador(pcedula integer) FROM PUBLIC;
GRANT ALL ON FUNCTION public.mostrarinfocomprador(pcedula integer) TO usuario;
          public          postgres    false    236            ?            1255    24794    mostrarinfovendedor(integer)    FUNCTION     G  CREATE FUNCTION public.mostrarinfovendedor(pcedula integer) RETURNS TABLE(nombrecomprador character varying, nombrevendedor character varying, comentario character varying, puntaje integer)
    LANGUAGE sql SECURITY DEFINER
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
       public          postgres    false                        0    0 -   FUNCTION mostrarinfovendedor(pcedula integer)    ACL     ?   REVOKE ALL ON FUNCTION public.mostrarinfovendedor(pcedula integer) FROM PUBLIC;
GRANT ALL ON FUNCTION public.mostrarinfovendedor(pcedula integer) TO usuario;
          public          postgres    false    229            ?            1255    24927    mostrarsubastadas(integer)    FUNCTION     ?  CREATE FUNCTION public.mostrarsubastadas(pcedula integer) RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone)
    LANGUAGE sql SECURITY DEFINER
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
       public          postgres    false            !           0    0 +   FUNCTION mostrarsubastadas(pcedula integer)    ACL     ?   REVOKE ALL ON FUNCTION public.mostrarsubastadas(pcedula integer) FROM PUBLIC;
GRANT ALL ON FUNCTION public.mostrarsubastadas(pcedula integer) TO normal;
          public          postgres    false    244            ?            1255    24934    mostrarsubastasactivas()    FUNCTION     B  CREATE FUNCTION public.mostrarsubastasactivas() RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone, incremento numeric, montofinal numeric)
    LANGUAGE sql SECURITY DEFINER
    AS $_$
--DECLARE fechaActual date;
--do $$
--declare incrementoMinimo real;
--		porcentajeMejora integer;
--		precioFinal real;
--		incremento real;
--BEGIN
--incrementoMinimo = (SELECT "incrementoMinimo" FROM "VariablesSistema");
--pM = (SELECT "porcentajeMejora" FROM "VariablesSistema");
--SELECT (MAX((SELECT "incrementoMinimo" FROM "VariablesSistema"),CAST(((SELECT "PrecioFinal" FROM "Pujas") * (SELECT "porcentajeMejora" FROM "VariablesSistema")/100) AS real)))
--
--end $$;
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
		S."FechaFinal",
		Pu."Incremento",
		Pu."PrecioFinal"

FROM 
	"Subasta"  S
INNER JOIN "Usuarios" UV ON UV."Cedula" = S."IdVendedor"
INNER JOIN "SubCategoria"  Sca ON Sca."IdSubCategoria" = S."IdSubCategoria"
INNER JOIN "Categoria"  Ca ON Ca."IdCategoria" = Sca."IdCategoria"
INNER JOIN "Usuarios"  UC ON UC."Cedula" = S."IdComprador"
INNER JOIN "Pujas" Pu ON Pu."IdSubasta" = S."IdSubasta"

WHERE
	current_timestamp >= S."FechaInicio" AND current_timestamp <= S."FechaFinal" AND Pu."PujaMasAlta" = true
ORDER BY S."FechaFinal";
$_$;
 /   DROP FUNCTION public.mostrarsubastasactivas();
       public          postgres    false            "           0    0 !   FUNCTION mostrarsubastasactivas()    ACL     ?   REVOKE ALL ON FUNCTION public.mostrarsubastasactivas() FROM PUBLIC;
GRANT ALL ON FUNCTION public.mostrarsubastasactivas() TO usuario;
          public          postgres    false    253            ?            1255    24940 ,   mostrarsubastasactivassubcategorias(integer)    FUNCTION     ?  CREATE FUNCTION public.mostrarsubastasactivassubcategorias(idsubcategoria integer) RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone, incremento numeric, montofinal numeric)
    LANGUAGE sql SECURITY DEFINER
    AS $$

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
		S."FechaFinal",
		Pu."Incremento",
		Pu."PrecioFinal"

FROM 
	"Subasta"  S
INNER JOIN "Usuarios" UV ON UV."Cedula" = S."IdVendedor"
INNER JOIN "SubCategoria"  Sca ON Sca."IdSubCategoria" = S."IdSubCategoria"
INNER JOIN "Categoria"  Ca ON Ca."IdCategoria" = Sca."IdCategoria"
INNER JOIN "Usuarios"  UC ON UC."Cedula" = S."IdComprador"
INNER JOIN "Pujas" Pu ON Pu."IdSubasta" = S."IdSubasta"

WHERE
	current_date >= S."FechaInicio" AND current_date <= S."FechaFinal" AND Pu."PujaMasAlta" = true AND S."IdSubCategoria" = idsubcategoria
ORDER BY S."FechaFinal";
$$;
 R   DROP FUNCTION public.mostrarsubastasactivassubcategorias(idsubcategoria integer);
       public          postgres    false            #           0    0 D   FUNCTION mostrarsubastasactivassubcategorias(idsubcategoria integer)    ACL     ?   REVOKE ALL ON FUNCTION public.mostrarsubastasactivassubcategorias(idsubcategoria integer) FROM PUBLIC;
GRANT ALL ON FUNCTION public.mostrarsubastasactivassubcategorias(idsubcategoria integer) TO usuario;
          public          postgres    false    250            ?            1255    24930    mostrarsubastasvencidas()    FUNCTION       CREATE FUNCTION public.mostrarsubastasvencidas() RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone, incremento numeric, montofinal numeric)
    LANGUAGE sql SECURITY DEFINER
    AS $$
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
		S."FechaFinal",
		Pu."Incremento",
		Pu."PrecioFinal"

FROM 
	"Subasta"  S
INNER JOIN "Usuarios" UV ON UV."Cedula" = S."IdVendedor"
INNER JOIN "SubCategoria"  Sca ON Sca."IdSubCategoria" = S."IdSubCategoria"
INNER JOIN "Categoria"  Ca ON Ca."IdCategoria" = Sca."IdCategoria"
INNER JOIN "Usuarios"  UC ON UC."Cedula" = S."IdComprador"
INNER JOIN "Pujas" Pu ON Pu."IdSubasta" = S."IdSubasta"

WHERE
	current_date > S."FechaFinal" AND Pu."PujaMasAlta" = true;
$$;
 0   DROP FUNCTION public.mostrarsubastasvencidas();
       public          postgres    false            $           0    0 "   FUNCTION mostrarsubastasvencidas()    ACL     ?   REVOKE ALL ON FUNCTION public.mostrarsubastasvencidas() FROM PUBLIC;
GRANT ALL ON FUNCTION public.mostrarsubastasvencidas() TO usuario;
          public          postgres    false    247            ?            1255    24939    mostrarsubcategorias(integer)    FUNCTION     ?  CREATE FUNCTION public.mostrarsubcategorias(idcategoria integer) RETURNS TABLE(idcategoria bigint, idsubcategoria integer, nombrecategoria character varying, nombresubcategoria character varying)
    LANGUAGE sql SECURITY DEFINER
    AS $$
SELECT 
		Ca."IdCategoria",
		Sc."IdSubCategoria",
		Ca."Nombre",
		Sc."Nombre"
FROM 
	"SubCategoria"  Sc
INNER JOIN "Categoria" Ca ON Ca."IdCategoria" = idcategoria
WHERE
	Sc."IdCategoria" = idcategoria;
$$;
 @   DROP FUNCTION public.mostrarsubcategorias(idcategoria integer);
       public          postgres    false            %           0    0 2   FUNCTION mostrarsubcategorias(idcategoria integer)    ACL     ?   REVOKE ALL ON FUNCTION public.mostrarsubcategorias(idcategoria integer) FROM PUBLIC;
GRANT ALL ON FUNCTION public.mostrarsubcategorias(idcategoria integer) TO usuario;
          public          postgres    false    251            ?            1255    24931    mostrartodassubastas()    FUNCTION     ?  CREATE FUNCTION public.mostrartodassubastas() RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone)
    LANGUAGE sql SECURITY DEFINER
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
       public          postgres    false            &           0    0    FUNCTION mostrartodassubastas()    ACL     ?   REVOKE ALL ON FUNCTION public.mostrartodassubastas() FROM PUBLIC;
GRANT ALL ON FUNCTION public.mostrartodassubastas() TO admin1;
          public          postgres    false    245            ?            1255    24730    mostrarusuarios()    FUNCTION     ?  CREATE FUNCTION public.mostrarusuarios() RETURNS TABLE(cedula bigint, nombre character varying, primerapellido character varying, segundoapellido character varying, aliass character varying, correo character varying, password character varying, cuantossubastados integer, cuantoscomprados integer, esadmin boolean, telefonocelular character varying, telefonocasa character varying, telefonotrabajo character varying)
    LANGUAGE sql SECURITY DEFINER
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
WHERE "Cedula" <> 0;
$$;
 (   DROP FUNCTION public.mostrarusuarios();
       public          postgres    false            '           0    0    FUNCTION mostrarusuarios()    ACL     w   REVOKE ALL ON FUNCTION public.mostrarusuarios() FROM PUBLIC;
GRANT ALL ON FUNCTION public.mostrarusuarios() TO admin1;
          public          postgres    false    246            ?            1255    24612    mostrarusuarios(bigint) 	   PROCEDURE     ?   CREATE PROCEDURE public.mostrarusuarios(INOUT pcedula bigint)
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
       public          postgres    false            ?            1255    24932     pujar(integer, integer, numeric)    FUNCTION       CREATE FUNCTION public.pujar(idsubasta integer, idusuariopujador integer, incremento numeric) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
--DECLARE
 --   local_a text := a;
   -- local_b text := b;
DECLARE nuevoIncrementoMinimo numeric;-- idsubasta integer;
		incrementoPorcentaje numeric;
		incrementoMinimo numeric;
		id_usuario integer := idusuariopujador;
		id_subasta integer := idsubasta;
		_incremento numeric := incremento;
		nuevoIncremento numeric;
BEGIN

nuevoIncrementoMinimo = ((SELECT "PrecioFinal" FROM "Pujas"  ORDER BY "IdPuja" DESC limit 1) + _incremento);
incrementoPorcentaje = (nuevoIncrementoMinimo * (Select "porcentajeMejora" FROM "VariablesSistema" )/100);
incrementoMinimo = (SELECT "incrementoMinimo" FROM "VariablesSistema");
IF incrementoMinimo > incrementoPorcentaje THEN
    nuevoIncremento = incrementoMinimo;
ELSE
	nuevoIncremento = ROUND(incrementoPorcentaje);
END IF;
--nuevoIncremento =  MAX(incrementoMinimo,incrementoPorcentaje);
INSERT INTO "Pujas"(
		"IdSubasta",
		"IdUsuario",
		"Incremento",
		"PrecioFinal",
		"FechaSubida",
		"PujaMasAlta"

	)
	VALUES(
		id_subasta,
		id_usuario,
		--(SELECT MAX((SELECT "incrementoMinimo" FROM "VariablesSistema"),cast( (((SELECT "PrecioFinal" FROM "Pujas"  ORDER BY "IdPuja" DESC limit 1) + incremento)* (Select "porcentajeMejora" FROM "VariablesSistema" )/100)AS REAL))),
		nuevoIncremento,
		(_incremento + (SELECT "PrecioFinal" FROM "Pujas" WHERE "IdSubasta" = id_subasta ORDER BY "IdPuja" DESC limit 1)),
		current_timestamp,
		true
	);
END;
$$;
 ]   DROP FUNCTION public.pujar(idsubasta integer, idusuariopujador integer, incremento numeric);
       public          postgres    false            (           0    0 O   FUNCTION pujar(idsubasta integer, idusuariopujador integer, incremento numeric)    ACL     ?   REVOKE ALL ON FUNCTION public.pujar(idsubasta integer, idusuariopujador integer, incremento numeric) FROM PUBLIC;
GRANT ALL ON FUNCTION public.pujar(idsubasta integer, idusuariopujador integer, incremento numeric) TO normal;
          public          postgres    false    252            ?            1255    24933 ?   subastaritem(integer, character varying, character varying, character varying, numeric, timestamp without time zone, timestamp without time zone)    FUNCTION     .  CREATE FUNCTION public.subastaritem(idusuario integer, subcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone) RETURNS void
    LANGUAGE sql SECURITY DEFINER
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
	--SELECT "IdSubasta" FROM "Subasta"  ORDER BY "IdSubasta" DESC limit 1
	--INNER JOIN "SubCategoria" Sca ON Sca."Nombre" = subcategoria;
$$;
 ?   DROP FUNCTION public.subastaritem(idusuario integer, subcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone);
       public          postgres    false            )           0    0 ?   FUNCTION subastaritem(idusuario integer, subcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone)    ACL     !  REVOKE ALL ON FUNCTION public.subastaritem(idusuario integer, subcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone) FROM PUBLIC;
GRANT ALL ON FUNCTION public.subastaritem(idusuario integer, subcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone) TO normal;
          public          postgres    false    248            ?            1255    24858    trigger_actualizar_pujas()    FUNCTION     ?  CREATE FUNCTION public.trigger_actualizar_pujas() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE idpujavieja integer; idsubasta integer;cantidadPujas integer;idusuario integer;
BEGIN
idsubasta = (SELECT "IdSubasta" FROM "Pujas" ORDER BY "IdPuja" DESC limit 1);
idusuario = (SELECT "IdUsuario" FROM "Pujas" ORDER BY "IdPuja" DESC limit 1);
cantidadPujas = (SELECT COUNT(*) FROM "Pujas" WHERE "IdSubasta" = idsubasta);

idpujavieja = (SELECT "IdPuja" FROM "Pujas" WHERE "IdSubasta" = idsubasta AND "PujaMasAlta" = true ORDER BY "IdPuja" ASC limit 1);
--incremento = (SELECT Su."PrecioInicial" FROM "Subasta" Su WHERE Su."IdSubasta" = idsubasta);

UPDATE 
	"Pujas" 
SET
	"PujaMasAlta" = false
WHERE
	"IdPuja" = idpujavieja AND cantidadPujas > 1; --OLD."IdPuja" AND "IdSubasta" = NEW."IdSubasta";
UPDATE 
	"Subasta"
SET
	"IdComprador" = idusuario
WHERE 
	cantidadPujas > 1 AND "IdSubasta" = idsubasta;

return NULL;
END
$$;
 1   DROP FUNCTION public.trigger_actualizar_pujas();
       public          postgres    false            ?            1255    24832    trigger_subastas_pujas()    FUNCTION     i  CREATE FUNCTION public.trigger_subastas_pujas() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE incremento numeric; idsubasta integer;
BEGIN
idsubasta = (SELECT "IdSubasta" FROM "Subasta"  ORDER BY "IdSubasta" DESC limit 1);
incremento = (SELECT Su."PrecioInicial" FROM "Subasta" Su WHERE Su."IdSubasta" = idsubasta);

INSERT INTO 
	"Pujas" (
				"IdSubasta",
				"IdUsuario",
				"Incremento",
				"PrecioFinal",
				"FechaSubida",
				"PujaMasAlta"
			)
VALUES(
		(SELECT "IdSubasta" FROM "Subasta"  ORDER BY "IdSubasta" DESC limit 1),
		0,
		incremento,
		0,
		current_date,
		True
	);

return new;
END
$$;
 /   DROP FUNCTION public.trigger_subastas_pujas();
       public          postgres    false            ?            1255    24643 *   validarusuario(integer, character varying)    FUNCTION     ?  CREATE FUNCTION public.validarusuario(pcedula integer, ppassword character varying) RETURNS public."Usuarios"
    LANGUAGE sql SECURITY DEFINER
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
       public          postgres    false    200            *           0    0 E   FUNCTION validarusuario(pcedula integer, ppassword character varying)    ACL     ?   REVOKE ALL ON FUNCTION public.validarusuario(pcedula integer, ppassword character varying) FROM PUBLIC;
GRANT ALL ON FUNCTION public.validarusuario(pcedula integer, ppassword character varying) TO admin1;
          public          postgres    false    241            ?            1255    25140 4   validarusuario(character varying, character varying)    FUNCTION     ?  CREATE FUNCTION public.validarusuario(palias character varying, ppassword character varying) RETURNS public."Usuarios"
    LANGUAGE sql SECURITY DEFINER
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
	palias = "Alias" AND ppassword = "Password"
$$;
 \   DROP FUNCTION public.validarusuario(palias character varying, ppassword character varying);
       public          postgres    false    200            +           0    0 N   FUNCTION validarusuario(palias character varying, ppassword character varying)    ACL     ?   REVOKE ALL ON FUNCTION public.validarusuario(palias character varying, ppassword character varying) FROM PUBLIC;
GRANT ALL ON FUNCTION public.validarusuario(palias character varying, ppassword character varying) TO usuario;
          public          postgres    false    249            ?            1259    24670 	   Categoria    TABLE     k   CREATE TABLE public."Categoria" (
    "IdCategoria" bigint NOT NULL,
    "Nombre" character varying(60)
);
    DROP TABLE public."Categoria";
       public         heap    postgres    false            ?            1259    24941    CategoriaSubCategoria    TABLE     ?   CREATE TABLE public."CategoriaSubCategoria" (
    "NombreCategoria" character varying(100),
    "NombreSubCategoria" character varying(100)
);
 +   DROP TABLE public."CategoriaSubCategoria";
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
    "Incremento" numeric,
    "PrecioFinal" numeric,
    "FechaSubida" timestamp without time zone,
    "PujaMasAlta" boolean
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
            public          postgres    false    207            ?            1259    24660    Subasta    TABLE     `  CREATE TABLE public."Subasta" (
    "IdSubasta" bigint NOT NULL,
    "IdVendedor" bigint,
    "IdComprador" bigint,
    "IdSubCategoria" bigint,
    "Descripcion" character varying(50),
    "FormaEntrega" character varying(50),
    "PrecioInicial" numeric,
    "FechaInicio" timestamp without time zone,
    "FechaFinal" timestamp without time zone
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
            public          postgres    false    204            ?            1259    24645    VariablesSistema    TABLE     l   CREATE TABLE public."VariablesSistema" (
    "porcentajeMejora" smallint,
    "incrementoMinimo" numeric
);
 &   DROP TABLE public."VariablesSistema";
       public         heap    postgres    false                      0    24670 	   Categoria 
   TABLE DATA           >   COPY public."Categoria" ("IdCategoria", "Nombre") FROM stdin;
    public          postgres    false    206   A?                 0    24941    CategoriaSubCategoria 
   TABLE DATA           Z   COPY public."CategoriaSubCategoria" ("NombreCategoria", "NombreSubCategoria") FROM stdin;
    public          postgres    false    212   R?                 0    24648    ComentariosAClientes 
   TABLE DATA           Y   COPY public."ComentariosAClientes" ("idSubasta", "Comentario", "Evaluacion") FROM stdin;
    public          postgres    false    202   ?                 0    24654    ComentariosAVendedores 
   TABLE DATA           [   COPY public."ComentariosAVendedores" ("IdSubasta", "Comentario", "Evaluacion") FROM stdin;
    public          postgres    false    203   7?                 0    24665    Pujas 
   TABLE DATA           ?   COPY public."Pujas" ("IdPuja", "IdSubasta", "IdUsuario", "Incremento", "PrecioFinal", "FechaSubida", "PujaMasAlta") FROM stdin;
    public          postgres    false    205   T?                 0    24675    SubCategoria 
   TABLE DATA           S   COPY public."SubCategoria" ("IdSubCategoria", "IdCategoria", "Nombre") FROM stdin;
    public          postgres    false    207   ??                 0    24660    Subasta 
   TABLE DATA           ?   COPY public."Subasta" ("IdSubasta", "IdVendedor", "IdComprador", "IdSubCategoria", "Descripcion", "FormaEntrega", "PrecioInicial", "FechaInicio", "FechaFinal") FROM stdin;
    public          postgres    false    204   ?                0    16412    Usuarios 
   TABLE DATA           ?   COPY public."Usuarios" ("Cedula", "Nombre", "PrimerApellido", "SegundoApellido", "Alias", "Correo", "Password", "CuantosSubastados", "CuantosComprados", "EsAdmin", "TelefonoCelular", "TelefonoCasa", "TelefonoTrabajo") FROM stdin;
    public          postgres    false    200                   0    24645    VariablesSistema 
   TABLE DATA           T   COPY public."VariablesSistema" ("porcentajeMejora", "incrementoMinimo") FROM stdin;
    public          postgres    false    201         ,           0    0    Categoria_IdCategoria_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Categoria_IdCategoria_seq"', 35, true);
          public          postgres    false    208            -           0    0    Pujas_IdPuja_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Pujas_IdPuja_seq"', 2, true);
          public          postgres    false    209            .           0    0    SubCategoria_IdSubCategoria_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."SubCategoria_IdSubCategoria_seq"', 447, true);
          public          postgres    false    210            /           0    0    Subasta_IdSubasta_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Subasta_IdSubasta_seq"', 2, true);
          public          postgres    false    211            r           2606    24674    Categoria Categoria_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Categoria"
    ADD CONSTRAINT "Categoria_pkey" PRIMARY KEY ("IdCategoria");
 F   ALTER TABLE ONLY public."Categoria" DROP CONSTRAINT "Categoria_pkey";
       public            postgres    false    206            p           2606    24669    Pujas Pujas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Pujas"
    ADD CONSTRAINT "Pujas_pkey" PRIMARY KEY ("IdPuja");
 >   ALTER TABLE ONLY public."Pujas" DROP CONSTRAINT "Pujas_pkey";
       public            postgres    false    205            t           2606    24679    SubCategoria SubCategoria_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."SubCategoria"
    ADD CONSTRAINT "SubCategoria_pkey" PRIMARY KEY ("IdSubCategoria");
 L   ALTER TABLE ONLY public."SubCategoria" DROP CONSTRAINT "SubCategoria_pkey";
       public            postgres    false    207            n           2606    24664    Subasta Subasta_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Subasta"
    ADD CONSTRAINT "Subasta_pkey" PRIMARY KEY ("IdSubasta");
 B   ALTER TABLE ONLY public."Subasta" DROP CONSTRAINT "Subasta_pkey";
       public            postgres    false    204            l           2606    16416    Usuarios Usuarios_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "Usuarios_pkey" PRIMARY KEY ("Cedula");
 D   ALTER TABLE ONLY public."Usuarios" DROP CONSTRAINT "Usuarios_pkey";
       public            postgres    false    200            }           2620    24833    Subasta crearpuja    TRIGGER        CREATE TRIGGER crearpuja AFTER INSERT ON public."Subasta" FOR EACH STATEMENT EXECUTE FUNCTION public.trigger_subastas_pujas();
 ,   DROP TRIGGER crearpuja ON public."Subasta";
       public          postgres    false    204    232            ~           2620    24859    Pujas nuevapuja    TRIGGER        CREATE TRIGGER nuevapuja AFTER INSERT ON public."Pujas" FOR EACH STATEMENT EXECUTE FUNCTION public.trigger_actualizar_pujas();
 *   DROP TRIGGER nuevapuja ON public."Pujas";
       public          postgres    false    240    205            {           2606    24703    Pujas Pujas_IdUsuario_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Pujas"
    ADD CONSTRAINT "Pujas_IdUsuario_fkey" FOREIGN KEY ("IdUsuario") REFERENCES public."Usuarios"("Cedula");
 H   ALTER TABLE ONLY public."Pujas" DROP CONSTRAINT "Pujas_IdUsuario_fkey";
       public          postgres    false    2924    205    200            |           2606    24723 *   SubCategoria SubCategoria_IdCategoria_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."SubCategoria"
    ADD CONSTRAINT "SubCategoria_IdCategoria_fkey" FOREIGN KEY ("IdCategoria") REFERENCES public."Categoria"("IdCategoria");
 X   ALTER TABLE ONLY public."SubCategoria" DROP CONSTRAINT "SubCategoria_IdCategoria_fkey";
       public          postgres    false    2930    206    207            x           2606    24713     Subasta Subasta_IdComprador_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Subasta"
    ADD CONSTRAINT "Subasta_IdComprador_fkey" FOREIGN KEY ("IdComprador") REFERENCES public."Usuarios"("Cedula");
 N   ALTER TABLE ONLY public."Subasta" DROP CONSTRAINT "Subasta_IdComprador_fkey";
       public          postgres    false    2924    204    200            y           2606    24718 #   Subasta Subasta_IdSubCategoria_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Subasta"
    ADD CONSTRAINT "Subasta_IdSubCategoria_fkey" FOREIGN KEY ("IdSubCategoria") REFERENCES public."SubCategoria"("IdSubCategoria");
 Q   ALTER TABLE ONLY public."Subasta" DROP CONSTRAINT "Subasta_IdSubCategoria_fkey";
       public          postgres    false    207    2932    204            w           2606    24708    Subasta Subasta_IdVendedor_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Subasta"
    ADD CONSTRAINT "Subasta_IdVendedor_fkey" FOREIGN KEY ("IdVendedor") REFERENCES public."Usuarios"("Cedula");
 M   ALTER TABLE ONLY public."Subasta" DROP CONSTRAINT "Subasta_IdVendedor_fkey";
       public          postgres    false    200    204    2924            u           2606    24688    ComentariosAClientes fktest    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ComentariosAClientes"
    ADD CONSTRAINT fktest FOREIGN KEY ("idSubasta") REFERENCES public."Subasta"("IdSubasta");
 G   ALTER TABLE ONLY public."ComentariosAClientes" DROP CONSTRAINT fktest;
       public          postgres    false    204    202    2926            v           2606    24693    ComentariosAVendedores fktest    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ComentariosAVendedores"
    ADD CONSTRAINT fktest FOREIGN KEY ("IdSubasta") REFERENCES public."Subasta"("IdSubasta");
 I   ALTER TABLE ONLY public."ComentariosAVendedores" DROP CONSTRAINT fktest;
       public          postgres    false    2926    203    204            z           2606    24698    Pujas fktest    FK CONSTRAINT     ~   ALTER TABLE ONLY public."Pujas"
    ADD CONSTRAINT fktest FOREIGN KEY ("IdSubasta") REFERENCES public."Subasta"("IdSubasta");
 8   ALTER TABLE ONLY public."Pujas" DROP CONSTRAINT fktest;
       public          postgres    false    204    205    2926                 x?]??n?@?g?S????????A???}G?g???}u?&cE???^?<?C?I?????n}???4U?!?j?OD??1?i??:;???J?#???˫??R?!?#G5??O???[-??h;?Fu-?s??թ???Q7pg?S?J?????fI??*??S][a?kX/,Ҏ??W?,1??f8{U??? ?V?њ`Y?SXr?焆??U?p+?J?@e??g۳x:?c?XYorLb9U??!&?z?\aZ?G/R??_???Xu9JoW?^?#????c#Ǉ⽁Ǽ?$;o/??R'????'?ŪaE??n???۾????2??D6?#?'Hqo;[?T??ܼ??(W:?f
?<?$=?9??3X??j??Dn????o?U????&?2n/ǐEE͂??k??=^U????6P?MYv/?|?p?ږ?{?????X_?)܁????u??W????c/????zW?m`͆+?4?/?iaC?.?Q?S?X<?3??a???#?f??????_?            x??\Ksݸr^˿????J??TV?N:????$?S????9?.Hp@R???.????/??Ke?????A?y<??? ?x4??β????ӉJtqr????????L???????E?ѣ?I?=?uE???
?0?ֻC?*??؛ҍ?+=v^??I?/???}???Z]ו????߹???2~0???h??&?%??Ki??V?,!?????e8??Uq??*??[?z?=??{?G??V??^?t?X?cLd?i???vW?l??G?|????~,J? ?K?????W?L4Zڍ7??G??W?W????*?????Υ[??*???????(:o???dje?W??w?ƪR??s[?-ю??G*=m?vra<8??Fʗ????'??7?#^??,щ?:???B??r????ο:???3r?=?@?(W?Ӗ???;??<??V	??r????%T?];fa??????Wݥ w\b????r?M㭎+???#NJ? ??<-????*U2[f??v????- {P[Cs?Lΰ??pI;4??	???߸?a?,?u??x?7fȦ?C???/?0?D"u?i[z??9ʍ?*?;?c?d???E:?!$?5?U?/??c?'S?ȝT???????Eo?0	]??????]??Ő??%M?M?%?????}x!=?x???????$??l?I????? w,????R??dI?d?=9?Cra_t????>5??07??[X?
p?ֶ???5?{0?3?[|? ??L?}?}K??:??8?%E,s??s]??Z# 1????Ppן#t[?מ????z??";??Ou	R??Y??]??\?	????????i?ZeuWi?v9?????!??&)?h???m?'n")OE2ۯ??')b?
g?h??.?Ot
?᛺?_R%?y?J?Kj6?9???+???6v??G??,Sb?Eq???D?'?@e-Á5?Z???d?*ē@s???b???#&?:|?4?x!?=;?̿ݿms?5[3h4v?x?[?	??.bu2?Ŭb#Fh???a[?н̢?
???p?5w??
????%?w??ܻ$??Un萝?lC?hX?^??tlw?@ʍ?'}?sd??ڶw?px'?Ns????????[m?#?ޒ???>mh??GӅ?=ML?[?|????X???5???'Ʌ;{?????k}9#23O??p?J7$q?@M?S?2kn?3? 2ݧ???;va?S?`?j?E?V??ѧ????W?]+???H?=d?P??zv????:????1x=G??wh??/R?????O?p|8?ҫ?z\$??)U?????]B?%_???b??C¥գ???mtѡEm?-?ώ??_???
?9????Y?^`jv>z"?.??k?S:??`?e{?M?]^??~???"?Fe*?_a?Q???d??^?????i??̝????x2(?"?_?׻?Y??????9???Jk?N??l ?$.??Q?,w0??~a??)(K?;d'??;?`Dσ+$?f?,3)?N?f[=s?Dr???(?G?SVT?c;?$?C?X&?*kU????K?;WY????P#??33?p?c??<??Z???ʆ?)?jG3?^??n?)4??b]??.s???*Y????x	@??????e??%~)2??}΃\)"-??(? j???P?"]?^??nK???P0ua
?>?B?SHF?,ќ?2d?PPy?r?.???\ɕ??q??a??????c????o%??xM????(X)??y?F??!G}?? fI^??Q?ۗ.?z??Yp?H6kT?q[?@????I{"??"?
7#%?8[M?!??cNA??&?m??Pm?Wɘ?e?)?TW?˫?U	:0???:esB??(???x???6.bn?!ѿ,?o?6´???=??,?????????[??????L?F??G?ư???g?sY?ܰ?J\?q{????CA???[??Sx?uv?IZCrT????[G
I8Y?^??zJ?v?[պ??r????;?@?%IEB???@????$??[8?.ͫ?&".i`ZH:??)?F%?fK)??4}y?+?Mr?/????ϝ??? ?S??ѭV??????????ty???r?5?n/I_?p????H?Mod??4???JF?B?+????b0k??
?A7??I?????ݵ???1xE??q&׀?(?s??5??6nu?-??1?pYI???=?%?`r??ߠ?????똬1???*?E?(??ʧ0?M)?7??a?~p?,<??8??Ka=??2?K?-????%}`??2}?g,q?v?ߔ?k?>=D.L????g䆳????E???ғ???;?y-iT??*??s`i?^?+?H?D
Ķ??r}?;?Q?j??nߓ~??????1?|?ҥ?4_C??5????/?|?Ƨ?F9????]?tq;r?甥Q?&-F??4U?D_i???/?Ђ'g?!?(M?:۱SVL???Ϥ?2Nߨ?v ƥ??j3?*?? ?p4V\z???G?,꼅?l?e?+T?Ķ???????L?d0?Y?ȉ??C(???`?M??=?ÎjvL?yԾz$??o???m?\x#!??M??&???*B*???^׽?`"e.?Γ?uC`??????-?8???N?z?s???Tc?{??????rU??c?ّ4?9?0????'?_???ի?qw??sP&??j???q?o??ƍa????n???Vb?T92??jw5??X??>7R?B??')f`B7S|?r?=?&??vY?Sw {??^??9&?礛G?ٳ??J??:??!?Q??}?#??Y(??F?~?^???%u?>Ӡ???IĴ?_??I??#?Ә??9$??2?+?!??????+ֽqE&mq2??Yx????gKx?KC?48I?̵??/\?C??\[??:1?W???[?u?U??!?LIC?QVQ?L( ?#]y?g?bj????r0???sm?[^??#m#?k?[???DW1?b	d??????P?????B?B??T?P?<{?4&>G????_????????M?`????)??0?z??u{???NL?;???C??y??W?H?27VMk?4r?ǋ??"Q?,?n??b???#?{Є????a8x
????O?5hc?+??H?b?L???}?P???ڲd)?6vK?}0ag?zk?R?_Yv???s???M򠹽?=dѤ;??Ho??-??q?Z#?}sr 8,NM?#3?9???Eg
?F???$?rGG?FR1"?\m*?˱`?4??G??1!?"4?F?~???k??͉?2Q?< ????}w?#?eJ8 ?tD?f??1cY4d??o`Ǹ??g?q_?eaЗPFc&?*??C???????cs??E'????0??{ܚ??#N ??(?/????鉺?l?̸27Y03c?M;*??!?4?)h?P?7;???z?|=p???8?Ƶ?g{Mg7??h͢Ҷ??)?????e??s?g?BϘ?b?n??m2?]?-?bWR??/H????/??9p2??c}?~??{/"?C?k?m???ɚ@iLV]?Ȕ?޺?É?^?{[Q?`}?>?«#ɕ٧ц?K!?H?Jj?6WG???U??hW???????NT?x??D?H?鼃?c?q??????Y?d҂??i???;ݤPXqQ}?? d?'?pX?= ??5???1g?'??????!j_ᶖzj??̹%??ηG??--?F??-??6??Eu! ?:?5??P?r(???ݑ??W?d?`0D!6_R)?{?XaN?t?p???Tqn8W??3Q??4L<?~?=??І?ʽ?L????!?<1?!?????&?q?\~>????5???|?T???iN??lO?ƦA?V&M*j??'?6????9U[U?}?I?F7O	Ű??:%]??yf??,,?c?R?5???:??I???Bq ;??8??
Q[e?D??/?:???f?Ko???M??-Kx?h???hJ?P????}єS??\??G?ے?/t?????~?kcbk???t?@????+S???f???d{,?G;?????($???$?ռ?0?°?BK?=	|e???????? ?  ???"A?$??g2?ܚ?????Wa2h7??hiA'?۾	=7??՟????????^7A?_??!|{4~???.V??)T?H???[?h:?Z*8~?3
??-h???\G?c??8v??󿄼Js.?;?o"?&???NWSy?m{??:???C?z????N??Ư?{??JY?n?kɨ??t?Q?dj??K????p??.???o????^|?9???F+???j?\?z=?U??r?+|?	w??=?+CO?i???&g???RMsoy?r??&??$?#i/͹<o??&O.?<??R.?N?@ߨ?	??J7Qx-?7?"l??_?`?? /?U?rz?????#??C??y??????|H8?Z?ȳ??y[ݖç?Q?S?H?Al??5?>?]C?)O?b???c????e?͡_?e???AtkNa{
?E???m{?".????C&?;׻Q??j????????a??G7???+??A??n???8;?n?E,?U\??mr2y?-???????79???$?????A???2.??@???l*??T?S?xb"?	?q?|?<J~??fY??C??8????ā?J??X?[å~?0????it?9?>?\E?L?r*????=?0F?t?
m?lKMaU??3KY=???@??Ɓ??=6?RZ8?Cɿ 0??~7???}u?'c??8?ܰ}+?zR??"l?S(-p4?)-ƥ?M??&|?)m??.ru?n??{??j??????ķUS?CR?s?v>?|a?n??[
9}*???;?._?P??J???
D!$l/8H??w+(? L˞?=d??????
?Ǵ_U\F?j??o$??0o??Y?hb??#??????????\ձ@????Hz?S13???ӓ?pa?R*?*?i??c?< ???}q?mxJ????իW?a
??            x?????? ? ?            x?????? ? ?         1   x?3?4?4?442  ????P??D??X???
?8K??8?+?????              x??ZKs9?>?~E?&?#?փ??[[??=c??????RP׃[????g??:|ۘ??~_ ??f?/??L??||?@4?'??\?uc?6?GQ4?+??/?jT>?뺫7?Z￪ E?3N?߽???V?jU?(I?vF=?`:J??3+]??zf????ŷü?u?ϖ?|??.F????X??F?(????S??P?Bw???u]?D??)?'??L]?:]?[?ƹ.?B54?GqBVSW??[?a?6o???)?
??	վ?Kj??[??u?}%*?:~. oD??teW??*?Mg*?ONGXlU7?;??????[D???֦ù?g+?5?r??(?H,? ?\Xԝ?UZ]????????Ϻ19D???7?E?C???5??XTU??}1?Nmu????y???S??s?A??s??u?J
?WgG փ?Q<???S1??~r?>%3??B7ܽ껺??a?̩?ʔJFћ?Z?a?A???z?la?z?;???N??l???+??*???)??c?Hbq??s?5??:??$?h j???.?j?}t:?d??xR?j???N???l?{%?y???JÊ(?l4???;!?]??[?v??t?]?s?j'{?????`8?BLE?7????b??)????B6JN???
Qƻx?ި&H'?͑i?j??Q????#??xL??.yji?3l??W???%?MFI<?ן?Fɡ?)??Hy?z??-H?b?g?R?Ս?A?]G5?s?V???צoN????o.??~eKk,??S-=?O"M?f?d?BL???Z?L?p}?y?j??5?VK?n?!GTC?`4?zS[<???A\)?irNj?=8?.u???;???????x?)?3񠁋?i6?B ??sq?Nm??Z?oʕa?U?3?6z?l?Hw?H#??k?b0??v??jl5fb????t#&??J7??D3=w7K?_# jk??R?,?^_?
??U0?2}?6U??D??/i?z??:?1???W<?~@?GVm*??g"?<??*7???₊0^?̃YvA???V?H0?POu???~WAW}i?в3?,M?#??Ѕ?E??P6??i?;M??']?????????|1S?OL'?????}0O??F?C7FUj????Ԃ???|?????g̎W??.?!?XA????<?.?KڿR?g&7؇M???Gqe??b??`G
[?$?/"?+UnM???Tz?????EL???????`??t1b,??A? !S+T`?۲.Z??V??lğrux?s???3}?"?p?Q??,2??+?HPԄH?DX??@?+?;????n?H?d:Q??G?>? ?2??	i?aD^Y?G???,??M^??Ĉ??
1??Y?{?#?M???gĿ?? ???,???p?-LMd?/q???}?|??+C????d??J0?  ?Lh? p?gn??@;;&?b>?IV2?+???~!?0???O?p뢮8-?B?r?ء3ʒ2?]? ,?? ??:??C??????h8?[?K#?44?h?_p~ۀ??bQ+.(??????a?>?????D?	?!??Cc*hԊh?h??Vm]?3jl7#???HE?V
?xZ???n???b???^խ??K?????H????&9P%?b?P	??醺??? ?cq??>E???Te,?????.?0l{]?i?7?쓦??z???K?9$ OY????HΉ࡜dr??T(?7?T<? ???W??/(;?5l1??҆??w???C}Cs?ң?'??~ _ K???f??@?Z ?-?kY
???K"њ?zI????~+?&Bj????;(?Q-??T+?Z?"????w?[?E?
?-aD?6?L?9O?`?zƀ( ?D9??>OR??d.??A}??@?Sl2E??p?F@?CJ?t=?e,: ?_?3??v??tI?τ??
????ꦭ	?"?A????^?T???}?L
?}cTi??9?#??)=??Y?Oبb%?h????]??s????=⟵?T?ӊR	?v?/-+a?OX&Y?xXoKː)??"X?N???????ܙ?Fc?Z??͹?`Y??D?X??V??9,?
@{c?$?????I?R?7??!??`?4??||a^??z?䌛?f2??귅?D???)?˜??p>+??"?J]x?ӂI?3????J?%??Ԇ?ȣ T????ƈ"Gp
$(??????*T??`v????L????D??^???????*?qU4??̵??D?s;?B??Ȗ?R?m,?RG?Z?U?V??{????t0?m??%w??
?A??+?8?
????ZJ?)??uۉA?R?w4??,Л Whz??V????9ŲV?F,:hsl,?????֌????c1M@:]?Y?2?h???l?(
?SCX????<?a?g.I??đ 8@?s???~?E?VEʺ9??TJ%^??ܘMo?M?9lt?P??0 ֆ^H?ٮJ?~c:8??W??ψ?????@??[??B??MAV"?Ubۗ????f?±S?z#R$??3?L?????r??wӨ?ec"c??適$$??%??LFD<?U?????[?/?Y? ????u?Ɵ?????B?!? &S????G??uK???R?L\?m????2I????-@nr:???Vz,??k???????p%?oȻ??????&EO?@????̏??i??????????Z??ɀ?NW?<X??{?
p?j?~.?_6??Ӷ{]?Ԕq??C???Ph[?c?????Tz?@̺?0?x"%??`ɹ?p?1?0?4?T%????ϴ4lNyʾ?~$c????P?t})Q??ʳnVI??+S?/??a*??tEG>??????O?Oq???iR?#?)????_O?#Z?$?a?3;L??\g??ˆ6?M޿??z-?#i?`{"'|)W??H?>?ǆ??X_i??]b?KgĊɵ?脐0X}X)?ȑb??E?_??j?\2K?8N???f~?xS?>?;pK?8????e?Ɨ?O-??d?vq?eѱE???????????0?????? e??+&Ҩ:?w?,S????? ?!?;?5???m??#zw?C?t???_I???????????D?0k;?Һz??\???(6? ???
`i??N'??>????ǎ?5??<?Ԉ???`""	m^??n?E?? ???Siؼ?E6??}?k?]ն:?$nw
R)???ճf-?3??:~? ??),?^$HI?"?ǋ?Z?D?J??E??gKq?R??];?sK???]??H?An?T}??M?t6H?M???Kd΢ol??\?ܪ???j^????]?MQ/!	?%?/?K%??U?l)?Cc"g????y3?;t1?4?V%?k&?B+??I?疠???r_rV5?3???C??5?? ?&???`*???}ɰ????eM?)???Ր?l?9?WU?;S?m ? *.h1??s?߭.?S??=?R?Cej??l֟?c??Qb????W?%?@ߗ???m%t ?_R??v??સx??H,4?8"?G<dxd??q???&??j|M.?????k(??0?V
???&B??z@o4[v?9Q5߶?+????Z~?1???(??e!?+"????d????#g??[?$?E|B???x???/?EzB????~ &;?C??????0o??Y?={?s??c`??Kt?9o?9??B?f?=?	??{?G?i5?J?R??(???R9N??c?5Τ=?w#????xsIL N?`Ğ??i?mg? ?|???Ш?????I;?Ѕ????+ Ӷ???8?Z?=N?;?? >?H}?~-?????=K?NˑԘ?=?o?????}???????_?l?=??C???[???$c?0kr????????.??R????K?8?r?D??o???a?^???)?[~??2?w?4Rv4
q??ϱtk,M.?:?????bv???ζ???XdzA???;??oj??ʺ@*"o?|;0I?&?[Lwl?8?S??h?*7bw?_ =)I$?H|ρ?TG????`FV?{?9K^?????&???W? ?  "???$?#]\?pcl%8{??E?????c?"@P,S???]8&????????#?g<?;?O?? ???w7?id?id7)?;84yYn??π???i};%y???:wm0Z%?h?6?C?? ?,? ???#?.&???\?%???z???!ϗ??d??xV?7z%? ??`'?Q|?0?o:?cG$??????8(?.?]sx?1???g?$4YW?#????]cJc;??TB͝?-;?Ņ?;??<?:a??J?????%ӹ?)?.???7E???)????T??? ?U@%??qזd???(8S?ݗ Apu?AL?+-??k?@?~?H<??5&?b????p????d&Op??ea??3y?*????P??NyO??}5????qo9?%3^??>mG??K??.??O???K?{-?b?!??ʝ?????ƌ??!cy????%??ɽ^???NꡓGf?V???~mժ??,@_$????֠?C?a?;?-C-߶???0?????#?:\??	???m֟4'??O?	?????o??o???????;??[۲I?3[?A??}?3??{??ޣ	???yp?i?{"}ZV?UZ%???:???·C???G?c6?G??燑쿵?®tc^?v?8??B?eM?W[`???_??/\?&it
?4?J?BLm0e?Oe?c?????t??O!-BL???1?cs^Z@???7?wLB?E??(?8?ctXg??3!????	qgf?????4>????I???A?kq??! m?٭??H?SƧ??.??doG³????[?$????
3
g?ĦC?R??qv`???????6??K(T?????߽R?=???}????N?n??? ?O$?&\8??q?????N??'V???AAo?????????S??)?:3hLV???צ?ݴ??????^w?P-???X?G/Ω@??R?L?V ?}??!R??+??3rq{?>H#??=?,??wxc?"?/??-?k?l#?? ?E???Ԣu?29?S(O??{ͮwH??G?	???j??LK#ڬ??M#??C?5=|?6??Hr???=J??%???"A@???oL???jm???;rz?=M????ђSӘy?b?\??:|???d??d??[???i<8?l?DPi[P???9 ??5?SKf?????B᳿=c??~?؈???ƌ}???????>?L?"?`dx??JA??)??/?0??h????J/?C?KjH????K}??v?Mɓo>o?W???y???i?c?V???	i~@D??.????a??[?_n??ϔ??????f????^?g?F?1?v"???[??gt)??R=?eƲ???Z?V???o?F???4g>e???uﯨ??,?Vf?-?????Hy?Zg~V[e?i??r\?N??z??nyq?q ??T^?a??s)????w?*tS?G??B?B???F@?~??1%`t#*n5??|?k͆~?w??:?O????U??oW?         ]   x?3?4?4?4?4?tK?KI-R.,?R??%?y)?E???EE?@?|NC# ?4202?50?52V02?26??31?qQh?	?M?&??qqq ?,p           x??TK?7]?OQ'0$R?????F~pd??>d??]Iu???FYd?3??®?If?.U@Ez??????e?\??r?y?cY????W?3????|z=$?)?+??"c??Ě???(???*fᮞk'M?xN?o..l??N?z??W??z??Z)Xz(I????.yh?1gP?MCa?gfh??J????W?????aMQ?6???w?(??	?@?F?P?,?߳?j?j?E??a>??}\?????A~w?=??Z8?AN?n???I0?Š"ԅRg?:?`?m??H!V??QS???q?[?9b??? ӄ9??D?y??:/??}N???:?yo2?????x?8_?7?W}Ⱦ1.?(???F \EbJlͥ?5?Q?????ЫfHo??:???	???z?????wu˩?vM?v?ws????<h????B ??<r㠣2S?I?5?u?????=Bϝ?iB??g???0o?_???qi?~????_?V2X*???J?v{?1w+?7??bI???;?a?S?10e???sJe*?҆_܏r2?uq?V?2???\ɬ?ܗ'????B??X??P?t%&?AHl43\?RL ???m$Ԭ?5??0??9?2g|v??]?u???f?_??ܔ?[?׃????
?6Xf%?)7?@????$Sc?R?g?$??7Z?]??g?)?/O$??jޛ쟖??岸Ö9\?/?5??vK???F?6q??sk?1??v o3d??:??ԙ??"X??9L?????Oov??ߙ??A            x?3?4500?30?2??b???? (?Q     