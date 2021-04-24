using model.dao;
using model.entity;
using System.Collections.Generic;
using System.Web.Mvc;

namespace Subasta.Controllers
{
    public class SubastaController : Controller
    {
        private SubastaDao objetoSubasta;
        private PujaDao objetoPuja;

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

        [HttpPost]
        public ActionResult Categorias()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Categorias(int Id)
        {
            List<Subastas> lista = objetoSubasta.buscarCategoriass(Id);
            return View(lista);
        }
        //[HttpPost]
        //public ActionResult SubCategoria()
        //{
        //    return View();
        //}
        [HttpPost]
        public ActionResult SubCategorias(int idusuario, int idcategoria)
        {
            List<Subastas> lista = objetoSubasta.buscarSubCategorias(idusuario, idcategoria);

            return View(lista);
        }
        [HttpGet]
        public ActionResult SubCategorias()
        {
            return View();
        }
        [HttpPost]
        public ActionResult filtarSubastasSubCategoria(int idusuario, int idSubCategoria)
        {
            List<Subastas> lista = objetoSubasta.buscarSubastasActivasSubCategorias(idusuario, idSubCategoria);

            return View(lista);
        }
        [HttpGet]
        public ActionResult filtarSubastasSubCategoria()
        {
            return View();
        }
        [HttpPost]
        public ActionResult historialPujas()
        {
            return View();
        }
        [HttpGet]
        public ActionResult historialPujas(int Id)
        {
            List<Subastas> lista = objetoSubasta.buscarhistorialPujas(Id);
            //objetoSubasta.Name = name;
            return View(lista);
        }

        [HttpPost]
        public ActionResult Vencidas()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Vencidas(int Id)
        {
            List<Subastas> lista = objetoSubasta.buscarSubastasVencidas(Id);
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
            return RedirectToAction("../Menu/Inicio");
        }


        // [HttpGet]
        // public ActionResult comentarioAComprador(int Id)
        // {
        //     Subastas subasta = new Subastas(Id);
        //     //objetoSubasta.find(subasta);
        //     subasta.IdSubasta = Id;
        //     return View(subasta);
        // }

        // [HttpPost]
        //// [HttpGet]
        // public ActionResult comentarioACompradorr(int IdSubasta, string comentario, int evaluacion, int idUsuario)//Subastas subasta, int Id)
        // {
        //     //subasta.IdSubasta = Id;

        //     objetoSubasta.crearComentarioAComprador(IdSubasta, comentario,evaluacion);
        //     return RedirectToAction("../Menu/Inicio");
        // }
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
            return RedirectToAction("../Menu/Inicio");
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
        [HttpGet]
        public ActionResult findInfoComprador(int Id)
        {
            List<Subastas> lista = objetoSubasta.infoComprador(Id);
            return View(lista);
        }
        
        [HttpGet]
        public ActionResult VariableSistemas()
        {
            Subastas subasta = new Subastas();
            objetoSubasta.findVariablesSistema(subasta);
            return View(subasta);
        }

        [HttpPost]
        public ActionResult VariableSistemas(Subastas subasta)
        {
            objetoSubasta.updateVarialeSistemas(subasta);
            return RedirectToAction("../Menu/MenuAdmin/");
        }
    }
}