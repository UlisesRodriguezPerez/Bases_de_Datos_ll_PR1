CREATE OR REPLACE PROCEDURE mostrarinfovendedor(
pcedula IN number,
P_CURSOR OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN P_CURSOR FOR
        SELECT 
                UC."Nombre", --Comprador
                UV."Nombre" ,--vendedor
                cmtV."Comentario",
                cmtV."Evaluacion"
        FROM 
            "Subasta"  S
        INNER JOIN "Usuarios" UV ON UV."Cedula" = S."IdVendedor"
        INNER JOIN "Usuarios"  UC ON UC."Cedula" = S."IdComprador"
        INNER JOIN "ComentariosAVendedores" cmtV ON cmtv."IdSubasta" = S."IdSubasta"
        
        WHERE
            UV."Cedula" = pcedula;
END;