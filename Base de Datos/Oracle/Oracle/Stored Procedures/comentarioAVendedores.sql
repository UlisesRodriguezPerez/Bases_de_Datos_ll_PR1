-- FUNCTION: public.insertarcomentarioavendedor(integer, character varying, integer)

-- DROP FUNCTION public.insertarcomentarioavendedor(integer, character varying, integer);

CREATE OR REPLACE PROCEDURE insertarcomentarioavendedor(
	idsubasta integer,
	comentario character varying,
	evaluacion integer) AS
    /*
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
*/
--DECLARE fechaActual date;

--SET fechaActual = current_time;
BEGIN
    INSERT INTO 
        "ComentariosAVendedores"
    VALUES
        (
            idsubasta,
            comentario,
            evaluacion
        );
END;
--$BODY$;

--ALTER FUNCTION public.insertarcomentarioavendedor(integer, character varying, integer)
--    OWNER TO postgres;
