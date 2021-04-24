--CREATE ROLE "usuario";
--CREATE ROLE "admin1";
--CREATE ROLE "normal";

ALTER FUNCTION buscarusuario(integer) SECURITY DEFINER;
ALTER FUNCTION buscarvariablessistema() SECURITY DEFINER;
ALTER FUNCTION editarusuario(IN pcedula integer,IN pnombre character varying,IN pprimerapellido character varying,IN psegundoapellido character varying,IN palias character varying,IN pcorreo character varying,IN ppassword character varying,IN pcuantossubastados integer,IN pcuantoscomprados integer,IN ptipousuario boolean,IN ptelefonocelular character varying,IN ptelefonocasa character varying,IN ptelefonotrabajo character varying) SECURITY DEFINER;
ALTER FUNCTION editarvariablessistema(integer, numeric) SECURITY DEFINER;
ALTER FUNCTION eliminarusuario(integer) SECURITY DEFINER;
ALTER FUNCTION insertarcomentarioacomprador(integer, character varying, integer) SECURITY DEFINER;
ALTER FUNCTION insertarcomentarioavendedor(integer, character varying, integer) SECURITY DEFINER;
ALTER FUNCTION insertarusuario(IN pcedula integer,IN pnombre character varying,IN pprimerapellido character varying,IN psegundoapellido character varying,IN palias character varying,IN pcorreo character varying,IN ppassword character varying,IN ptipousuario boolean,IN ptelefonocelular character varying,IN ptelefonocasa character varying,IN ptelefonotrabajo character varying) SECURITY DEFINER;
ALTER FUNCTION mostrarcategorias() SECURITY DEFINER;
ALTER FUNCTION mostrarcompradas(integer) SECURITY DEFINER;
ALTER FUNCTION mostrarhistorialpujas(integer) SECURITY DEFINER;
ALTER FUNCTION mostrarinfocomprador(integer) SECURITY DEFINER;
ALTER FUNCTION mostrarsubastadas(integer)SECURITY DEFINER;
ALTER FUNCTION mostrartodassubastas() SECURITY DEFINER;
ALTER FUNCTION mostrarusuarios() SECURITY DEFINER;
ALTER FUNCTION mostrarsubastasactivas() SECURITY DEFINER;
ALTER FUNCTION pujar(IN idsubasta integer,IN idusuariopujador integer,IN incremento numeric) SECURITY DEFINER;
ALTER FUNCTION subastaritem(integer, character varying, character varying, character varying, numeric, 
									   timestamp without time zone, timestamp without time zone) SECURITY DEFINER;
ALTER FUNCTION validarusuario(character varying, character varying) SECURITY DEFINER;

ALTER FUNCTION mostrarinfovendedor(integer) SECURITY DEFINER;
ALTER FUNCTION mostrarsubastasactivas() SECURITY DEFINER;
ALTER FUNCTION mostrarsubastasactivassubcategorias(integer) SECURITY DEFINER;
ALTER FUNCTION mostrarsubastasvencidas() SECURITY DEFINER;
ALTER FUNCTION mostrarsubcategorias(integer) SECURITY DEFINER;




