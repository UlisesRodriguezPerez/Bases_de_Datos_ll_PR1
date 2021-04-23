CREATE OR REPLACE FUNCTION cargarcategorias()returns void
LANGUAGE 'sql'
AS $BODY$
	TRUNCATE "Usuarios" RESTART IDENTITY CASCADE;
	TRUNCATE "Categoria" RESTART IDENTITY CASCADE;
	TRUNCATE "SubCategoria" RESTART IDENTITY CASCADE;
	TRUNCATE "CategoriaSubCategoria" RESTART IDENTITY CASCADE;
	COPY "CategoriaSubCategoria"("NombreCategoria","NombreSubCategoria") 
	FROM E'C:\\Ulises\\Bases_de_Datos_ll_PR1\\CategoriasSubCategorias.csv' WITH delimiter '	' csv header encoding 'latin1';
	--DELETE FROM "CategoriaSubCategoria"


	INSERT INTO 
		"Categoria"("Nombre") 
	SELECT DISTINCT 
		("NombreCategoria") 
	FROM 
		"CategoriaSubCategoria" 
	ORDER BY ("NombreCategoria");

	INSERT INTO 
		"SubCategoria"("IdCategoria", "Nombre") 
	SELECT 
		C."IdCategoria", Cs."NombreSubCategoria" 
	FROM 
		"Categoria" C 
	INNER JOIN "CategoriaSubCategoria" Cs ON C."Nombre" = Cs."NombreCategoria" 
	ORDER BY (Cs."NombreSubCategoria");
	
	INSERT INTO "VariablesSistema" VALUES(5,5000);
	
	
	CREATE USER "admin1" WITH PASSWORD 'admin1pw';
	CREATE USER "normal" WITH PASSWORD 'normal';
	INSERT INTO "Usuarios" VALUES(1,'admin','apellido1','apellido2','admin1','@gmail','admin1pw',0,0,true,'1','1','1');
	INSERT INTO "Usuarios" VALUES(2,'normal','apellido1','apellido2','normal','@gmail','normal',0,0,false,'2','2','2');
	
	ALTER FUNCTION validarusuario(integer, character varying) SECURITY DEFINER;
	ALTER FUNCTION mostrarusuarios() SECURITY DEFINER;
	ALTER FUNCTION insertarusuario(IN pcedula integer,IN pnombre character varying,IN pprimerapellido character varying,IN psegundoapellido character varying,IN palias character varying,IN pcorreo character varying,IN ppassword character varying,IN ptipousuario boolean,IN ptelefonocelular character varying,IN ptelefonocasa character varying,IN ptelefonotrabajo character varying) SECURITY DEFINER;
	
	GRANT EXECUTE ON FUNCTION validarusuario(integer, character varying) TO "admin1";
	GRANT EXECUTE ON FUNCTION validarusuario(integer, character varying) TO "normal";
	GRANT EXECUTE ON FUNCTION insertarusuario(IN pcedula integer,IN pnombre character varying,IN pprimerapellido character varying,IN psegundoapellido character varying,IN palias character varying,IN pcorreo character varying,IN ppassword character varying,IN ptipousuario boolean,IN ptelefonocelular character varying,IN ptelefonocasa character varying,IN ptelefonotrabajo character varying) TO "admin1";
	GRANT EXECUTE ON FUNCTION mostrarusuarios() TO "admin1";
	
$BODY$;

--SELECT cargarcategorias()


