
CREATE OR REPLACE FUNCTION public.mostrarhistorialpujas(
	idsubasta INTEGER
	)
    RETURNS TABLE(nombre VARCHAR, alias VARCHAR, incremento real,
				  preciofinal real, fechasubida date) 
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
SELECT 
		U."Nombre",
		U."Alias",
		Pu."Incremento",
		Pu."PrecioFinal",
		Pu."FechaSubida"

FROM 
	"Pujas" Pu
INNER JOIN "Usuarios" U ON U."Cedula" = PU."IdUsuario"
WHERE Pu."IdSubasta" = idsubasta AND U."Cedula" <> 0
ORDER BY Pu."IdPuja" DESC;
;
$BODY$;

