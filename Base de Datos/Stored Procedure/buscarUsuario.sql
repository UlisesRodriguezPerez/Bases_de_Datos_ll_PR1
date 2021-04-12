CREATE OR REPLACE FUNCTION buscarUsuario(pId integer)
    RETURNS "Usuarios"--TABLE(cedula bigint, nombre character varying, primerapellido character varying, segundoapellido character varying, aliass character varying, correo character varying, password character varying, cuantossubastados integer, cuantoscomprados integer, esadmin boolean) 
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
	pId = "Cedula";
	
$BODY$;

SELECT buscarUsuario(1)