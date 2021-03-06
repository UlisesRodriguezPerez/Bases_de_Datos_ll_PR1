PGDMP     %    -                y            Bases2_Prueba    13.2    13.2 F               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16411    Bases2_Prueba    DATABASE     p   CREATE DATABASE "Bases2_Prueba" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Costa Rica.1252';
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
       public          postgres    false    200            ?            1255    24923    buscarvariablessistema()    FUNCTION     ?   CREATE FUNCTION public.buscarvariablessistema() RETURNS TABLE(porcentajemejora integer, incrementominimo numeric)
    LANGUAGE sql
    AS $$
SELECT 
		"porcentajeMejora",
		"incrementoMinimo"
		
FROM 
	"VariablesSistema"
$$;
 /   DROP FUNCTION public.buscarvariablessistema();
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
       public          postgres    false            ?            1255    24924 (   editarvariablessistema(integer, numeric)    FUNCTION     ?   CREATE FUNCTION public.editarvariablessistema(porcentajemejora integer, preciominimo numeric) RETURNS void
    LANGUAGE sql
    AS $$
UPDATE 
	"VariablesSistema"
SET
		"porcentajeMejora" = porcentajemejora,
		"incrementoMinimo" = preciominimo
$$;
 ]   DROP FUNCTION public.editarvariablessistema(porcentajemejora integer, preciominimo numeric);
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
       public          postgres    false            ?            1255    24935    mostrarcategorias()    FUNCTION     ?   CREATE FUNCTION public.mostrarcategorias() RETURNS TABLE(idcategoria bigint, nombrecategoria character varying)
    LANGUAGE sql
    AS $$

SELECT 
		Ca."IdCategoria",
		Ca."Nombre"
FROM 
	"Categoria"  Ca
$$;
 *   DROP FUNCTION public.mostrarcategorias();
       public          postgres    false            ?            1255    24925    mostrarcompradas(integer)    FUNCTION     ?  CREATE FUNCTION public.mostrarcompradas(pcedula integer) RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone)
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
       public          postgres    false            ?            1255    24926    mostrarhistorialpujas(integer)    FUNCTION     ?  CREATE FUNCTION public.mostrarhistorialpujas(idsubasta integer) RETURNS TABLE(nombre character varying, alias character varying, incremento numeric, preciofinal numeric, fechasubida timestamp without time zone)
    LANGUAGE sql
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
       public          postgres    false            ?            1255    24851    mostrarinfocomprador(integer)    FUNCTION     5  CREATE FUNCTION public.mostrarinfocomprador(pcedula integer) RETURNS TABLE(nombrecomprador character varying, nombrevendedor character varying, comentario character varying, puntaje integer)
    LANGUAGE sql
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
       public          postgres    false            ?            1255    24927    mostrarsubastadas(integer)    FUNCTION     ?  CREATE FUNCTION public.mostrarsubastadas(pcedula integer) RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone)
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
       public          postgres    false            ?            1255    24934    mostrarsubastasactivas()    FUNCTION     '  CREATE FUNCTION public.mostrarsubastasactivas() RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone, incremento numeric, montofinal numeric)
    LANGUAGE sql
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
	current_date >= S."FechaInicio" AND current_date <= S."FechaFinal" AND Pu."PujaMasAlta" = true
ORDER BY S."FechaFinal";
$_$;
 /   DROP FUNCTION public.mostrarsubastasactivas();
       public          postgres    false            ?            1255    24930    mostrarsubastasvencidas()    FUNCTION       CREATE FUNCTION public.mostrarsubastasvencidas() RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone, incremento numeric, montofinal numeric)
    LANGUAGE sql
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
       public          postgres    false            ?            1255    24939    mostrarsubcategorias(integer)    FUNCTION     ?  CREATE FUNCTION public.mostrarsubcategorias(idcategoria integer) RETURNS TABLE(idcategoria bigint, idsubcategoria integer, nombrecategoria character varying, nombresubcategoria character varying)
    LANGUAGE sql
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
       public          postgres    false            ?            1255    24931    mostrartodassubastas()    FUNCTION     ?  CREATE FUNCTION public.mostrartodassubastas() RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone)
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
WHERE "Cedula" <> 0;
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
       public          postgres    false            ?            1255    24932     pujar(integer, integer, numeric)    FUNCTION     ?  CREATE FUNCTION public.pujar(idsubasta integer, idusuariopujador integer, incremento numeric) RETURNS void
    LANGUAGE plpgsql
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
		current_date,
		true
	);
