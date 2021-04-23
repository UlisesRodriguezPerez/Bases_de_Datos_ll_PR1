CREATE OR REPLACE PROCEDURE pujar(
	idsubasta IN number,
	idusuariopujador IN number,
	incremento IN numeric,
    P_RESULT OUT VARCHAR2
) IS
    nuevoIncrementoMinimo numeric;-- idsubasta integer;
    incrementoPorcentaje numeric;
	incrementoMinimo numeric;
	id_usuario number := idusuariopujador;
	id_subasta number := idsubasta;
	--incremento numeric := incremento;
	nuevoIncremento numeric;
    
BEGIN
    --nuevoIncrementoMinimo := ((SELECT "PrecioFinal" FROM "Pujas" ORDER BY "IdPuja" DESC FETCH FIRST ROWS ONLY;));
    SELECT "PrecioFinal" INTO nuevoIncremento FROM "Pujas" ORDER BY "IdPuja" DESC FETCH FIRST ROWS ONLY;
    nuevoIncremento := nuevoIncremento + incremento;
    --incrementoPorcentaje := (nuevoIncrementoMinimo * (Select "porcentajeMejora" FROM "VariablesSistema" )/100);
    SELECT "porcentajeMejora" INTO incrementoPorcentaje FROM "VariablesSistema";
    incrementoPorcentaje := nuevoIncremento * incrementoPorcentaje / 100;
    --incrementoMinimo := (SELECT "incrementoMinimo" FROM "VariablesSistema");
    SELECT "incrementoMinimo" INTO incrementoMinimo FROM "VariablesSistema";
    IF incrementoMinimo > incrementoPorcentaje THEN
        nuevoIncremento := incrementoMinimo;
    ELSE
        nuevoIncremento := ROUND(incrementoPorcentaje);
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
		nuevoIncremento,
		(incremento + (SELECT "PrecioFinal" FROM "Pujas" WHERE "IdSubasta" = id_subasta ORDER BY "IdPuja" DESC FETCH FIRST ROWS ONLY)),
		current_timestamp,
		1
	);
P_RESULT := 'SE EJECUTO CORRECTAMENTE.';
COMMIT;
EXCEPTION
    WHEN OTHERS THEN
    P_RESULT := 'Error al insertar la Puja.';
    ROLLBACK;

END;

