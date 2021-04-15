using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using model.entity;
using model.dao;

namespace Subasta.Controllers
{
    public class SubastaController : Controller
    {
        private SubastaDao objetoSubasta;

        public SubastaController()
        {
            objetoSubasta = new SubastaDao();
        }

        // GET: Subasta
        
        public ActionResult Inicio()
        {
            List<Subastas> lista = objetoSubasta.buscarSubastasActivas();
            //objetoSubasta.Name = name;
            return View(lista);
        }
        public ActionResult Todas()
        {
            List<Subastas> lista = objetoSubasta.buscarTodasSubastas();
            //objetoSubasta.Name = name;
            return View(lista);
        }
        [HttpGet]
        public ActionResult Subastadas(int Id)
        {
            List<Subastas> lista = objetoSubasta.subastadas(Id);
            return View(lista);
        }
        public ActionResult Compradas(int Id)
        {
            List<Subastas> lista = objetoSubasta.compradas(Id);
            return View(lista);
        }
        [HttpGet]
        public ActionResult comentarioAVendedor()
        {
            return View();
        }

        [HttpPost]
        public ActionResult comentarioAVendedor(Subastas subasta)
        {
            objetoSubasta.crearComentarioAVendedor(subasta);
            return RedirectToAction("Inicio");
        }
    }
}