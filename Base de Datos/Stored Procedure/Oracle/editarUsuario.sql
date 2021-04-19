-- FUNCTION: public.editarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, boolean)

-- DROP FUNCTION public.editarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, boolean);

CREATE OR REPLACE PROCEDURE editarusuario(
	pcedula integer,
	pnombre character varying,
	pprimerapellido character varying,
	psegundoapellido character varying,
	palias character varying,
	pcorreo character varying,
	ppassword character varying,
	pcuantossubastados integer,
	pcuantoscomprados integer,
	ptipousuario boolean,
	ptelefonocelular varchar,
	ptelefonocasa varchar,
	ptelefonotrabajo varchar)
    AS
    BEGIN
        UPDATE 
            Usuarios
    SET
            Cedula = pCedula,
            Nombre = pNombre,
            PrimerApellido = pPrimerApellido,
            SegundoApellido = pSegundoApellido,
            "Alias" = pAlias,
            Correo = pCorreo,
            "Password" = pPassword,
            CuantosSubastados = pCuantosSubastados,
            CuantosComprados = pCuantosComprados,
            EsAdmin = pTipoUsuario,
            TelefonoCelular = pTelefonoCelular,
            TelefonoCasa = pTelefonoCasa,
            TelefonoTrabajo = pTelefonoTrabajo
    WHERE
        pCedula = Cedula;
    END;
    
--$BODY$;

--ALTER FUNCTION public.editarusuario(integer, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, boolean, varchar, varchar, varchar)
--    OWNER TO postgres;
