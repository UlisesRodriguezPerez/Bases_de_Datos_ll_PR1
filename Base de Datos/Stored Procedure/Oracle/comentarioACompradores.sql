

CREATE OR REPLACE PROCEDURE insertarcomentarioacomprador(
	idsubasta integer,
	comentario character varying,
	evaluacion integer) AS
BEGIN
    INSERT INTO 
        ComentariosAClientes
    VALUES
        (
            idsubasta,
            comentario,
            evaluacion
        )
END;
--$BODY$;


