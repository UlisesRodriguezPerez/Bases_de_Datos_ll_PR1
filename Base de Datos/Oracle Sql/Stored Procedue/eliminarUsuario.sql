CREATE OR REPLACE PROCEDURE eliminarusuario(
    pid IN "Usuarios"."Cedula"%TYPE
   -- P_RESULT OUT VARCHAR2
)
AS
BEGIN
    DELETE FROM 
        "Usuarios"
    WHERE
        "Cedula" = pid;
    /*P_RESULT := 'SE EJECUTO CORRECTAMENTE';
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            P_RESULT := 'Error al eliminar Usuario';
            ROLLBACK;*/
END;