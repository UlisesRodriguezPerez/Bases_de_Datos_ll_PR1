CREATE OR REPLACE PROCEDURE mostrarcategorias(
P_CURSOR OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN P_CURSOR FOR
        SELECT 
                Ca."IdCategoria",
                Ca."Nombre"
        FROM 
            "Categoria"  Ca;
END;


