
//using Oracle.ManagedDataAccess.Client;
using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
//using System.Data.OracleClient;
//using System.Data.OracleClient;
//using System.Data.OracleClient;
// Librería para usar comandos sql
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.dao
{
    public class ConexionOracle
    {
        //patron singleton
        private static ConexionOracle objConexionOracle = null;
        private OracleConnection conexionOracle;

        //Constructor donde agregaremos la cadena de conexión con SqlServer.
        private ConexionOracle()
        {
            //string conexion = System.Configuration. ConfigurationManager.AppSettings["Data Source=CursoBases2;User Id=ULISES;Password=12345;Integrated Security=no;"].ToString();
            //Data Source = MyOracleDB; User Id = myUsername; Password = myPassword; Integrated Security = no;
            conexionOracle = new OracleConnection("Data Source=orcl;User Id=ULISES;Password=12345;");
            //connectionString = "Server=localhost;Port=5432;DataBase=Bases2_Prueba;Uid=Bases de datos;Pwd=1234" 
        }


        public static ConexionOracle saberEstado()
        {
            if (objConexionOracle == null)
            {
                objConexionOracle = new ConexionOracle();
            }
            return objConexionOracle;
        }

        public OracleConnection getConexionOracle()
        {
            return conexionOracle;
        }
        public void cerrarConexionOracle()
        {
            objConexionOracle = null;
        }
    }
}
