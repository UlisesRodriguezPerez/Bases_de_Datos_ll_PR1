-- FUNCTION: public.mostrarcategorias()

-- DROP FUNCTION public.mostrarcategorias();

CREATE OR REPLACE FUNCTION public.mostrarcategorias(
	)
    RETURNS TABLE(idcategoria bigint, nombrecategoria character varying) 
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
SELECT 
		Ca."IdCategoria",
		Ca."Nombre"
FROM 
	"Categoria"  Ca
$BODY$;

ALTER FUNCTION public.mostrarcategorias()
    OWNER TO postgres;

--SELECT mostrarcategorias()