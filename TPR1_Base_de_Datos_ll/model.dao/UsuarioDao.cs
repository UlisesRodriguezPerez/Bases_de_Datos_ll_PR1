using System;
using System.Collections.Generic;
using System.Data;
using Npgsql;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using model.entity;
//using System.Data.OracleClient;
//using Oracle.ManagedDataAccess.Client;
using Oracle.DataAccess.Client;

//using Oracle.ManagedDataAccess.Client;

namespace model.dao
{
    public class UsuarioDao
    {
        private Conexion objConexion;
        private NpgsqlCommand comando;

        private ConexionOracle objConexionOracle;
        private OracleCommand comandoOracle;


        public UsuarioDao()
        {
            //obtenerIP();
            objConexion = Conexion.saberEstado();
            objConexionOracle = ConexionOracle.saberEstado();
        }

        public List<Usuario> findAll()
        {
            List<Usuario> listaUsuarios = new List<Usuario>();
            try
            {
                comando = new NpgsqlCommand("MostrarUsuarios", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };
                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Usuario objetoUsuario = new Usuario
                    {
                        IdUsuario = Convert.ToInt32(read[0].ToString()),
                        NombreUsuario = read[1].ToString(),
                        PrimerApellido = read[2].ToString(),
                        SegundoApellido = read[3].ToString(),
                        Alias = read[4].ToString(),
                        Correo = read[5].ToString(),
                        Password = read[6].ToString(),
                        CuantosSubastados = Convert.ToInt32(read[7].ToString()),
                        CuantosComprados = Convert.ToInt32(read[8].ToString()),
                        EsAdmin = Convert.ToBoolean(read[9].ToString()),
                        TelefonoCelular = read[10].ToString(),
                        TelefonoCasa = read[11].ToString(),
                        TelefonoTrabajo = read[12].ToString()


                    };
                    listaUsuarios.Add(objetoUsuario);
                }
            }

            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }
            return listaUsuarios;
        }

        public string verificar(Usuario usuario)
        {

            string result;
            try
            {

                comando = new NpgsqlCommand("validarusuario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("pcedula", usuario.IdUsuario);
                comando.Parameters.AddWithValue("ppassword", usuario.Password);
                objConexion.getConexion().Open();
                comando.ExecuteNonQuery();
                NpgsqlDataReader read = comando.ExecuteReader();
                bool hayRegistros = read.Read();
                if (hayRegistros)
                {
                    usuario.IdUsuario = Convert.ToInt32(read[0].ToString());
                    usuario.NombreUsuario = read[1].ToString();
                    usuario.PrimerApellido = read[2].ToString();
                    usuario.SegundoApellido = read[3].ToString();
                    usuario.Alias = read[4].ToString();
                    usuario.Correo = read[5].ToString();
                    usuario.Password = read[6].ToString();
                    usuario.CuantosSubastados = Convert.ToInt32(read[7].ToString());
                    usuario.CuantosComprados = Convert.ToInt32(read[8].ToString());
                    usuario.EsAdmin = Convert.ToBoolean(read[9].ToString());
                    usuario.TelefonoCelular = read[10].ToString();
                    usuario.TelefonoCasa = read[11].ToString();
                    usuario.TelefonoTrabajo = read[12].ToString();
                    if (usuario.EsAdmin == true)
                    {
                        result = "Admin";
                    }

                    else
                    {
                        result = "Normal";
                    }

                }
                else
                {
                    result = "";
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }

            return result;
        }
        
        public void create(Usuario objetoUsuario)
        {
            try
            {
                //string encryptPass = Encrypt.GetSHA256(objetoUsuario.Password);
            comando = new NpgsqlCommand("insertarusuario", objConexion.getConexion());
            comando.CommandType = CommandType.StoredProcedure;
     
            comando.Parameters.AddWithValue("pcedula", objetoUsuario.IdUsuario);
            comando.Parameters.AddWithValue("pnombre", objetoUsuario.NombreUsuario);
            comando.Parameters.AddWithValue("pprimerapellido", objetoUsuario.PrimerApellido);
            comando.Parameters.AddWithValue("psegundoapellido", objetoUsuario.SegundoApellido);
            comando.Parameters.AddWithValue("palias", objetoUsuario.Alias);
            comando.Parameters.AddWithValue("pcorreo", objetoUsuario.Correo);
            comando.Parameters.AddWithValue("ppassword", objetoUsuario.Password);
            comando.Parameters.AddWithValue("ptipousuario", objetoUsuario.EsAdmin);
            comando.Parameters.AddWithValue("ptelefonocelular", objetoUsuario.TelefonoCelular);
            comando.Parameters.AddWithValue("ptelefonocasa", objetoUsuario.TelefonoCasa);
            comando.Parameters.AddWithValue("ptelefonotrabajo", objetoUsuario.TelefonoTrabajo);

                objConexion.getConexion().Open();
            comando.ExecuteNonQuery();
                //try { 
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }


        }
        public bool find(Usuario objetoUsuario)
        {
            bool hayRegistros;
            try
            {
                comando = new NpgsqlCommand("buscarusuario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("pid", objetoUsuario.IdUsuario);
                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                hayRegistros = read.Read();
                if (hayRegistros)
                {
                    objetoUsuario.IdUsuario = Convert.ToInt32(read[0].ToString());
                    objetoUsuario.NombreUsuario = read[1].ToString();
                    objetoUsuario.PrimerApellido = read[2].ToString();
                    objetoUsuario.SegundoApellido = read[3].ToString();
                    objetoUsuario.Alias = read[4].ToString();
                    objetoUsuario.Correo = read[5].ToString();
                    objetoUsuario.Password = read[6].ToString();
                    objetoUsuario.CuantosSubastados = Convert.ToInt32(read[7].ToString());
                    objetoUsuario.CuantosComprados = Convert.ToInt32(read[8].ToString());
                    objetoUsuario.EsAdmin = Convert.ToBoolean(read[9].ToString());
                    objetoUsuario.TelefonoCelular = read[10].ToString();
                    objetoUsuario.TelefonoCasa = read[11].ToString();
                    objetoUsuario.TelefonoTrabajo = read[12].ToString();
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }
            return hayRegistros;
        }

        public void update(Usuario objetoUsuario)
        {
            //try
            //{
                
                comando = new NpgsqlCommand("editarusuario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("pcedula", objetoUsuario.IdUsuario);
                comando.Parameters.AddWithValue("pnombre", objetoUsuario.NombreUsuario);
                comando.Parameters.AddWithValue("pprimerapellido", objetoUsuario.PrimerApellido);
                comando.Parameters.AddWithValue("psegundoapellido", objetoUsuario.SegundoApellido);
                comando.Parameters.AddWithValue("palias", objetoUsuario.Alias);
                comando.Parameters.AddWithValue("pcorreo", objetoUsuario.Correo);
                comando.Parameters.AddWithValue("ppassword", objetoUsuario.Password);
                comando.Parameters.AddWithValue("pcuantossubastados", objetoUsuario.CuantosSubastados);
                comando.Parameters.AddWithValue("pcuantoscomprados", objetoUsuario.CuantosComprados);
                comando.Parameters.AddWithValue("ptipousuario", objetoUsuario.EsAdmin);
                comando.Parameters.AddWithValue("ptelefonocelular", objetoUsuario.TelefonoCelular);
                comando.Parameters.AddWithValue("ptelefonocasa", objetoUsuario.TelefonoCasa);
                comando.Parameters.AddWithValue("ptelefonotrabajo", objetoUsuario.TelefonoTrabajo);
            objConexion.getConexion().Open();
                comando.ExecuteNonQuery();
            try
            {

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }
        }

        public void delete(Usuario objetoUsuario)
        {
            try
            {
                comando = new NpgsqlCommand("eliminarusuario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("pid", objetoUsuario.IdUsuario);
                objConexion.getConexion().Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }
        }
        public void deleteOracle(Usuario objetoUsuario)
        {
            
                comandoOracle = new OracleCommand("eliminarusuario", objConexionOracle.getConexionOracle());
                comandoOracle.CommandType = CommandType.StoredProcedure;
                comandoOracle.Parameters.Add("pid", objetoUsuario.IdUsuario);
                objConexionOracle.getConexionOracle().Open();
                comandoOracle.ExecuteNonQuery();
            try
            { }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
        }
    }
}