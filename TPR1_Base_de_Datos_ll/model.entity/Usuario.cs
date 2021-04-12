using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.entity
{
    public class Usuario
    {
        //Creamos los atributos de la clase.
        private int idUsuario;
        private string nombreUsuario;
        private string primerApellido;
        private string segundoApellido;
        private string alias;
        private string correo;
        private string password;
        private int cuantosSubastados;
        private int cuantosComprados;
        private bool esAdmin;


        public Usuario() { }

        //Creamos un constructor con la llave primaria.
        public Usuario(int pIdUsuario)
        {
            this.idUsuario = pIdUsuario;
        }

        //Constructor con todos los campos.
        public Usuario(int pIdUsuario, string pNombreUsuario, string pPrimerApellido, string pSegundoApellido, string pAlias, 
                        string pCorreo, string pPassword, int pCuantosSubastados, int pCuantosComprados, bool pEsAdmin)
        {
            this.idUsuario = pIdUsuario;
            this.nombreUsuario = pNombreUsuario;
            this.primerApellido = pPrimerApellido;
            this.segundoApellido = pSegundoApellido;
            this.alias = pAlias;
            this.correo = pCorreo;
            this.password = pPassword;
            this.cuantosSubastados = pCuantosSubastados;
            this.cuantosComprados = pCuantosComprados;
            this.esAdmin = pEsAdmin;
        }

        //getters and setters
        public int IdUsuario { get => idUsuario; set => idUsuario = value; }
        public string NombreUsuario { get => nombreUsuario; set => nombreUsuario = value; }
        public string PrimerApellido { get => primerApellido; set => primerApellido = value; }
        public string SegundoApellido { get => segundoApellido; set => segundoApellido = value; }
        public string Alias { get => alias; set => alias = value; }
        public string Correo { get => correo; set => correo = value; }
        public string Password { get => password; set => password = value; }
        public int CuantosSubastados { get => cuantosSubastados; set => cuantosSubastados = value; }
        public int CuantosComprados { get => cuantosComprados; set => cuantosComprados = value; }
        public bool EsAdmin { get => esAdmin; set => esAdmin = value; }
    }
}