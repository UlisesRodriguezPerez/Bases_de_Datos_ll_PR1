using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using model.entity;
using model.dao;

namespace Subasta.Controllers
{
    public class MenuController : Controller
    {
        private UsuarioDao objetoUsuario;
        public MenuController()
        {
            objetoUsuario = new UsuarioDao();
        }
        // GET: Menu
        [HttpGet]
        public ActionResult Inicio()
        {
            try
            {
                return View();
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult Verify(Usuario usuario)
        {
            try
            {
                string pass = Encrypt.GetSHA256(usuario.Password);
                usuario.Password = pass;
                string tipo = objetoUsuario.verificar(usuario);
                //System.Diagnostics.Debug.WriteLine(tipo);
                if (tipo == "Admin")
                {
                    return RedirectToAction("/MenuAdmin/" + usuario.IdUsuario);
                }
                else if (tipo == "Normal")
                {
                    //user = new Usuario();
                    return RedirectToAction("/MenuNormal/" + usuario.IdUsuario);
                }
                else
                {
                    usuario = new Usuario();
                    return RedirectToAction("/Inicio/");
                }
            }
            catch
            {
                return RedirectToAction("/Inicio/");
            }
        }
        [HttpGet]
        public ActionResult MenuAdmin()
        {
            //Usuario usuario = new Usuario(ID);
            //objetoUsuario.find(usuario);
            return View();
        }

        [HttpGet]
        public ActionResult MenuNormal(int Id) //int Id
        {
            //List<CuentaAhorro> lista = objetoUsuario.findAllCuentaAhorro(Id);
            Usuario user = new Usuario(Id);
            string username = user.NombreUsuario;
            return View(user);  //lista
        }
        [HttpPost]
        public ActionResult MenuNormal(Usuario user, int ID)
        {
            try
            {

                user.IdUsuario = ID;

                return RedirectToAction("Menu/MenuNormal/" + ID);
            }
            catch
            {
                ViewBag.ErrorMessage = "Error al obtener el usuario, para ver el error consulta la tabla de manejo de errores en la Base de datos";
                return View();
            }
        }
    }
}