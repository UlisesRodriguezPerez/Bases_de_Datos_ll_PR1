-- FUNCTION: public.mostrarusuarios()

-- DROP FUNCTION public.mostrarusuarios();

CREATE OR REPLACE FUNCTION public.mostrarusuarios(
	)
    RETURNS TABLE(cedula bigint, nombre character varying, primerapellido character varying, segundoapellido character varying, aliass character varying, correo character varying, password character varying, cuantossubastados integer, cuantoscomprados integer, esadmin boolean, telefonocelular character varying, telefonocasa character varying, telefonotrabajo character varying) 
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
SELECT 
		"Cedula",
		"Nombre",
		"PrimerApellido",
		"SegundoApellido",
		"Alias",
		"Correo",
		"Password",
		"CuantosSubastados",
		"CuantosComprados",
		"EsAdmin",
		"TelefonoCelular",
		"TelefonoCasa",
		"TelefonoTrabajo"
	FROM "Usuarios"
WHERE "Cedula" <> 0;
$BODY$;

ALTER FUNCTION public.mostrarusuarios()
    OWNER TO postgres;
