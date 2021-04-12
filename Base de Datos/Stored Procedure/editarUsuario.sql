-- FUNCTION: public.editarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, boolean)

-- DROP FUNCTION public.editarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, boolean);

CREATE OR REPLACE FUNCTION public.editarusuario(
	pcedula integer,
	pnombre character varying,
	pprimerapellido character varying,
	psegundoapellido character varying,
	palias character varying,
	pcorreo character varying,
	ppassword character varying,
	pcuantossubastados integer,
	pcuantoscomprados integer,
	ptipousuario boolean)
    RETURNS void
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
UPDATE 
	"Usuarios"
SET
		"Cedula" = pCedula,
		"Nombre" = pNombre,
		"PrimerApellido" = pPrimerApellido,
		"SegundoApellido" = pSegundoApellido,
		"Alias" = pAlias,
		"Correo" = pCorreo,
		"Password" = pPassword,
		"CuantosSubastados" = pCuantosSubastados,
		"CuantosComprados" = pCuantosComprados,
		"EsAdmin" = pTipoUsuario
WHERE
	pCedula = "Cedula";
$BODY$;

--ALTER FUNCTION public.editarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, boolean)
  --  OWNER TO postgres;
