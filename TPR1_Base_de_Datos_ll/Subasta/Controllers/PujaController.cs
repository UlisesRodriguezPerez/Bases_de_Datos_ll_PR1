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
        public ActionResult Pujar(Subastas subasta)
        {
            int Id = subasta.IdSubasta;
            Puja puja = new Puja(Id);
            puja.IdUsuarioActual = subasta.IdUsuarioActual;
            puja.IdSubasta = Id;
            puja.Incremento = subasta.Incremento;
            //puja.IdSubasta = Id;
            //subasta = new Subastas(Id);
            //puja.IdUsuarioActual = subasta.IdUsuarioActual;
            //decimal minimoIncremento = objetoPuja.buscarMinimoIncremento(puja);
            decimal minimoIncremento = 100000;
            if (puja.Incremento >= minimoIncremento){
                objetoPuja.pujar(puja);
            }
            else
            {
                
            }
            
            return RedirectToAction("vdf/" + Id);
        }

    }
}