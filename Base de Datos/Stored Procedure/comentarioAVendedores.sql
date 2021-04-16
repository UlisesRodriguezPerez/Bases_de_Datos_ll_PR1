-- FUNCTION: public.insertarcomentarioavendedor(integer, character varying, integer)

-- DROP FUNCTION public.insertarcomentarioavendedor(integer, character varying, integer);

CREATE OR REPLACE FUNCTION public.insertarcomentarioavendedor(
	idsubasta integer,
	comentario character varying,
	evaluacion integer)
    RETURNS void
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
--DECLARE fechaActual date;

--SET "fechaActual" = current_time;
INSERT INTO 
	"ComentariosAVendedores"
VALUES
	(
		idsubasta,
		comentario,
		evaluacion
	)
$BODY$;

ALTER FUNCTION public.insertarcomentarioavendedor(integer, character varying, integer)
    OWNER TO postgres;
