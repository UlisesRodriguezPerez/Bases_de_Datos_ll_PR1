-- FUNCTION: public.validarusuario(integer, character varying)

-- DROP FUNCTION public.validarusuario(integer, character varying);

CREATE OR REPLACE FUNCTION validarusuario(
	pcedula integer,
	ppassword character varying)
    RETURN Usuarios
    --LANGUAGE 'sql'
    --COST 100
    --VOLATILE PARALLEL UNSAFE
--AS $BODY$
AS BEGIN
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
	pcedula = Cedula AND ppassword = Password
    END;
END;
--$BODY$;

ALTER FUNCTION public.validarusuario(integer, character varying)
    OWNER TO postgres;
