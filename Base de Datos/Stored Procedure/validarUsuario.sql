-- FUNCTION: public.validarusuario(integer, character varying)

-- DROP FUNCTION public.validarusuario(integer, character varying);

CREATE OR REPLACE FUNCTION public.validarusuario(
	pcedula integer,
	ppassword character varying)
    RETURNS "Usuarios"
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
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
FROM 
	"Usuarios"
WHERE
	pcedula = "Cedula" AND ppassword = "Password"
$BODY$;

ALTER FUNCTION public.validarusuario(integer, character varying)
    OWNER TO postgres;
