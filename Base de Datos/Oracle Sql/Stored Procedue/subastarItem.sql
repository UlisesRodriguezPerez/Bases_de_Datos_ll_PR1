CREATE OR REPLACE PROCEDURE subastaritem(
	idusuario IN number,
	subcategoria IN varchar2,
	descripcion IN varchar2,
	formaentrega IN varchar2,
	precioinicial IN numeric,
	fechainicio IN timestamp,
	fechafinal IN timestamp
    --P_RESULT OUT VARCHAR2
)
AS
BEGIN
    INSERT INTO "Subasta"(
            "IdVendedor",
            "IdComprador",
            "IdSubCategoria",
            "Descripcion",
            "FormaEntrega",
            "PrecioInicial",
            "FechaInicio",
            "FechaFinal"
        )
        VALUES(
            idusuario,
            0,
            (SELECT Sca."IdSubCategoria" FROM "SubCategoria" Sca WHERE Sca."Nombre" = subcategoria),
            descripcion,
            formaentrega,
            precioinicial,
            fechainicio,
            fechafinal
        );
   /* P_RESULT := 'SE EJECUTO CORRECTAMENTE.';
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
        P_RESULT := 'Error al insertar item.';
        ROLLBACK;
    */
    END;

