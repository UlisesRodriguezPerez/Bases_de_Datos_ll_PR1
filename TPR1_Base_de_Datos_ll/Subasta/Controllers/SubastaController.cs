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
        public ActionResult comentarioAVendedor(int Id)
        {
            Subastas subasta = new Subastas(Id);
            //objetoSubasta.find(subasta);
            subasta.IdSubasta = Id;
            return View(subasta);
        }

        [HttpPost]
        public ActionResult comentarioAVendedor(Subastas subasta, int Id)
        {
            subasta.IdSubasta = Id;
            
            objetoSubasta.crearComentarioAVendedor(subasta);
            return RedirectToAction("Inicio/"+Id);
        }


        [HttpGet]
        public ActionResult comentarioAComprador(int Id)
        {
            Subastas subasta = new Subastas(Id);
            //objetoSubasta.find(subasta);
            subasta.IdSubasta = Id;
            return View(subasta);
        }

        [HttpPost]
        public ActionResult comentarioAComprador(Subastas subasta, int Id)
        {
            subasta.IdSubasta = Id;

            objetoSubasta.crearComentarioAComprador(subasta);
            return RedirectToAction("Inicio");
        }
        [HttpGet]
        public ActionResult SubastarItem(int Id)
        {
            Subastas subasta = new Subastas(Id);
            //objetoSubasta.find(subasta);
            subasta.IdUsuarioActual = Id;
            return View(subasta);
        }
        public ActionResult SubastarItem(Subastas subasta, int Id)
        {
            subasta.IdUsuarioActual = Id;
            objetoSubasta.subastarItem(subasta);
            return RedirectToAction("Inicio/"+Id);
        }
        //[HttpGet]
        //public ActionResult findInfoVendedor(int ID)
        //{
           
        //    Subastas objSubasta = new Subastas(ID);
        //    objetoSubasta.find(objSubasta);
        //    return View(objSubasta);
        //}

        //[HttpPost]
        //public ActionResult findInfoVendedor(string ID)
        //{
        //    return RedirectToAction("Inicio" + ID);
        //}


        [HttpGet]
        public ActionResult findInfoVendedor(int Id)
        {
            List<Subastas> lista = objetoSubasta.infoVendedor(Id);
            return View(lista);
        }
    }
}