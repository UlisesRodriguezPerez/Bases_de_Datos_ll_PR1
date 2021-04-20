-- FUNCTION: public.subastaritem(integer, character varying, character varying, character varying, real, character varying, character varying)

-- DROP FUNCTION public.subastaritem(integer, character varying, character varying, character varying, real, character varying, character varying);

CREATE OR REPLACE FUNCTION public.subastaritem(
	idusuario integer,
	subcategoria character varying,
	descripcion character varying,
	formaentrega character varying,
	precioinicial real,
	fechainicio character varying,
	fechafinal character varying)
    RETURNS void
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
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
	--SELECT "IdSubasta" FROM "Subasta"  ORDER BY "IdSubasta" DESC limit 1
	--INNER JOIN "SubCategoria" Sca ON Sca."Nombre" = subcategoria;
$BODY$;

ALTER FUNCTION public.subastaritem(integer, character varying, character varying, character varying, real, character varying, character varying)
    OWNER TO postgres;
