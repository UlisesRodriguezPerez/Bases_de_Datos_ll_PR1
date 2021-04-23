CREATE OR REPLACE PROCEDURE insertarcomentarioacomprador(
	idsubasta IN "ComentariosAClientes"."idSubasta"%TYPE,
	comentario IN "ComentariosAClientes"."Comentario"%TYPE,
	evaluacion IN "ComentariosAClientes"."Evaluacion"%TYPE,
    P_RESULT OUT VARCHAR2
)
AS
BEGIN
    INSERT INTO "ComentariosAClientes"(
            "idSubasta",
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
        P_RESULT := 'Error al insertar comentario a Cliente.';
        ROLLBACK;
    
    END;

