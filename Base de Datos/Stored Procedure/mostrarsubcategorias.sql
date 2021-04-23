-- FUNCTION: public.mostrarsubcategorias(integer)

-- DROP FUNCTION public.mostrarsubcategorias(integer);

CREATE OR REPLACE FUNCTION public.mostrarsubcategorias(
	idcategoria integer)
    RETURNS TABLE(idcategoria bigint, idsubcategoria integer, nombrecategoria character varying, nombresubcategoria character varying) 
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
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
$BODY$;

ALTER FUNCTION public.mostrarsubcategorias(integer)
    OWNER TO postgres;
--SELECT mostrarsubcategorias(1)