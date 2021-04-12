CREATE OR REPLACE FUNCTION validarusuario(
		pcedula integer,
		ppassword varchar
	)
    RETURNS "Usuarios"
    LANGUAGE 'sql'

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
		"EsAdmin"
FROM 
	"Usuarios"
WHERE
	pcedula = "Cedula" AND ppassword = "Password"
$BODY$;

SELECT * FROM "Usuarios"