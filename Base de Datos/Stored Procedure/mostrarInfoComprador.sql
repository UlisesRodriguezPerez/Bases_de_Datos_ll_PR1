-- FUNCTION: public.mostrarinfocomprador(integer)

-- DROP FUNCTION public.mostrarinfocomprador(integer);

CREATE OR REPLACE FUNCTION public.mostrarinfocomprador(
	pcedula integer)
    RETURNS TABLE(nombrecomprador character varying, nombrevendedor character varying, comentario character varying, puntaje integer) 
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
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
	UC."Cedula" = pcedula
$BODY$;

ALTER FUNCTION public.mostrarinfocomprador(integer)
    OWNER TO postgres;
