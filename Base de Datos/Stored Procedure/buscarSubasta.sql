

CREATE OR REPLACE FUNCTION public.buscarsubasta(
	pidsubasta integer)
    RETURNS integer
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
SELECT 
		"IdSubasta"
		
FROM 
	"Subasta"
WHERE
	pidsubasta = "IdSubasta"
$BODY$;


