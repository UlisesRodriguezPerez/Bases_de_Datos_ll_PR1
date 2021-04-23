CREATE OR REPLACE PROCEDURE mostrarinfocomprador(
pcedula IN number,
P_CURSOR OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN P_CURSOR FOR
        SELECT 
                UC."Nombre", --Comprador
                UV."Nombre" ,--vendedor
                cmtC."Comentario",
                cmtC."Evaluacion"
        FROM 
            "Subasta"  S
        INNER JOIN "Usuarios" UV ON UV."Cedula" = S."IdVendedor"
        INNER JOIN "Usuarios"  UC ON UC."Cedula" = S."IdComprador"
        INNER JOIN "ComentariosAClientes" cmtC ON cmtC."idSubasta" = S."IdSubasta"
        
        WHERE
            UC."Cedula" = pcedula;
END;