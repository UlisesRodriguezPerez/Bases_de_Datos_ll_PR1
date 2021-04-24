CREATE OR REPLACE PROCEDURE editarvariablessistema(
	porcentajemejora IN number,
	preciominimo IN numeric
    --P_RESULT OUT VARCHAR2
)
AS
BEGIN
    UPDATE 
        "VariablesSistema"
    SET
        "porcentajeMejora" = porcentajemejora,
        "incrementoMinimo" = preciominimo;

   /* P_RESULT := 'SE EJECUTO CORRECTAMENTE.';
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
        P_RESULT := 'Error al Actualizar Variables del sistema.';
        ROLLBACK;*/
    
END;

--CALL editarvariablessistema (5,5000);
