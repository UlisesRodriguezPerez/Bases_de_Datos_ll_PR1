CREATE OR REPLACE PROCEDURE validarusuario(
palias IN VARCHAR2,
ppassword IN VARCHAR2,
P_CURSOR OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN P_CURSOR FOR
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
            palias = "Alias" AND ppassword = "Password";
END;

--SELECT validarusuario('1','1')
--DELETE FROM "Usuarios"