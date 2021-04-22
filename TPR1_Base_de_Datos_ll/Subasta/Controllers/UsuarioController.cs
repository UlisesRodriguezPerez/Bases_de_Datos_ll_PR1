using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using model.entity;
using model.dao;

namespace Subasta.Controllers
{
    public class UsuarioController : Controller
    {
        private static int idUs = 0;
        //private static string nombre = "";
        private UsuarioDao objetoUsuario;

        public UsuarioController()
        {
            objetoUsuario = new UsuarioDao();
        }

        // GET: Usuario
        public ActionResult Inicio()
        {
            List<Usuario> lista = objetoUsuario.findAll();
            //objetoUsuario.Name = name;
            return View(lista);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Usuario objUsuario)
        {
            string enc = Encrypt.GetSHA256(objUsuario.Password);
            objUsuario.Password = enc;
            //string a = enc;
            objetoUsuario.create(objUsuario);
            return RedirectToAction("Inicio");
        }

        [HttpGet]
        public ActionResult Find(int ID)
        {
            idUs = ID;
            Usuario objusuario = new Usuario(ID);
            objetoUsuario.find(objusuario);
            return View(objusuario);
        }

        [HttpPost]
        public ActionResult Find(string ID)
        {
            return RedirectToAction("Inicio" + ID);
        }

        [HttpGet]
        public ActionResult Update(int ID)
        {
            Usuario objusuario = new Usuario(ID);
            objetoUsuario.find(objusuario);
            return View(objusuario);
        }

        [HttpPost]
        public ActionResult Update(Usuario objusuario, int ID)
        {
            objusuario.IdUsuario = ID;
            objetoUsuario.update(objusuario);
            return RedirectToAction("Inicio");
        }

        public ActionResult Delete(Usuario objUsuario, int ID)
        {
            objUsuario.IdUsuario = ID;
            objetoUsuario.delete(objUsuario);
            return RedirectToAction("Inicio");
        }
    }
        
}