CREATE OR REPLACE FUNCTION mostrarcompradas(
	pcedula integer
	)
    RETURN SYS_REFCURSOR AS/*TABLE(idsubasta bigint, 
				  idvendedor bigint, 
				  idcomprador bigint, 
				  idsubcategoria bigint, 
				  idcategoria bigint, 
				  nombrecomprador varchar,
				  nombrevendedor varchar,
				  nombrecategoria varchar,
				  nombresubcategoria varchar,
				  descripcion varchar,
				  formaentrega varchar,
				  precioinicial real,
				  fechainicio date,
				  fechafinal date
			
				 ) 
                 */
    --LANGUAGE 'sql'

--AS $BODY$
--DECLARE fechaActual date;

--SET "fechaActual" = current_time;
    tablita SYS_REFCURSOR;

BEGIN
    OPEN tablita FOR
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
        INNER JOIN "Usuarios"  UC ON UC."Cedula" = S."IdComprador";
    RETURN tablita;
END;

--WHERE
--	UC."Cedula" = pcedula
	
--$BODY$;