CREATE FUNCTION public.trigger_actualizar_pujas()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE idpujavieja integer; --idsubasta integer;
BEGIN
idpujavieja = (SELECT "IdPuja" FROM "Pujas"  ORDER BY "IdPuja" DESC limit 1);
--incremento = (SELECT Su."PrecioInicial" FROM "Subasta" Su WHERE Su."IdSubasta" = idsubasta);

UPDATE 
	"Pujas" 
SET
	"PujaMasAlta" = false
WHERE
	"IdPuja" = idpujavieja;

return NULL;
END
$BODY$;

