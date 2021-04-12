CREATE OR REPLACE function InsertarUsuario(pCedula integer,pNombre varchar, pPrimerApellido varchar, pSegundoApellido varchar,
										   pAlias varchar, pCorreo varchar, pPassword varchar, pTipoUsuario boolean
										   
										  ) 
returns void
AS
$$

INSERT INTO "Usuarios"(
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
	)
	VALUES(
		pCedula,
		pNombre,
		pPrimerApellido,
		pSegundoApellido,
		pAlias,
		pCorreo,
		pPassword,
		0,
		0,
		pTipoUsuario
	);
$$
Language SQL

--SELECT public.InsertarUsuario(3,'3','3','3','3','3','3',false)

--SELECT * FROM "Usuarios"