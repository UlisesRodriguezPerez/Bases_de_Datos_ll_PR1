--CREATE ROLE usuario;
--CREATE ROLE administrador;
--CREATE ROLE participante;



GRANT EXECUTE ON FUNCTION buscarSubasta(integer) TO usuario;
GRANT EXECUTE ON FUNCTION buscarusuario(integer) TO usuario;
GRANT EXECUTE ON FUNCTION mostrartodassubastas() TO usuario;
GRANT EXECUTE ON FUNCTION mostrarusuarios() TO usuario;
GRANT EXECUTE ON FUNCTION mostrarsubastasactivas() TO usuario;

GRANT EXECUTE ON FUNCTION insertarcomentarioacomprador(integer, character varying, integer) TO participante;
GRANT EXECUTE ON FUNCTION insertarcomentarioavendedor(integer, character varying, integer) TO participante;
GRANT EXECUTE ON FUNCTION subastaritem(integer, character varying, character varying, character varying, real, 
									   timestamp without time zone, timestamp without time zone) TO participante;

GRANT EXECUTE ON FUNCTION insertarusuario(IN pcedula integer,IN pnombre character varying,IN pprimerapellido character varying,IN psegundoapellido character varying,IN palias character varying,IN pcorreo character varying,IN ppassword character varying,IN ptipousuario boolean,IN ptelefonocelular character varying,IN ptelefonocasa character varying,IN ptelefonotrabajo character varying) TO administrador;
GRANT EXECUTE ON FUNCTION editarusuario(IN pcedula integer,IN pnombre character varying,IN pprimerapellido character varying,IN psegundoapellido character varying,IN palias character varying,IN pcorreo character varying,IN ppassword character varying,IN pcuantossubastados integer,IN pcuantoscomprados integer,IN ptipousuario boolean,IN ptelefonocelular character varying,IN ptelefonocasa character varying,IN ptelefonotrabajo character varying) TO administrador;
GRANT EXECUTE ON FUNCTION eliminarusuario(integer) TO administrador;
 
ALTER FUNCTION buscarSubasta(integer) SECURITY DEFINER SET search_path = public;
ALTER FUNCTION buscarusuario(integer) SECURITY DEFINER SET search_path = public;
ALTER FUNCTION mostrartodassubastas() SECURITY DEFINER SET search_path = public;
ALTER FUNCTION mostrarusuarios() SECURITY DEFINER SET search_path = public;
ALTER FUNCTION mostrarsubastasactivas() SECURITY DEFINER SET search_path = public;
ALTER FUNCTION insertarcomentarioacomprador(integer, character varying, integer) SECURITY DEFINER SET search_path = public;
ALTER FUNCTION insertarcomentarioavendedor(integer, character varying, integer) SECURITY DEFINER SET search_path = public;
ALTER FUNCTION subastaritem(integer, character varying, character varying, character varying, real, 
									   timestamp without time zone, timestamp without time zone) SECURITY DEFINER SET search_path = public;
ALTER FUNCTION insertarusuario(IN pcedula integer,IN pnombre character varying,IN pprimerapellido character varying,IN psegundoapellido character varying,IN palias character varying,IN pcorreo character varying,IN ppassword character varying,IN ptipousuario boolean,IN ptelefonocelular character varying,IN ptelefonocasa character varying,IN ptelefonotrabajo character varying) SECURITY DEFINER SET search_path = public;
ALTER FUNCTION editarusuario(IN pcedula integer,IN pnombre character varying,IN pprimerapellido character varying,IN psegundoapellido character varying,IN palias character varying,IN pcorreo character varying,IN ppassword character varying,IN pcuantossubastados integer,IN pcuantoscomprados integer,IN ptipousuario boolean,IN ptelefonocelular character varying,IN ptelefonocasa character varying,IN ptelefonotrabajo character varying) SECURITY DEFINER SET search_path = public;
ALTER FUNCTION eliminarusuario(integer) SECURITY DEFINER SET search_path = public;

GRANT usuario TO administrador;
GRANT usuario TO participante;