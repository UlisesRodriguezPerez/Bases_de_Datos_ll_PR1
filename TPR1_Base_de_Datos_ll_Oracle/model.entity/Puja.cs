using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.entity
{
    public class Puja : Subastas
    {
        //Creamos los atributos de la clase.
        private int idPuja;
        //private int idSubasta;
        //private int idUsuario;
        private decimal incremento;
        private decimal precioFinal;
        private DateTime fechaSubida;
        private bool fueCompra;

        //Creamos un constructor con la llave primaria.
        public Puja(int pIdPuja)
        {
            this.idPuja = pIdPuja;
        }
        
        public Puja(int idPuja, decimal incremento, decimal precioFinal, DateTime fechaSubida, bool fueCompra)
        {
            this.idPuja = idPuja;
            //this.idSubasta = idSubasta;
            //this.idUsuario = idUsuario;
            this.incremento = incremento;
            this.precioFinal = precioFinal;
            this.fechaSubida = fechaSubida;
            this.fueCompra = fueCompra;
        }
        public int IdPuja { get => idPuja; set => idPuja = value; }
        //public int IdSubasta { get => idSubasta; set => idSubasta = value; }
        //public int IdUsuario { get => idUsuario; set => idUsuario = value; }
        public decimal Incremento { get => incremento; set => incremento = value; }
        public decimal PrecioFinal { get => precioFinal; set => precioFinal = value; }
        public DateTime FechaSubida { get => fechaSubida; set => fechaSubida = value; }
        public bool FueCompra { get => fueCompra; set => fueCompra = value; }
    }
}