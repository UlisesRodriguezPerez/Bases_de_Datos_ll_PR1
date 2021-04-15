
CREATE OR REPLACE FUNCTION eliminarusuario(
	pid integer)
    RETURNS void
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DELETE FROM "Usuarios"
WHERE
	pId = "Cedula"
$BODY$;

