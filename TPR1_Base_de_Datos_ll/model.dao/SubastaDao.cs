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
    public class SubastaDao
    {
        private Conexion objConexion;
        private NpgsqlCommand comando;

        private ConexionOracle objConexionOracle;
        private OracleCommand comandoOracle;


        public SubastaDao()
        {
            //obtenerIP();
            objConexion = Conexion.saberEstado();
            objConexionOracle = ConexionOracle.saberEstado();
        }

        public List<Subastas> buscarSubastasActivas(int Id)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new NpgsqlCommand("mostrarsubastasactivas", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };
              
                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Subastas objetoSubasta = new Subastas
                    {
                        IdSubasta = Convert.ToInt32(read[0].ToString()),
                        IdVendedor = Convert.ToInt32(read[1].ToString()),
                        IdComprador = Convert.ToInt32(read[2].ToString()),
                        IdSubCategoria = Convert.ToInt32(read[3].ToString()),
                        IdCategoria = Convert.ToInt32(read[4].ToString()),
                        AliasComprador = read[5].ToString(),
                        AliasVendedor = read[6].ToString(),
                        NombreCategoria = read[7].ToString(),
                        NombreSubCategoria = read[8].ToString(),
                        Descripcion = read[9].ToString(),
                        FormaEntrega = read[10].ToString(),
                        PrecioInicial = Convert.ToDecimal(read[11].ToString()),
                        FechaInicio = Convert.ToDateTime(read[12].ToString()),
                        FechaFinal = Convert.ToDateTime(read[13].ToString()),
                        PrecioMinimo = Convert.ToDecimal(read[14].ToString()),
                        PrecioFinal = Convert.ToDecimal(read[15].ToString()),
                        //NombreUsuarioActual = read[16].ToString(),
                        IdUsuarioActual = Id,
                    };
                    listaSubastas.Add(objetoSubasta);
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
            return listaSubastas;
        }
        
        public List<Subastas> buscarSubCategorias(int idUsuario, int idCategoria)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new NpgsqlCommand("mostrarsubcategorias", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.AddWithValue("idcategoria", idCategoria);
                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Subastas objetoSubasta = new Subastas
                    {
                        IdCategoria = Convert.ToInt32(read[0].ToString()),
                        IdSubCategoria = Convert.ToInt32(read[1].ToString()),
                        NombreCategoria = read[2].ToString(),
                        NombreSubCategoria = read[3].ToString(),
                        IdUsuarioActual = idUsuario,
                    };
                    listaSubastas.Add(objetoSubasta);
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
            return listaSubastas;
        }
        public List<Subastas> buscarhistorialPujas(int Id)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new NpgsqlCommand("mostrarhistorialpujas", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.AddWithValue("idsubasta", Id);
                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Subastas objetoSubasta = new Subastas
                    {
                        NombreComprador = read[0].ToString(),
                        AliasComprador = read[1].ToString(),
                        Incremento = Convert.ToDecimal(read[2].ToString()),
                        PrecioFinal = Convert.ToDecimal(read[3].ToString()),
                        FechaSubida = Convert.ToDateTime(read[4].ToString()),

                    };
                    listaSubastas.Add(objetoSubasta);
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
            return listaSubastas;
        }
        public List<Subastas> buscarCategorias(int Id)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new NpgsqlCommand("mostrarcategorias", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };

                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Subastas objetoSubasta = new Subastas
                    {
                        IdCategoria = Convert.ToInt32(read[0].ToString()),
                        NombreCategoria = read[1].ToString(),
                        IdUsuarioActual = Id,
                    };
                    listaSubastas.Add(objetoSubasta);
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
            return listaSubastas;
        }
        public List<Subastas> buscarSubastasVencidas(int Id)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new NpgsqlCommand("mostrarsubastasvencidas", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };
                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Subastas objetoSubasta = new Subastas
                    {
                        IdSubasta = Convert.ToInt32(read[0].ToString()),
                        IdVendedor = Convert.ToInt32(read[1].ToString()),
                        IdComprador = Convert.ToInt32(read[2].ToString()),
                        IdSubCategoria = Convert.ToInt32(read[3].ToString()),
                        IdCategoria = Convert.ToInt32(read[4].ToString()),
                        AliasComprador = read[5].ToString(),
                        AliasVendedor = read[6].ToString(),
                        NombreCategoria = read[7].ToString(),
                        NombreSubCategoria = read[8].ToString(),
                        Descripcion = read[9].ToString(),
                        FormaEntrega = read[10].ToString(),
                        PrecioInicial = Convert.ToDecimal(read[11].ToString()),
                        FechaInicio = Convert.ToDateTime(read[12].ToString()),
                        FechaFinal = Convert.ToDateTime(read[13].ToString()),
                        PrecioMinimo = Convert.ToDecimal(read[14].ToString()),
                        PrecioFinal = Convert.ToDecimal(read[15].ToString()),
                        IdUsuarioActual = Id,
                    };
                    listaSubastas.Add(objetoSubasta);
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
            return listaSubastas;
        }

        public List<Subastas> buscarTodasSubastas()
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new NpgsqlCommand("mostrartodassubastas", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };
                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Subastas objetoSubasta = new Subastas
                    {
                        IdSubasta = Convert.ToInt32(read[0].ToString()),
                        IdVendedor = Convert.ToInt32(read[1].ToString()),
                        IdComprador = Convert.ToInt32(read[2].ToString()),
                        IdSubCategoria = Convert.ToInt32(read[3].ToString()),
                        IdCategoria = Convert.ToInt32(read[4].ToString()),
                        NombreComprador = read[5].ToString(),
                        NombreVendedor = read[6].ToString(),
                        NombreCategoria = read[7].ToString(),
                        NombreSubCategoria = read[8].ToString(),
                        Descripcion = read[9].ToString(),
                        FormaEntrega = read[10].ToString(),
                        PrecioInicial = Convert.ToDecimal(read[11].ToString()),
                        FechaInicio = Convert.ToDateTime(read[12].ToString()),
                        FechaFinal = Convert.ToDateTime(read[13].ToString()),
                    };
                    listaSubastas.Add(objetoSubasta);
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
            return listaSubastas;
        }
        public List<Subastas> subastadas(int idUsuario)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new NpgsqlCommand("mostrarsubastadas", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.AddWithValue("pcedula", idUsuario);
                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Subastas objetoSubasta = new Subastas
                    {
                        IdSubasta = Convert.ToInt32(read[0].ToString()),
                        IdVendedor = Convert.ToInt32(read[1].ToString()),
                        IdComprador = Convert.ToInt32(read[2].ToString()),
                        IdSubCategoria = Convert.ToInt32(read[3].ToString()),
                        IdCategoria = Convert.ToInt32(read[4].ToString()),
                        NombreComprador = read[5].ToString(),
                        NombreVendedor = read[6].ToString(),
                        NombreCategoria = read[7].ToString(),
                        NombreSubCategoria = read[8].ToString(),
                        Descripcion = read[9].ToString(),
                        FormaEntrega = read[10].ToString(),
                        PrecioInicial = Convert.ToDecimal(read[11].ToString()),
                        FechaInicio = Convert.ToDateTime(read[12].ToString()),
                        FechaFinal = Convert.ToDateTime(read[13].ToString()),
                        IdUsuarioActual = idUsuario,
                    };
                    listaSubastas.Add(objetoSubasta);
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
            return listaSubastas;
        }
        public List<Subastas> compradas(int idUsuario)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new NpgsqlCommand("mostrarcompradas", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.AddWithValue("pcedula", idUsuario);
                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Subastas objetoSubasta = new Subastas
                    {
                        IdSubasta = Convert.ToInt32(read[0].ToString()),
                        IdVendedor = Convert.ToInt32(read[1].ToString()),
                        IdComprador = Convert.ToInt32(read[2].ToString()),
                        IdSubCategoria = Convert.ToInt32(read[3].ToString()),
                        IdCategoria = Convert.ToInt32(read[4].ToString()),
                        NombreComprador = read[5].ToString(),
                        NombreVendedor = read[6].ToString(),
                        NombreCategoria = read[7].ToString(),
                        NombreSubCategoria = read[8].ToString(),
                        Descripcion = read[9].ToString(),
                        FormaEntrega = read[10].ToString(),
                        PrecioInicial = Convert.ToDecimal(read[11].ToString()),
                        FechaInicio = Convert.ToDateTime(read[12].ToString()),
                        FechaFinal = Convert.ToDateTime(read[13].ToString()),
                    };
                    listaSubastas.Add(objetoSubasta);
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
            return listaSubastas;
        }
        public void crearComentarioAVendedor(Subastas subasta)
        {
            try
            {

                comando = new NpgsqlCommand("insertarComentarioAVendedor", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("idsubasta", subasta.IdSubasta);
                comando.Parameters.AddWithValue("comentario", subasta.ComentarioAVendedor);
                comando.Parameters.AddWithValue("evaluacion", subasta.Evaluacion);

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
        public void crearComentarioAComprador(int idSubasta, string comentario, int evaluacion)
        {
            try
            {

                comando = new NpgsqlCommand("insertarComentarioAComprador", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("idsubasta", idSubasta);
                comando.Parameters.AddWithValue("comentario", comentario);
                comando.Parameters.AddWithValue("evaluacion", evaluacion);

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
        public void subastarItem(Subastas subasta)
        {
            

                comando = new NpgsqlCommand("subastarItem", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("idusuario", subasta.IdUsuarioActual);
                comando.Parameters.AddWithValue("subcategoria", subasta.NombreSubCategoria);
                comando.Parameters.AddWithValue("descripcion", subasta.Descripcion);
                comando.Parameters.AddWithValue("formaentrega", subasta.FormaEntrega);
                comando.Parameters.AddWithValue("precioinicial", subasta.PrecioInicial);
                comando.Parameters.AddWithValue("fechainicio", subasta.FechaInicio);
                comando.Parameters.AddWithValue("fechafinal", subasta.FechaFinal);


                objConexion.getConexion().Open();
                comando.ExecuteNonQuery();
            //try { 
            try
            { }
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
        public bool find(Subastas objSubasta)
        {
            bool hayRegistros;
            try
            {
                comando = new NpgsqlCommand("buscarsubasta", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("pidsubasta", objSubasta.IdSubasta);
                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                hayRegistros = read.Read();
                if (hayRegistros)
                {
                    objSubasta.IdSubasta = Convert.ToInt32(read[0].ToString());
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
        public List<Subastas> infoVendedor(int idUsuario)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new NpgsqlCommand("mostrarinfovendedor", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.AddWithValue("pcedula", idUsuario);
                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Subastas objetoSubasta = new Subastas
                    {
                        NombreComprador = read[0].ToString(),
                        NombreVendedor = read[1].ToString(),
                        ComentarioAVendedor = read[2].ToString(),
                        Evaluacion = Convert.ToInt32(read[3].ToString()),

                    };
                    listaSubastas.Add(objetoSubasta);
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
            return listaSubastas;
        }
        public List<Subastas> infoComprador(int idUsuario)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new NpgsqlCommand("mostrarinfocomprador", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.AddWithValue("pcedula", idUsuario);
                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Subastas objetoSubasta = new Subastas
                    {
                        NombreComprador = read[0].ToString(),
                        NombreVendedor = read[1].ToString(),
                        ComentarioAComprador = read[2].ToString(),
                        Evaluacion = Convert.ToInt32(read[3].ToString()),

                    };
                    listaSubastas.Add(objetoSubasta);
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
            return listaSubastas;
        }
        public bool findVariablesSistema(Subastas subasta)
        {
            bool hayRegistros;
            try
            {
                comando = new NpgsqlCommand("buscarVariablesSistema", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                //comando.Parameters.AddWithValue("pid", objetoUsuario.IdUsuario);
                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                hayRegistros = read.Read();
                if (hayRegistros)
                {
                    subasta.PorcentajeMejora = Convert.ToInt32(read[0].ToString());
                    subasta.PrecioMinimo = Convert.ToDecimal(read[1].ToString());
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
        public void updateVarialeSistemas(Subastas subasta)
        {
            //try
            //{

            comando = new NpgsqlCommand("editarVariablesSistema", objConexion.getConexion());
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("porcentajemejora", subasta.PorcentajeMejora);
            comando.Parameters.AddWithValue("preciominimo", subasta.PrecioMinimo);

     
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
    }
}