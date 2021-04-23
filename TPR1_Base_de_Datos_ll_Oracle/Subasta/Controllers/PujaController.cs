using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using model.dao;
using model.entity;

namespace Subasta.Controllers
{
    public class PujaController : Controller
    {
        private PujaDao objetoPuja;

        public PujaController()
        {
            objetoPuja = new PujaDao();
        }
        // GET: Puja
        public ActionResult Index()
        {
            return View();
        }
        //[HttpGet]
        //public ActionResult Pujar(int Id)
        //{
        //    Subastas subasta = new Subastas(Id);

        //    Puja puja = new Puja(Id);
        //    //subasta.IdSubasta = Id;
        //    ////objetoSubasta.find(subasta);
        //    puja.IdSubasta = subasta.IdSubasta;
        //    puja.IdUsuarioActual = subasta.IdUsuarioActual;
        //    //puja.IdUsuarioActual = subasta.IdUsuarioActual;
        //    return View(puja);
        //}

        //[HttpPost]
        //public ActionResult Pujar(Subastas subasta, Puja puja, int Id)//,Subastas subasta)
        //{

        //    //puja.IdSubasta = Id;
        //    //subasta = new Subastas(Id);
        //    //puja.IdUsuarioActual = subasta.IdUsuarioActual;

        //    objetoPuja.pujar(puja);
        //    return RedirectToAction("Inicio/" + Id);
        //}

        [HttpPost]
        public ActionResult Pujar(decimal incremento, int idSubasta, int idUsuario)
        {
            //int Id = subasta.;
            //Puja puja = new Puja(Id);
            //puja.IdUsuarioActual = usuario;
            //puja.IdSubasta = subasta;
            //puja.Incremento = incremento;
            //puja.IdSubasta = Id;
            //subasta = new Subastas(Id);
            //puja.IdUsuarioActual = subasta.IdUsuarioActual;
            //decimal minimoIncremento = objetoPuja.buscarMinimoIncremento(puja);
            //decimal incremento = subasta.PrecioMinimo;
            objetoPuja.pujar(incremento,idSubasta,idUsuario);
        
            
            return RedirectToAction("../Menu/MenuNormal/" + idUsuario);
        }

    }
}