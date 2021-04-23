-- FUNCTION: public.mostrarsubastasactivas()

-- DROP FUNCTION public.mostrarsubastasactivas();

CREATE OR REPLACE FUNCTION public.mostrarsubastasactivassubcategorias(
	idsubcategoria integer
	)
    RETURNS TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial numeric, fechainicio timestamp without time zone, fechafinal timestamp without time zone, incremento numeric, montofinal numeric) 
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$

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
$BODY$;
