-- FUNCTION: public.mostrarsubastasactivas()

-- DROP FUNCTION public.mostrarsubastasactivas();

CREATE OR REPLACE FUNCTION mostrarsubastasactivas 
    RETURN TABLE(idsubasta bigint, idvendedor bigint, idcomprador bigint, idsubcategoria bigint, idcategoria bigint, nombrecomprador character varying, nombrevendedor character varying, nombrecategoria character varying, nombresubcategoria character varying, descripcion character varying, formaentrega character varying, precioinicial real, fechainicio date, fechafinal date) 

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
$BODY$;

ALTER FUNCTION public.mostrarsubastasactivas()
    OWNER TO postgres;
