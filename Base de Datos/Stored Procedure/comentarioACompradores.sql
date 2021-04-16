

CREATE OR REPLACE FUNCTION public.insertarcomentarioacomprador(
	idsubasta integer,
	comentario character varying,
	evaluacion integer)
    RETURNS void
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$

INSERT INTO 
	"ComentariosAClientes"
VALUES
	(
		idsubasta,
		comentario,
		evaluacion
	)
$BODY$;