REVOKE ALL ON FUNCTION buscarusuario(integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION buscarvariablessistema() FROM PUBLIC;
REVOKE ALL ON FUNCTION editarusuario(IN pcedula integer,IN pnombre character varying,IN pprimerapellido character varying,IN psegundoapellido character varying,IN palias character varying,IN pcorreo character varying,IN ppassword character varying,IN pcuantossubastados integer,IN pcuantoscomprados integer,IN ptipousuario boolean,IN ptelefonocelular character varying,IN ptelefonocasa character varying,IN ptelefonotrabajo character varying) FROM PUBLIC;
REVOKE ALL ON FUNCTION editarvariablessistema(integer, numeric) FROM PUBLIC;
REVOKE ALL ON FUNCTION eliminarusuario(integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION insertarcomentarioacomprador(integer, character varying, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION insertarcomentarioavendedor(integer, character varying, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION insertarusuario(IN pcedula integer,IN pnombre character varying,IN pprimerapellido character varying,IN psegundoapellido character varying,IN palias character varying,IN pcorreo character varying,IN ppassword character varying,IN ptipousuario boolean,IN ptelefonocelular character varying,IN ptelefonocasa character varying,IN ptelefonotrabajo character varying) FROM PUBLIC;
REVOKE ALL ON FUNCTION mostrarcategorias() FROM PUBLIC;
REVOKE ALL ON FUNCTION mostrarcompradas(integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION mostrarhistorialpujas(integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION mostrarinfocomprador(integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION mostrarsubastadas(integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION mostrartodassubastas() FROM PUBLIC;
REVOKE ALL ON FUNCTION mostrarusuarios() FROM PUBLIC;
REVOKE ALL ON FUNCTION mostrarsubastasactivas() FROM PUBLIC;
REVOKE ALL ON FUNCTION pujar(IN idsubasta integer,IN idusuariopujador integer,IN incremento numeric) FROM PUBLIC;
REVOKE ALL ON FUNCTION subastaritem(integer, character varying, character varying, character varying, numeric, 
									   timestamp without time zone, timestamp without time zone) FROM PUBLIC;
REVOKE ALL ON FUNCTION validarusuario(character varying, character varying) FROM PUBLIC;

REVOKE ALL ON FUNCTION mostrarinfovendedor(integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION mostrarsubastasactivas() FROM PUBLIC;
REVOKE ALL ON FUNCTION mostrarsubastasactivassubcategorias(integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION mostrarsubastasvencidas() FROM PUBLIC;
REVOKE ALL ON FUNCTION mostrarsubcategorias(integer) FROM PUBLIC;

GRANT EXECUTE ON FUNCTION buscarusuario(integer) TO "usuario";
GRANT EXECUTE ON FUNCTION buscarvariablessistema() TO "usuario";
GRANT EXECUTE ON FUNCTION editarusuario(IN pcedula integer,IN pnombre character varying,IN pprimerapellido character varying,IN psegundoapellido character varying,IN palias character varying,IN pcorreo character varying,IN ppassword character varying,IN pcuantossubastados integer,IN pcuantoscomprados integer,IN ptipousuario boolean,IN ptelefonocelular character varying,IN ptelefonocasa character varying,IN ptelefonotrabajo character varying) TO "admin1";
GRANT EXECUTE ON FUNCTION editarvariablessistema(integer, numeric) TO "admin1";
GRANT EXECUTE ON FUNCTION eliminarusuario(integer) TO "admin1";
GRANT EXECUTE ON FUNCTION insertarcomentarioacomprador(integer, character varying, integer) TO "normal";
GRANT EXECUTE ON FUNCTION insertarcomentarioavendedor(integer, character varying, integer) TO "normal";
GRANT EXECUTE ON FUNCTION insertarusuario(IN pcedula integer,IN pnombre character varying,IN pprimerapellido character varying,IN psegundoapellido character varying,IN palias character varying,IN pcorreo character varying,IN ppassword character varying,IN ptipousuario boolean,IN ptelefonocelular character varying,IN ptelefonocasa character varying,IN ptelefonotrabajo character varying) TO "admin1";
GRANT EXECUTE ON FUNCTION mostrarcategorias() TO "usuario";
GRANT EXECUTE ON FUNCTION mostrarcompradas(integer) TO "normal";
GRANT EXECUTE ON FUNCTION mostrarhistorialpujas(integer) TO "usuario";
GRANT EXECUTE ON FUNCTION mostrarinfocomprador(integer) TO "usuario";
GRANT EXECUTE ON FUNCTION mostrarsubastadas(integer) TO "normal";
GRANT EXECUTE ON FUNCTION mostrartodassubastas() TO "admin1";
GRANT EXECUTE ON FUNCTION mostrarusuarios() TO "admin1";
GRANT EXECUTE ON FUNCTION mostrarsubastasactivas() TO "usuario";
GRANT EXECUTE ON FUNCTION pujar(IN idsubasta integer,IN idusuariopujador integer,IN incremento numeric) TO "normal";
GRANT EXECUTE ON FUNCTION subastaritem(integer, character varying, character varying, character varying, numeric, 
									   timestamp without time zone, timestamp without time zone) TO "normal";
GRANT EXECUTE ON FUNCTION validarusuario(character varying, character varying) TO "usuario";

GRANT EXECUTE ON FUNCTION mostrarinfovendedor(integer) TO "usuario";
GRANT EXECUTE ON FUNCTION mostrarsubastasactivas() TO "usuario";
GRANT EXECUTE ON FUNCTION mostrarsubastasactivassubcategorias(integer) TO "usuario";
GRANT EXECUTE ON FUNCTION mostrarsubastasvencidas() TO "usuario";
GRANT EXECUTE ON FUNCTION mostrarsubcategorias(integer) TO "usuario";

GRANT "usuario" TO "admin1";
GRANT "usuario" TO "normal";