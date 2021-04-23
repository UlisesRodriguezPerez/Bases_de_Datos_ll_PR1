CREATE OR REPLACE PROCEDURE validarusuario(
pcedula IN number,
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
            pcedula = "Cedula" AND ppassword = "Password";
END;