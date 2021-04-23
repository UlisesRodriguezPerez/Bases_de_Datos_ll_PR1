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
        //private Conexion objConexion;
        private OracleCommand comando;

        private ConexionOracle objConexionOracle;
        //private OracleCommand comando;


        public UsuarioDao()
        {
            //obtenerIP();
            //objConexion = Conexion.saberEstado();
            objConexionOracle = ConexionOracle.saberEstado();
        }

        public List<Usuario> findAll()
        {
            List<Usuario> listaUsuarios = new List<Usuario>();
            try
            {
                comando = new OracleCommand("MostrarUsuarios", objConexionOracle. getConexionOracle())
                {
                    CommandType = CommandType.StoredProcedure
                };
                objConexionOracle.getConexionOracle().Open();

                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return listaUsuarios;
        }

        public string verificar(Usuario usuario)
        {

            bool blnfound = false;
            string result;
            //objConexionOracle.cerrarConexionOracle();
            //objConexionOracle.getConexionOracle().Close();


            comando = new OracleCommand("validarusuario", objConexionOracle.getConexionOracle());
            //comando = new OracleCommand("validarusuario", conn);
            comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.Add("palias", usuario.Alias);
                comando.Parameters.Add("ppassword", usuario.Password);
                //conn.Open();
                objConexionOracle.getConexionOracle().Open();
                comando.ExecuteNonQuery();
                OracleDataReader read = comando.ExecuteReader();
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
                    result = " ";
                    //MessageBox.Show("Usuario o Contraseña Incorrecta", "Mensaje de Alerta", MessageBoxButton.OK);
                    //read.Close();
                    //conn.Close();
                }
            try
            {
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                //read.Close();
                //conn.Close();
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }

            return result;
        }
        
        public void create(Usuario objetoUsuario)
        {
            try
            {
                //string encryptPass = Encrypt.GetSHA256(objetoUsuario.Password);
            comando = new OracleCommand("insertarusuario", objConexionOracle.getConexionOracle());
            comando.CommandType = CommandType.StoredProcedure;
     
            comando.Parameters.Add("pcedula", objetoUsuario.IdUsuario);
            comando.Parameters.Add("pnombre", objetoUsuario.NombreUsuario);
            comando.Parameters.Add("pprimerapellido", objetoUsuario.PrimerApellido);
            comando.Parameters.Add("psegundoapellido", objetoUsuario.SegundoApellido);
            comando.Parameters.Add("palias", objetoUsuario.Alias);
            comando.Parameters.Add("pcorreo", objetoUsuario.Correo);
            comando.Parameters.Add("ppassword", objetoUsuario.Password);
            comando.Parameters.Add("ptipousuario", objetoUsuario.EsAdmin);
            comando.Parameters.Add("ptelefonocelular", objetoUsuario.TelefonoCelular);
            comando.Parameters.Add("ptelefonocasa", objetoUsuario.TelefonoCasa);
            comando.Parameters.Add("ptelefonotrabajo", objetoUsuario.TelefonoTrabajo);

                objConexionOracle.getConexionOracle().Open();
            comando.ExecuteNonQuery();
                //try { 
            }
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
        public bool find(Usuario objetoUsuario)
        {
            bool hayRegistros;
            try
            {
                comando = new OracleCommand("buscarusuario", objConexionOracle.getConexionOracle());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.Add("pid", objetoUsuario.IdUsuario);
                objConexionOracle.getConexionOracle().Open();
                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return hayRegistros;
        }

        public void update(Usuario objetoUsuario)
        {
            //try
            //{
                
                comando = new OracleCommand("editarusuario", objConexionOracle.getConexionOracle());
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.Add("pcedula", objetoUsuario.IdUsuario);
                comando.Parameters.Add("pnombre", objetoUsuario.NombreUsuario);
                comando.Parameters.Add("pprimerapellido", objetoUsuario.PrimerApellido);
                comando.Parameters.Add("psegundoapellido", objetoUsuario.SegundoApellido);
                comando.Parameters.Add("palias", objetoUsuario.Alias);
                comando.Parameters.Add("pcorreo", objetoUsuario.Correo);
                comando.Parameters.Add("ppassword", objetoUsuario.Password);
                comando.Parameters.Add("pcuantossubastados", objetoUsuario.CuantosSubastados);
                comando.Parameters.Add("pcuantoscomprados", objetoUsuario.CuantosComprados);
                comando.Parameters.Add("ptipousuario", objetoUsuario.EsAdmin);
                comando.Parameters.Add("ptelefonocelular", objetoUsuario.TelefonoCelular);
                comando.Parameters.Add("ptelefonocasa", objetoUsuario.TelefonoCasa);
                comando.Parameters.Add("ptelefonotrabajo", objetoUsuario.TelefonoTrabajo);
            objConexionOracle.getConexionOracle().Open();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
        }

        public void delete(Usuario objetoUsuario)
        {
            try
            {
                comando = new OracleCommand("eliminarusuario", objConexionOracle.getConexionOracle());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.Add("pid", objetoUsuario.IdUsuario);
                objConexionOracle.getConexionOracle().Open();
                comando.ExecuteNonQuery();
            }
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
        public void deleteOracle(Usuario objetoUsuario)
        {
            
                comando = new OracleCommand("eliminarusuario", objConexionOracle.getConexionOracle());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.Add("pid", objetoUsuario.IdUsuario);
                objConexionOracle.getConexionOracle().Open();
                comando.ExecuteNonQuery();
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