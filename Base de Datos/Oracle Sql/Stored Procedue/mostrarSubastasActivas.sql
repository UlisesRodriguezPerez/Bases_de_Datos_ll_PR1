CREATE OR REPLACE PROCEDURE mostrarsubastasactivas(
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
                UC."Alias", --Comprador
                UV."Alias" ,--vendedor
                Ca."Nombre" ,--categoria
                Sca."Nombre", --SubCategoria
                S."Descripcion",
                S."FormaEntrega",
                S."PrecioInicial",
                S."FechaInicio",
                S."FechaFinal",
                Pu."Incremento",
                Pu."PrecioFinal"
        
        FROM 
            "Subasta"  S
        INNER JOIN "Usuarios" UV ON UV."Cedula" = S."IdVendedor"
        INNER JOIN "SubCategoria"  Sca ON Sca."IdSubCategoria" = S."IdSubCategoria"
        INNER JOIN "Categoria"  Ca ON Ca."IdCategoria" = Sca."IdCategoria"
        INNER JOIN "Usuarios"  UC ON UC."Cedula" = S."IdComprador"
        INNER JOIN "Pujas" Pu ON Pu."IdSubasta" = S."IdSubasta"
        
        WHERE
            current_date >= S."FechaInicio" AND current_date <= S."FechaFinal" AND Pu."PujaMasAlta" = 1
        ORDER BY S."FechaFinal" ASC;
END;