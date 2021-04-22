--SELECT pujar(21,3,550)
--DELETE FROM "Pujas" WHERE "IdPuja" = 82
--SELECT pujar(19,3,29000)
CREATE OR REPLACE FUNCTION public.pujar(
	idsubasta integer,
	idusuariopujador integer,
	incremento real
	)

    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS --$body$
--DO
$$
--DECLARE
 --   local_a text := a;
   -- local_b text := b;
DECLARE nuevoIncrementoMinimo real;-- idsubasta integer;
		incrementoPorcentaje real;
		incrementoMinimo real;
		id_usuario integer := idusuariopujador;
		id_subasta integer := idsubasta;
		_incremento real := incremento;
		nuevoIncremento real;
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
		current_date,
		true
	);
END;
$$
--$BODY$;
