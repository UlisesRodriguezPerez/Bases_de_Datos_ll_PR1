CREATE OR REPLACE PROCEDURE mostrarhistorialpujas(
idsubasta IN number,
P_CURSOR OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN P_CURSOR FOR
        SELECT 
		U."Nombre",
		U."Alias",
		Pu."Incremento",
		Pu."PrecioFinal",
		Pu."FechaSubida"

        FROM 
            "Pujas" Pu
        INNER JOIN "Usuarios" U ON U."Cedula" = PU."IdUsuario"
        WHERE Pu."IdSubasta" = idsubasta AND U."Cedula" != 0
        ORDER BY Pu."IdPuja" DESC;
END;