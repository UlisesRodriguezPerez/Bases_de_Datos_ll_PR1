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
        private OracleCommand comando;

        private ConexionOracle objConexionOracle;


        public SubastaDao()
        {
            //obtenerIP();
            objConexionOracle = ConexionOracle.saberEstado();
        }
        public Boolean convertir(string bit)
        {
            if (bit == "1")
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        public List<Subastas> buscarSubastasActivas(int Id)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new OracleCommand("mostrarsubastasactivas", objConexionOracle.getConexionOracle())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.Add(new OracleParameter("P_CURSOR", OracleDbType.RefCursor)).Direction = System.Data.ParameterDirection.Output;
                objConexionOracle.getConexionOracle().Open();
                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return listaSubastas;
        }
        public List<Subastas> buscarSubastasActivasSubCategorias(int idUsuario, int idSubCategoria)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new OracleCommand("mostrarsubastasactivassubcategorias", objConexionOracle.getConexionOracle())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.Add("idsubcategoria", idSubCategoria);
                comando.Parameters.Add(new OracleParameter("P_CURSOR", OracleDbType.RefCursor)).Direction = System.Data.ParameterDirection.Output;
                objConexionOracle.getConexionOracle().Open();
                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return listaSubastas;
        }
        public List<Subastas> buscarCategoriass(int Id)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new OracleCommand("mostrarcategorias", objConexionOracle.getConexionOracle())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.Add(new OracleParameter("P_CURSOR", OracleDbType.RefCursor)).Direction = System.Data.ParameterDirection.Output;
                objConexionOracle.getConexionOracle().Open();
                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return listaSubastas;
        }

        public List<Subastas> buscarSubCategorias(int idUsuario, int idCategoria)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new OracleCommand("mostrarsubcategorias", objConexionOracle.getConexionOracle())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.Add("idcategoria", idCategoria);
                comando.Parameters.Add(new OracleParameter("P_CURSOR", OracleDbType.RefCursor)).Direction = System.Data.ParameterDirection.Output;
                objConexionOracle.getConexionOracle().Open();
                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return listaSubastas;
        }
        public List<Subastas> buscarhistorialPujas(int Id)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new OracleCommand("mostrarhistorialpujas", objConexionOracle.getConexionOracle())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.Add("idsubasta", Id);
                comando.Parameters.Add(new OracleParameter("P_CURSOR", OracleDbType.RefCursor)).Direction = System.Data.ParameterDirection.Output;
                objConexionOracle.getConexionOracle().Open();
                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return listaSubastas;
        }
        
        public List<Subastas> buscarSubastasVencidas(int Id)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new OracleCommand("mostrarsubastasvencidas", objConexionOracle.getConexionOracle())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.Add(new OracleParameter("P_CURSOR", OracleDbType.RefCursor)).Direction = System.Data.ParameterDirection.Output;
                objConexionOracle.getConexionOracle().Open();
                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return listaSubastas;
        }

        public List<Subastas> buscarTodasSubastas()
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new OracleCommand("mostrartodassubastas", objConexionOracle.getConexionOracle())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.Add(new OracleParameter("P_CURSOR", OracleDbType.RefCursor)).Direction = System.Data.ParameterDirection.Output;
                objConexionOracle.getConexionOracle().Open();
                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return listaSubastas;
        }
        public List<Subastas> subastadas(int idUsuario)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new OracleCommand("mostrarsubastadas", objConexionOracle.getConexionOracle())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.Add("pcedula", idUsuario);
                comando.Parameters.Add(new OracleParameter("P_CURSOR", OracleDbType.RefCursor)).Direction = System.Data.ParameterDirection.Output;
                objConexionOracle.getConexionOracle().Open();
                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return listaSubastas;
        }
        public List<Subastas> compradas(int idUsuario)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new OracleCommand("mostrarcompradas", objConexionOracle.getConexionOracle())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.Add("pcedula", idUsuario);
                comando.Parameters.Add(new OracleParameter("P_CURSOR", OracleDbType.RefCursor)).Direction = System.Data.ParameterDirection.Output;
                objConexionOracle.getConexionOracle().Open();
                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return listaSubastas;
        }
        public void crearComentarioAVendedor(Subastas subasta)
        {
            try
            {

                comando = new OracleCommand("insertarComentarioAVendedor", objConexionOracle.getConexionOracle());
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.Add("idsubasta", subasta.IdSubasta);
                comando.Parameters.Add("comentario", subasta.ComentarioAVendedor);
                comando.Parameters.Add("evaluacion", subasta.Evaluacion);

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
        public void crearComentarioAComprador(Subastas subasta)
        {
            try
            {

                comando = new OracleCommand("insertarcomentarioacomprador", objConexionOracle.getConexionOracle());
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.Add("idsubasta", subasta.IdSubasta);
                comando.Parameters.Add("comentario", subasta.ComentarioAComprador);
                comando.Parameters.Add("evaluacion", subasta.Evaluacion);

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
        public void subastarItem(Subastas subasta)
        {
            

                comando = new OracleCommand("subastarItem", objConexionOracle.getConexionOracle());
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.Add("idusuario", subasta.IdUsuarioActual);
                comando.Parameters.Add("subcategoria", subasta.NombreSubCategoria);
                comando.Parameters.Add("descripcion", subasta.Descripcion);
                comando.Parameters.Add("formaentrega", subasta.FormaEntrega);
                comando.Parameters.Add("precioinicial", subasta.PrecioInicial);
                comando.Parameters.Add("fechainicio", subasta.FechaInicio);
                comando.Parameters.Add("fechafinal", subasta.FechaFinal);


                objConexionOracle.getConexionOracle().Open();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
        }
        public bool find(Subastas objSubasta)
        {
            bool hayRegistros;
            try
            {
                comando = new OracleCommand("buscarsubasta", objConexionOracle.getConexionOracle());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.Add("pidsubasta", objSubasta.IdSubasta);
                objConexionOracle.getConexionOracle().Open();
                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return hayRegistros;
        }
        public List<Subastas> infoVendedor(int idUsuario)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new OracleCommand("mostrarinfovendedor", objConexionOracle.getConexionOracle())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.Add("pcedula", idUsuario);
                comando.Parameters.Add(new OracleParameter("P_CURSOR", OracleDbType.RefCursor)).Direction = System.Data.ParameterDirection.Output;
                objConexionOracle.getConexionOracle().Open();
                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return listaSubastas;
        }
        public List<Subastas> infoComprador(int idUsuario)
        {
            List<Subastas> listaSubastas = new List<Subastas>();
            try
            {
                comando = new OracleCommand("mostrarinfocomprador", objConexionOracle.getConexionOracle())
                {
                    CommandType = CommandType.StoredProcedure
                };
                comando.Parameters.Add("pcedula", idUsuario);
                comando.Parameters.Add(new OracleParameter("P_CURSOR", OracleDbType.RefCursor)).Direction = System.Data.ParameterDirection.Output;
                objConexionOracle.getConexionOracle().Open();
                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return listaSubastas;
        }
        public bool findVariablesSistema(Subastas subasta)
        {
            bool hayRegistros;
            try
            {
                comando = new OracleCommand("buscarVariablesSistema", objConexionOracle.getConexionOracle());
                comando.CommandType = CommandType.StoredProcedure;
                //comando.Parameters.Add("pid", objetoUsuario.IdUsuario);
                comando.Parameters.Add(new OracleParameter("P_CURSOR", OracleDbType.RefCursor)).Direction = System.Data.ParameterDirection.Output;
                objConexionOracle.getConexionOracle().Open();
                OracleDataReader read = comando.ExecuteReader();
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
                objConexionOracle.getConexionOracle().Close();
                objConexionOracle.cerrarConexionOracle();
            }
            return hayRegistros;
        }
        public void updateVarialeSistemas(Subastas subasta)
        {
            //try
            //{

            comando = new OracleCommand("editarVariablesSistema", objConexionOracle.getConexionOracle());
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.Add("porcentajemejora", subasta.PorcentajeMejora);
            comando.Parameters.Add("preciominimo", subasta.PrecioMinimo);

     
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
    }
}