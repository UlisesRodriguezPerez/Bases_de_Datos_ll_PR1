CREATE OR REPLACE PROCEDURE insertarcomentarioavendedor(
	idsubasta IN "ComentariosAVendedores"."IdSubasta"%TYPE,
	comentario IN "ComentariosAVendedores"."Comentario"%TYPE,
	evaluacion IN "ComentariosAVendedores"."Evaluacion"%TYPE,
    P_RESULT OUT VARCHAR2
)
AS
BEGIN
    INSERT INTO "ComentariosAVendedores"(
            "IdSubasta",
            "Comentario",
            "Evaluacion"
        )
        VALUES(
            idsubasta,
            comentario,
            evaluacion
        );
    P_RESULT := 'SE EJECUTO CORRECTAMENTE.';
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
        P_RESULT := 'Error al insertar comentario a Vendedor.';
        ROLLBACK;
    
    END;

