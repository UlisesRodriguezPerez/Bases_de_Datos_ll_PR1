CREATE OR REPLACE PROCEDURE buscarvariablessistema(
P_CURSOR OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN P_CURSOR FOR
    SELECT 
		"porcentajeMejora",
		"incrementoMinimo"
		
    FROM 
        "VariablesSistema";
END;

