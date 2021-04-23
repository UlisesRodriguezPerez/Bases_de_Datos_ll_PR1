-- FUNCTION: public.buscarusuario(integer)

-- DROP FUNCTION public.buscarusuario(integer);

CREATE OR REPLACE FUNCTION buscarusuario(
	pid integer)
    RETURN Usuarios
    /*
    LANGUAGE sql
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
*/
SELECT 
		Cedula,
		Nombre,
		PrimerApellido,
		SegundoApellido,
		"Alias",
		Correo,
		"Password",
		CuantosSubastados,
		CuantosComprados,
		EsAdmin,
		TelefonoCelular,
		TelefonoCasa,
		TelefonoTrabajo
		
FROM 
	Usuarios
WHERE
	pId = Cedula
$BODY$;

ALTER FUNCTION public.buscarusuario(integer)
    OWNER TO postgres;
