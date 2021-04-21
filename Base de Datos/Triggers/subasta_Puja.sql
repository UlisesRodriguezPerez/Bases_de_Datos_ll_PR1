-- FUNCTION: public.trigger_subastas_pujas()

-- DROP FUNCTION public.trigger_subastas_pujas();

CREATE FUNCTION public.trigger_subastas_pujas()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE incremento real; idsubasta integer;
BEGIN
idsubasta = (SELECT "IdSubasta" FROM "Subasta"  ORDER BY "IdSubasta" DESC limit 1);
incremento = (SELECT Su."PrecioInicial" FROM "Subasta" Su WHERE Su."IdSubasta" = idsubasta);

INSERT INTO 
	"Pujas" (
				"IdSubasta",
				"IdUsuario",
				"Incremento",
				"PrecioFinal",
				"FechaSubida",
				"PujaMasAlta"
			)
VALUES(
		(SELECT "IdSubasta" FROM "Subasta"  ORDER BY "IdSubasta" DESC limit 1),
		0,
		incremento,
		0,
		current_date,
		true
	);

return new;
END
$BODY$;

ALTER FUNCTION public.trigger_subastas_pujas()
    OWNER TO postgres;
