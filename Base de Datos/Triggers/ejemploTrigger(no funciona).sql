CREATE function trigger_Subastas_Pujas() returns Trigger
AS
$$
DECLARE incremento real;
BEGIN

incremento = (SELECT "incrementoMinimo" FROM "VariablesSistema");
INSERT INTO 
	"Pujas" (
				"IdSubasta",
				"IdUsuario",
				"Incremento",
				"PrecioFinal",
				"FechaSubida",
				"FueCompra"
			)
VALUES(
		(SELECT "IdSubasta" FROM "Subasta"  ORDER BY "IdSubasta" DESC limit 1),
		0,
		incremento,
		0,
		current_date,
		false
	);

return new;
END
$$
Language plpgsql;

CREATE TRIGGER CrearPuja AFTER INSERT ON "Subasta"
EXECUTE PROCEDURE trigger_Subastas_Pujas();