END;
$$;
 ]   DROP FUNCTION public.pujar(idsubasta integer, idusuariopujador integer, incremento numeric);
       public          postgres    false            ?            1255    24933 ?   subastaritem(integer, character varying, character varying, character varying, numeric, timestamp without time zone, timestamp without time zone)    FUNCTION       CREATE FUNCTION public.subastaritem(idusuario integer, subcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone) RETURNS void
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
	--SELECT "IdSubasta" FROM "Subasta"  ORDER BY "IdSubasta" DESC limit 1
	--INNER JOIN "SubCategoria" Sca ON Sca."Nombre" = subcategoria;
$$;
 ?   DROP FUNCTION public.subastaritem(idusuario integer, subcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone);
       public          postgres    false            ?            1255    24858    trigger_actualizar_pujas()    FUNCTION     ?  CREATE FUNCTION public.trigger_actualizar_pujas() RETURNS trigger
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
       public         heap    postgres    false                       0    24670 	   Categoria 
   TABLE DATA           >   COPY public."Categoria" ("IdCategoria", "Nombre") FROM stdin;
    public          postgres    false    206   R?       ?          0    24648    ComentariosAClientes 
   TABLE DATA           Y   COPY public."ComentariosAClientes" ("idSubasta", "Comentario", "Evaluacion") FROM stdin;
    public          postgres    false    202   ??       ?          0    24654    ComentariosAVendedores 
   TABLE DATA           [   COPY public."ComentariosAVendedores" ("IdSubasta", "Comentario", "Evaluacion") FROM stdin;
    public          postgres    false    203   ٙ       ?          0    24665    Pujas 
   TABLE DATA           ?   COPY public."Pujas" ("IdPuja", "IdSubasta", "IdUsuario", "Incremento", "PrecioFinal", "FechaSubida", "PujaMasAlta") FROM stdin;
    public          postgres    false    205    ?                 0    24675    SubCategoria 
   TABLE DATA           S   COPY public."SubCategoria" ("IdSubCategoria", "IdCategoria", "Nombre") FROM stdin;
    public          postgres    false    207   Λ       ?          0    24660    Subasta 
   TABLE DATA           ?   COPY public."Subasta" ("IdSubasta", "IdVendedor", "IdComprador", "IdSubCategoria", "Descripcion", "FormaEntrega", "PrecioInicial", "FechaInicio", "FechaFinal") FROM stdin;
    public          postgres    false    204   ?       ?          0    16412    Usuarios 
   TABLE DATA           ?   COPY public."Usuarios" ("Cedula", "Nombre", "PrimerApellido", "SegundoApellido", "Alias", "Correo", "Password", "CuantosSubastados", "CuantosComprados", "EsAdmin", "TelefonoCelular", "TelefonoCasa", "TelefonoTrabajo") FROM stdin;
    public          postgres    false    200   I?       ?          0    24645    VariablesSistema 
   TABLE DATA           T   COPY public."VariablesSistema" ("porcentajeMejora", "incrementoMinimo") FROM stdin;
    public          postgres    false    201   h?                  0    0    Categoria_IdCategoria_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Categoria_IdCategoria_seq"', 1, true);
          public          postgres    false    208                       0    0    Pujas_IdPuja_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Pujas_IdPuja_seq"', 116, true);
          public          postgres    false    209                       0    0    SubCategoria_IdSubCategoria_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."SubCategoria_IdSubCategoria_seq"', 1, true);
          public          postgres    false    210                       0    0    Subasta_IdSubasta_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Subasta_IdSubasta_seq"', 30, true);
          public          postgres    false    211            k           2606    24674    Categoria Categoria_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Categoria"
    ADD CONSTRAINT "Categoria_pkey" PRIMARY KEY ("IdCategoria");
 F   ALTER TABLE ONLY public."Categoria" DROP CONSTRAINT "Categoria_pkey";
       public            postgres    false    206            i           2606    24669    Pujas Pujas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Pujas"
    ADD CONSTRAINT "Pujas_pkey" PRIMARY KEY ("IdPuja");
 >   ALTER TABLE ONLY public."Pujas" DROP CONSTRAINT "Pujas_pkey";
       public            postgres    false    205            m           2606    24679    SubCategoria SubCategoria_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."SubCategoria"
    ADD CONSTRAINT "SubCategoria_pkey" PRIMARY KEY ("IdSubCategoria");
 L   ALTER TABLE ONLY public."SubCategoria" DROP CONSTRAINT "SubCategoria_pkey";
       public            postgres    false    207            g           2606    24664    Subasta Subasta_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Subasta"
    ADD CONSTRAINT "Subasta_pkey" PRIMARY KEY ("IdSubasta");
 B   ALTER TABLE ONLY public."Subasta" DROP CONSTRAINT "Subasta_pkey";
       public            postgres    false    204            e           2606    16416    Usuarios Usuarios_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "Usuarios_pkey" PRIMARY KEY ("Cedula");
 D   ALTER TABLE ONLY public."Usuarios" DROP CONSTRAINT "Usuarios_pkey";
       public            postgres    false    200            v           2620    24833    Subasta crearpuja    TRIGGER        CREATE TRIGGER crearpuja AFTER INSERT ON public."Subasta" FOR EACH STATEMENT EXECUTE FUNCTION public.trigger_subastas_pujas();
 ,   DROP TRIGGER crearpuja ON public."Subasta";
       public          postgres    false    239    204            w           2620    24859    Pujas nuevapuja    TRIGGER        CREATE TRIGGER nuevapuja AFTER INSERT ON public."Pujas" FOR EACH STATEMENT EXECUTE FUNCTION public.trigger_actualizar_pujas();
 *   DROP TRIGGER nuevapuja ON public."Pujas";
       public          postgres    false    242    205            t           2606    24703    Pujas Pujas_IdUsuario_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Pujas"
    ADD CONSTRAINT "Pujas_IdUsuario_fkey" FOREIGN KEY ("IdUsuario") REFERENCES public."Usuarios"("Cedula");
 H   ALTER TABLE ONLY public."Pujas" DROP CONSTRAINT "Pujas_IdUsuario_fkey";
       public          postgres    false    205    200    2917            u           2606    24723 *   SubCategoria SubCategoria_IdCategoria_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."SubCategoria"
    ADD CONSTRAINT "SubCategoria_IdCategoria_fkey" FOREIGN KEY ("IdCategoria") REFERENCES public."Categoria"("IdCategoria");
 X   ALTER TABLE ONLY public."SubCategoria" DROP CONSTRAINT "SubCategoria_IdCategoria_fkey";
       public          postgres    false    2923    207    206            q           2606    24713     Subasta Subasta_IdComprador_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Subasta"
    ADD CONSTRAINT "Subasta_IdComprador_fkey" FOREIGN KEY ("IdComprador") REFERENCES public."Usuarios"("Cedula");
 N   ALTER TABLE ONLY public."Subasta" DROP CONSTRAINT "Subasta_IdComprador_fkey";
       public          postgres    false    200    2917    204            r           2606    24718 #   Subasta Subasta_IdSubCategoria_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Subasta"
    ADD CONSTRAINT "Subasta_IdSubCategoria_fkey" FOREIGN KEY ("IdSubCategoria") REFERENCES public."SubCategoria"("IdSubCategoria");
 Q   ALTER TABLE ONLY public."Subasta" DROP CONSTRAINT "Subasta_IdSubCategoria_fkey";
       public          postgres    false    204    207    2925            p           2606    24708    Subasta Subasta_IdVendedor_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Subasta"
    ADD CONSTRAINT "Subasta_IdVendedor_fkey" FOREIGN KEY ("IdVendedor") REFERENCES public."Usuarios"("Cedula");
 M   ALTER TABLE ONLY public."Subasta" DROP CONSTRAINT "Subasta_IdVendedor_fkey";
       public          postgres    false    204    2917    200            n           2606    24688    ComentariosAClientes fktest    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ComentariosAClientes"
    ADD CONSTRAINT fktest FOREIGN KEY ("idSubasta") REFERENCES public."Subasta"("IdSubasta");
 G   ALTER TABLE ONLY public."ComentariosAClientes" DROP CONSTRAINT fktest;
       public          postgres    false    202    2919    204            o           2606    24693    ComentariosAVendedores fktest    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ComentariosAVendedores"
    ADD CONSTRAINT fktest FOREIGN KEY ("IdSubasta") REFERENCES public."Subasta"("IdSubasta");
 I   ALTER TABLE ONLY public."ComentariosAVendedores" DROP CONSTRAINT fktest;
       public          postgres    false    203    2919    204            s           2606    24698    Pujas fktest    FK CONSTRAINT     ~   ALTER TABLE ONLY public."Pujas"
    ADD CONSTRAINT fktest FOREIGN KEY ("IdSubasta") REFERENCES public."Subasta"("IdSubasta");
 8   ALTER TABLE ONLY public."Pujas" DROP CONSTRAINT fktest;
       public          postgres    false    205    204    2919                "   x?3?(??M-JTpN,IM?/:?6?+F??? xAs      ?   E   x?3??t??u?q??WpqU
uur?4?2?'a+????9r?b?`?1"B???1??H0F??? ?*t      ?   7   x???t-.IUH-V(?SH??M?+I,??WHIU((*MMJ??4?? ?Ȃ+F??? =?      ?   ?  x?}?Yn?@D?[??po2g?wN????Ӳ-??? 3x,??(uJx?;!?7?7?_D^???H??8rpf??t*~C\??????f???"Qo?|p-???P?\?;??EnJ8'?Y?Չ?N?+???.c??h?&|?$_-7?~,??'????꨺Q-ǫ?_ ~=?|%5?Bʣ?m?U+|5P??m?r???TA?I???/???=\??????]A?'??+?i)~???s?????3???ͻ?(???+????????a?KܦL?"???]??nD̒?&b>??)J???KW?Iᒘ[-;ZK?bY
??%?P??M??IA??yh??x|?A7],kBe?̐V?[?$ԫ?Ğ?A?V?wI?լZ???ꖔ?ӊ?楔xȣ?#k?	?}??樫;?????? Hn?         (   x?3?4?(??M-JT.MRpN,IM?/:?6?+F??? ?U	?      ?   3  x????n? ????@+C !??? ??uU??q?K?~%?P??f????4? ??????4?ðZs87Wv??u???z?????nK^ĳ?"  ?䆗`7?%V=b??BIeU??(G?=Ky?s????(??G:җXE?v??%¾dK:{?W?t??L&	??B?TzS?c5?rjK?zD8ċ???7?8GY)?\??W?#?Rž?g?){?ы?NO?????w1?3??ڿ(?H?R?m;??ayWe?O???Y2??????U??#n_?SO???)?껂`\??{??-??RF??      ?     x??P=o? ??_?_??Q?=K?,?RK?m?z迯??X?????x??p	??Q%p?\?w?X??=?!ծ???.??\B?j???8???Ꝿ???1j??/E???7???"?g?W}?????ou?G|*?q?\b}`??j8???&4???9??Kl??	?
?26!&eR7'(w???sEK2?5l???cE_3??9zP7léΌ???l??l??Bu?I??B?M??q????????W$???Oܸ?????xCh??????1?R?	      ?      x?34?4500?????? ?     