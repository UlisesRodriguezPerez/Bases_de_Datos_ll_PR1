CREATE OR REPLACE PROCEDURE editarusuario(
	pcedula IN "Usuarios"."Cedula"%TYPE,
	pnombre IN "Usuarios"."Nombre"%TYPE,
	pprimerapellido IN "Usuarios"."PrimerApellido"%TYPE,
	psegundoapellido IN "Usuarios"."SegundoApellido"%TYPE,
	palias IN "Usuarios"."Alias"%TYPE,
	pcorreo IN "Usuarios"."Correo"%TYPE,
    ppassword IN "Usuarios"."Password"%TYPE,
    pcuantossubastados IN "Usuarios"."CuantosSubastados"%TYPE,
    pcuantoscomprados IN "Usuarios"."CuantosComprados"%TYPE,
	ptipousuario IN "Usuarios"."EsAdmin"%TYPE,
	ptelefonocelular IN "Usuarios"."TelefonoCelular"%TYPE,
	ptelefonocasa IN "Usuarios"."TelefonoCasa"%TYPE,
	ptelefonotrabajo IN "Usuarios"."TelefonoTrabajo"%TYPE,
    P_RESULT OUT VARCHAR2
)
AS
BEGIN
    UPDATE "Usuarios"
    SET
        "Cedula" = pCedula,
        "Nombre" = pNombre,
        "PrimerApellido" = pPrimerApellido,
        "SegundoApellido" = pSegundoApellido,
        "Alias" = pAlias,
        "Correo" = pCorreo,
        "Password" = pPassword,
        "CuantosSubastados" = pcuantossubastados,
        "CuantosComprados" = pcuantoscomprados,
        "EsAdmin" = pTipoUsuario,
        "TelefonoCelular" = pTelefonoCelular,
        "TelefonoCasa" = pTelefonoCasa,
        "TelefonoTrabajo" = pTelefonoTrabajo
    WHERE
        "Cedula" = pcedula;

    P_RESULT := 'SE EJECUTO CORRECTAMENTE.';
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
        P_RESULT := 'Error al Actualizar usuario.';
        ROLLBACK;
    
    END;

