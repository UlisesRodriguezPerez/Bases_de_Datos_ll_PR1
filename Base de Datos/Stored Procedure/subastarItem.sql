
CREATE OR REPLACE FUNCTION subastaritem(
	idusuario integer,
	subcategoria character varying,
	descripcion character varying,
	formaentrega character varying,
	precioinicial  real,
	fechainicio  timestamp ,
	fechafinal  timestamp 
	)
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
		fechainicio,
		fechafinal
	)
	--INNER JOIN "SubCategoria" Sca ON Sca."Nombre" = subcategoria;
$BODY$;


--DELETE FROM "Subasta"
--DELETE FROM "ComentariosAClientes"
--DELETE FROM "ComentariosAVendedores"
--DELETE FROM "Pujas"


