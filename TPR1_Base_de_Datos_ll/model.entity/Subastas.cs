using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.entity
{
    public class Subastas
    {
        //Creamos los atributos de la clase.
        private int idSubasta;
        private string nombreVendedor;
        private string nombreComprador;
        private string nombreSubCategoria;
        private string nombreCategoria;
        private int idVendedor;
        private int idComprador;
        private int idSubCategoria;
        private int idCategoria;
        private string descripcion;
        private string formaEntrega;
        private decimal precioInicial;
        private DateTime fechaInicio;
        private DateTime fechaFinal;
        private string comentarioAVendedor;
        private string comentarioAComprador;
        private int evaluacion;
        private string aliasComprador;
        private string aliasVendedor;
        private int idUsuarioActual;

        private decimal incremento;
        private decimal precioFinal;
        private DateTime fechaSubida;

        private int porcentajeMejora;
        private decimal precioMinimo;
        private string nombreUsuarioActual;


        public Subastas() { }

        //Creamos un constructor con la llave primaria.
        public Subastas(int pIdSubasta)
        {
            this.idSubasta = pIdSubasta;
        }

        //Constructor con todos los campos.
        public Subastas(int idSubasta, int idVendedor, int idComprador, int idSubCategoria,
                        string descripcion, string formaEntrega, decimal precioInicial,
                        DateTime fechaInicio, DateTime fechaFinal, string nombreVendedor, string nombreComprador,
                        string nombreSubCategoria, string nombreCategoria, int idCategoria, string comentarioAVendedor, string comentarioAComprador, int evaluacion,
                        string aliasComprador, string aliasVendedor, int idUsuarioActual, decimal incremento, decimal precioFinal, DateTime fechaSubida, int porcentajeMejora,
                        decimal precioMinimo, string nombreUsuarioActual)
        {
            this.idSubasta = idSubasta;
            this.idVendedor = idVendedor;
            this.idComprador = idComprador;
            this.idSubCategoria = idSubCategoria;
            this.descripcion = descripcion;
            this.formaEntrega = formaEntrega;
            this.precioInicial = precioInicial;
            this.fechaInicio = fechaInicio;
            this.fechaFinal = fechaFinal;
            this.nombreVendedor = nombreVendedor;
            this.nombreComprador = nombreComprador;
            this.nombreSubCategoria = nombreSubCategoria;
            this.nombreCategoria = nombreCategoria;
            this.idCategoria = idCategoria;
            this.comentarioAVendedor = comentarioAVendedor;
            this.comentarioAComprador = comentarioAComprador;
            this.evaluacion = evaluacion;
            this.aliasComprador = aliasComprador;
            this.aliasVendedor = aliasVendedor;
            this.idUsuarioActual = idUsuarioActual;
            this.incremento = incremento;
            this.precioFinal = precioFinal;
            this.fechaSubida = fechaSubida;
            this.porcentajeMejora = porcentajeMejora;
            this.precioMinimo = precioMinimo;
            this.nombreUsuarioActual = nombreUsuarioActual;
        }

        public int IdSubasta { get => idSubasta; set => idSubasta = value; }
        public int IdVendedor { get => idVendedor; set => idVendedor = value; }
        public int IdComprador { get => idComprador; set => idComprador = value; }
        public int IdSubCategoria { get => idSubCategoria; set => idSubCategoria = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public string FormaEntrega { get => formaEntrega; set => formaEntrega = value; }
        public decimal PrecioInicial { get => precioInicial; set => precioInicial = value; }
        public DateTime FechaInicio { get => fechaInicio; set => fechaInicio = value; }
        public DateTime FechaFinal { get => fechaFinal; set => fechaFinal = value; }
        public string NombreVendedor { get => nombreVendedor; set => nombreVendedor = value; }
        public string NombreComprador { get => nombreComprador; set => nombreComprador = value; }
        public string NombreSubCategoria { get => nombreSubCategoria; set => nombreSubCategoria = value; }
        public string NombreCategoria { get => nombreCategoria; set => nombreCategoria = value; }
        public int IdCategoria { get => idCategoria; set => idCategoria = value; }
        public string ComentarioAVendedor { get => comentarioAVendedor; set => comentarioAVendedor = value; }
        public string ComentarioAComprador { get => comentarioAComprador; set => comentarioAComprador = value; }
        public int Evaluacion { get => evaluacion; set => evaluacion = value; }
        public string AliasComprador { get => aliasComprador; set => aliasComprador = value; }
        public string AliasVendedor { get => aliasVendedor; set => aliasVendedor = value; }
        public int IdUsuarioActual { get => idUsuarioActual; set => idUsuarioActual = value; }
        public decimal Incremento { get => incremento; set => incremento = value; }
        public decimal PrecioFinal { get => precioFinal; set => precioFinal = value; }
        public DateTime FechaSubida { get => fechaSubida; set => fechaSubida = value; }
        public int PorcentajeMejora { get => porcentajeMejora; set => porcentajeMejora = value; }
        public decimal PrecioMinimo { get => precioMinimo; set => precioMinimo = value; }
        public string NombreUsuarioActual { get => nombreUsuarioActual; set => nombreUsuarioActual = value; }
    }
}