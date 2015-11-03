using FOCIMIRS.Filters;
using FOCIMIRS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FOCIMIRS.Controllers
{
    public class LoginController : Controller
    {
        public ActionResult Login()
        {
            ViewBag.error = "";
            return View();
        }
        [HttpPost]
        public ActionResult Login(string Name, string Pass) 
        {   
            if (Usuarios.CheckUser(Name, Pass))
            {
                Session.Add("Usuarioid", Name);
                return RedirectToAction("Index","Home");
            }
            else {
                ViewBag.error = "Usuario o contraseña no es valida";
                return View();
            }
        }
	}
}