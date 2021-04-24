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
        private OracleCommand comando;

        private ConexionOracle objConexionOracle;


        public PujaDao()
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
        public void pujar( decimal incremento, int idSubasta, int idUsuario)
        {
            try
            {

                comando = new OracleCommand("pujar", objConexionOracle.getConexionOracle());
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.Add("idsubasta", idSubasta);
                comando.Parameters.Add("idusuariopujador", idUsuario);
                comando.Parameters.Add("incremento", incremento);
                //comando.Parameters.Add("preciofinal", puja.PrecioFinal);
                //comando.Parameters.Add("fechasubida", puja.FechaSubida);

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

        //public Decimal buscarMinimoIncremento(Puja puja)
        //{
        //    bool hayRegistros;
        //    int precioMinimo = 0;
        //    try
        //    {
        //        comando = new OracleCommand("obtenerPrecioMinimoPuja", objConexionOracle.getConexionOracle());
        //        comando.CommandType = CommandType.StoredProcedure;
        //        comando.Parameters.Add("pidsubasta", puja.IdSubasta);
        //        objConexionOracle.getConexionOracle().Open();
        //        OracleDataReader read = comando.ExecuteReader();
        //        hayRegistros = read.Read();
        //        if (hayRegistros)
        //        {
        //            precioMinimo =  Convert.ToInt32(read[0].ToString());


        //        }
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //    finally
        //    {
        //        objConexionOracle.getConexionOracle().Close();
        //        objConexionOracle.cerrarConexionOracle();
        //    }
        //    return precioMinimo;
        //}
    }
}