using Npgsql;
using System;
using System.Collections.Generic;

// Librería para usar comandos sql
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.dao
{
    public class Conexion
    {
        //patron singleton
        private static Conexion objConexion = null;
        private NpgsqlConnection conexion;

        //Constructor donde agregaremos la cadena de conexión con SqlServer.
        private Conexion()
        {
            conexion = new NpgsqlConnection("Server=localhost;Port=5432;DataBase=Bases2_Prueba;Uid=postgres;Pwd=1234");
            //connectionString = "Server=localhost;Port=5432;DataBase=Bases2_Prueba;Uid=Bases de datos;Pwd=1234" 
        }


        public static Conexion saberEstado()
        {
            if (objConexion == null)
            {
                objConexion = new Conexion();
            }
            return objConexion;
        }

        public NpgsqlConnection getConexion()
        {
            return conexion;
        }
        public void cerrarConexion()
        {
            objConexion = null;
        }
    }
}