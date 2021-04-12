-- PROCEDURE: public.mostrarusuarios()

-- DROP PROCEDURE public.mostrarusuarios();
CREATE OR REPLACE function mostrarUsuarios() returns 
	table (
		cedula bigint,
		nombre varchar,
		primerApellido varchar,
		segundoApellido varchar,
		aliass varchar,
		correo varchar,
		password varchar,
		cuantosSubastados integer,
		cuantosComprados integer,
		esAdmin bool
		
	)
AS
$$

	
	SELECT 
		"Cedula",
		"Nombre",
		"PrimerApellido",
		"SegundoApellido",
		"Alias",
		"Correo",
		"Password",
		"CuantosSubastados",
		"CuantosComprados",
		"EsAdmin"
	FROM "Usuarios"


$$
Language SQL



--SELECT mostrarUsuarios()