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
    public class PujaDao
    {
        private Conexion objConexion;
        private NpgsqlCommand comando;

        private ConexionOracle objConexionOracle;
        private OracleCommand comandoOracle;


        public PujaDao()
        {
            //obtenerIP();
            objConexion = Conexion.saberEstado();
            objConexionOracle = ConexionOracle.saberEstado();
        }

        public void pujar(Puja puja)
        {
            try
            {

                comando = new NpgsqlCommand("pujar", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("idsubasta", puja.IdSubasta);
                comando.Parameters.AddWithValue("idusuariopujador", puja.IdUsuarioActual);
                comando.Parameters.AddWithValue("incremento", puja.Incremento);
                comando.Parameters.AddWithValue("preciofinal", puja.PrecioFinal);
                comando.Parameters.AddWithValue("fechasubida", puja.FechaSubida);

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
        public Decimal buscarMinimoIncremento(Puja puja)
        {
            bool hayRegistros;
            int precioMinimo = 0;
            try
            {
                comando = new NpgsqlCommand("obtenerPrecioMinimoPuja", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("pidsubasta", puja.IdSubasta);
                objConexion.getConexion().Open();
                NpgsqlDataReader read = comando.ExecuteReader();
                hayRegistros = read.Read();
                if (hayRegistros)
                {
                    precioMinimo =  Convert.ToInt32(read[0].ToString());


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
            return precioMinimo;
        }
    }
}