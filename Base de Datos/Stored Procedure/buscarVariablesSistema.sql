
CREATE OR REPLACE FUNCTION public.buscarVariablesSistema()
    RETURNS TABLE(porcentajemejora integer, incrementominimo real)
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
SELECT 
		"porcentajeMejora",
		"incrementoMinimo"
		
FROM 
	"VariablesSistema"



$BODY$