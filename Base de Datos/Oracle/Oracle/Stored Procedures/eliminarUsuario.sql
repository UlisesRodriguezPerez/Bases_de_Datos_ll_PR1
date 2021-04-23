
CREATE OR REPLACE PROCEDURE eliminarusuario(
	pid integer)
    AS
    BEGIN
        DELETE FROM TABLE "Usuarios"
        WHERE
            pid = Cedula

