using model.dao;
using model.entity;
using System.Collections.Generic;
using System.Web.Mvc;

namespace Subasta.Controllers
{
    public class SubastaController : Controller
    {
        private SubastaDao objetoSubasta;

        public SubastaController()
        {
            objetoSubasta = new SubastaDao();
        }

        [HttpPost]
        public ActionResult Inicio()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Inicio(int Id)
        {
            List<Subastas> lista = objetoSubasta.buscarSubastasActivas(Id);
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
        [HttpGet]
        public ActionResult SubastarItem()
        {
            return View();
        }


        public ActionResult SubastarItem(Usuario objUsuario)
        {
            objetoSubasta.subastarItem(objUsuario);
            return RedirectToAction("Inicio");
        }
    }
}