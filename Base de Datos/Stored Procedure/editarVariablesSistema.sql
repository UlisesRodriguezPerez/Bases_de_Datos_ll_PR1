
CREATE OR REPLACE FUNCTION public.editarVariablesSistema(
	porcentajemejora integer,
	preciominimo real)
    RETURNS void
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
UPDATE 
	"VariablesSistema"
SET
		"porcentajeMejora" = porcentajemejora,
		"incrementoMinimo" = preciominimo

$BODY$;

