-- FUNCTION: public.trigger_actualizar_pujas()

-- DROP FUNCTION public.trigger_actualizar_pujas();

CREATE OR REPLACE FUNCTION public.trigger_actualizar_pujas()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE idpujavieja integer; idsubasta integer;cantidadPujas integer;
BEGIN
idsubasta = (SELECT "IdSubasta" FROM "Pujas" ORDER BY "IdPuja" DESC limit 1);
cantidadPujas = (SELECT COUNT(*) FROM "Pujas" WHERE "IdSubasta" = idsubasta);

idpujavieja = (SELECT "IdPuja" FROM "Pujas" WHERE "IdSubasta" = idsubasta AND "PujaMasAlta" = true ORDER BY "IdPuja" ASC limit 1);
--incremento = (SELECT Su."PrecioInicial" FROM "Subasta" Su WHERE Su."IdSubasta" = idsubasta);

UPDATE 
	"Pujas" 
SET
	"PujaMasAlta" = false
WHERE
	"IdPuja" = idpujavieja AND cantidadPujas > 1; --OLD."IdPuja" AND "IdSubasta" = NEW."IdSubasta";

return NULL;
END
$BODY$;

ALTER FUNCTION public.trigger_actualizar_pujas()
    OWNER TO postgres;
