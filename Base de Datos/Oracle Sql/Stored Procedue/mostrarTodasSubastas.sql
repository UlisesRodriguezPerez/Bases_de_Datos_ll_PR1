CREATE OR REPLACE PROCEDURE mostrartodassubastas(
P_CURSOR OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN P_CURSOR FOR
        SELECT 
                S."IdSubasta", 
                UV."Cedula", 
                UC."Cedula", 
                Sca."IdSubCategoria", 
                Ca."IdCategoria", 
                UC."Nombre", --Comprador
                UV."Nombre" ,--vendedor
                Ca."Nombre" ,--categoria
                Sca."Nombre", --SubCategoria
                S."Descripcion",
                S."FormaEntrega",
                S."PrecioInicial",
                S."FechaInicio",
                S."FechaFinal"
                
        FROM 
            "Subasta"  S
        INNER JOIN "Usuarios" UV ON UV."Cedula" = S."IdVendedor"
        INNER JOIN "SubCategoria"  Sca ON Sca."IdSubCategoria" = S."IdSubCategoria"
        INNER JOIN "Categoria"  Ca ON Ca."IdCategoria" = Sca."IdCategoria"
        INNER JOIN "Usuarios"  UC ON UC."Cedula" = S."IdComprador"
        ORDER BY S."FechaFinal";
END;