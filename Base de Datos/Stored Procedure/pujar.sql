-- FUNCTION: public.pujar(integer, integer, numeric)

-- DROP FUNCTION public.pujar(integer, integer, numeric);

CREATE OR REPLACE FUNCTION public.pujar(
	idsubasta integer,
	idusuariopujador integer,
	incremento numeric)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
--DECLARE
 --   local_a text := a;
   -- local_b text := b;
DECLARE nuevoIncrementoMinimo numeric;-- idsubasta integer;
		incrementoPorcentaje numeric;
		incrementoMinimo numeric;
		id_usuario integer := idusuariopujador;
		id_subasta integer := idsubasta;
		_incremento numeric := incremento;
		nuevoIncremento numeric;
BEGIN

nuevoIncrementoMinimo = ((SELECT "PrecioFinal" FROM "Pujas"  ORDER BY "IdPuja" DESC limit 1) + _incremento);
incrementoPorcentaje = (nuevoIncrementoMinimo * (Select "porcentajeMejora" FROM "VariablesSistema" )/100);
incrementoMinimo = (SELECT "incrementoMinimo" FROM "VariablesSistema");
IF incrementoMinimo > incrementoPorcentaje THEN
    nuevoIncremento = incrementoMinimo;
ELSE
	nuevoIncremento = ROUND(incrementoPorcentaje);
END IF;
--nuevoIncremento =  MAX(incrementoMinimo,incrementoPorcentaje);
INSERT INTO "Pujas"(
		"IdSubasta",
		"IdUsuario",
		"Incremento",
		"PrecioFinal",
		"FechaSubida",
		"PujaMasAlta"

	)
	VALUES(
		id_subasta,
		id_usuario,
		--(SELECT MAX((SELECT "incrementoMinimo" FROM "VariablesSistema"),cast( (((SELECT "PrecioFinal" FROM "Pujas"  ORDER BY "IdPuja" DESC limit 1) + incremento)* (Select "porcentajeMejora" FROM "VariablesSistema" )/100)AS REAL))),
		nuevoIncremento,
		(_incremento + (SELECT "PrecioFinal" FROM "Pujas" WHERE "IdSubasta" = id_subasta ORDER BY "IdPuja" DESC limit 1)),
		current_timestamp,
		true
	);
END;
$BODY$;

ALTER FUNCTION public.pujar(integer, integer, numeric)
    OWNER TO postgres;
