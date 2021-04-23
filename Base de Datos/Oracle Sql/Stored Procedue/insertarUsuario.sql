CREATE OR REPLACE PROCEDURE insertarusuario(
	pcedula IN "Usuarios"."Cedula"%TYPE,
	pnombre IN "Usuarios"."Nombre"%TYPE,
	pprimerapellido IN "Usuarios"."PrimerApellido"%TYPE,
	psegundoapellido IN "Usuarios"."SegundoApellido"%TYPE,
	palias IN "Usuarios"."Alias"%TYPE,
	pcorreo IN "Usuarios"."Correo"%TYPE,
	ppassword IN "Usuarios"."Password"%TYPE,
	ptipousuario IN "Usuarios"."EsAdmin"%TYPE,
	ptelefonocelular IN "Usuarios"."TelefonoCelular"%TYPE,
	ptelefonocasa IN "Usuarios"."TelefonoCasa"%TYPE,
	ptelefonotrabajo IN "Usuarios"."TelefonoTrabajo"%TYPE,
    P_RESULT OUT VARCHAR2
)
AS
BEGIN
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
    P_RESULT := 'SE EJECUTO CORRECTAMENTE.';
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
        P_RESULT := 'Error al insertar usuario.';
        ROLLBACK;
    
    END;
