-- FUNCTION: public.insertarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, boolean)

-- DROP FUNCTION public.insertarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, boolean);

CREATE OR REPLACE FUNCTION public.insertarusuario(
	pcedula integer,
	pnombre character varying,
	pprimerapellido character varying,
	psegundoapellido character varying,
	palias character varying,
	pcorreo character varying,
	ppassword character varying,
	ptipousuario boolean,
	ptelefonocelular varchar,
	ptelefonocasa varchar,
	ptelefonotrabajo varchar
)
    RETURNS void
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
INSERT INTO "Usuarios"(
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
	
	)
	VALUES(
		pCedula,
		pNombre,
		pPrimerApellido,
		pSegundoApellido,
		pAlias,
		pCorreo,
		pPassword,
		0,
		0,
		pTipoUsuario,
		pTelefonoCelular,
		pTelefonoCasa,
		pTelefonoTrabajo
	);
$BODY$;

--ALTER FUNCTION public.insertarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, boolean)
  --  OWNER TO postgres;
