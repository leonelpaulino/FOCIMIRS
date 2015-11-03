using FOCIMIRS.Filters;
using FOCIMIRS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FOCIMIRS.Controllers
{
    [AuthenticationAttribute]
    public class CuestionarioController : Controller
    {
        private void listaProvincia(string prov = null)
        {

        }
        public ActionResult Index(string prov, string mun = null )
        {
            
            amb_usuario user = Usuarios.GetUser(Session["Usuarioid"].ToString());
            if (user.amb_role.rol_nombre == "Administrador" || user.amb_role.rol_nombre == "Encargado")
            {
                FOCIMIRSDataContext db = new FOCIMIRSDataContext();
                ViewBag.Provincias = db.amb_provincias.OrderBy(amb_provincia => amb_provincia.NOM_PROVINCIA).ToList();
                ViewBag.Prov = prov == null ? ViewBag.Provincias[0].NOM_PROVINCIA : prov;
                string provincia = ViewBag.Prov;
                ViewBag.Municipios = db.amb_municipios.Where(amb_municipio => amb_municipio.amb_provincia.NOM_PROVINCIA == provincia).OrderBy(amb_municipio => amb_municipio.NOM_MUNICIPIO).ToList();
   
                
            }
            else
            {

                ViewBag.Prov = user.amb_provincia.NOM_PROVINCIA;
                ViewBag.Municipios = user.amb_provincia.amb_municipios.OrderBy(amb_municipio => amb_municipio.NOM_MUNICIPIO).ToList();
                
            }
            List<amb_municipio> auxl = ViewBag.Municipios;
            ViewBag.Mun = mun == null ? auxl[0] : auxl.Where(amb_municipio=>amb_municipio.NOM_MUNICIPIO == mun).ToList()[0];
            List<amb_cuestionario_lleno> cuestionario = CuestionarioLleno.getAll(ViewBag.Mun);
            ViewBag.Cuestionarios = cuestionario;
            return View();
        }
        public ActionResult Details(int cuestionarioid)
        {
            ViewBag.Cuestionario = new FOCIMIRSDataContext().amb_cuestionario_llenos.Where(amb_cuestionario_lleno => amb_cuestionario_lleno.cuestionario_llenoid == cuestionarioid).ToList()[0];
            ViewBag.Cuestionarioid = cuestionarioid;
            ViewBag.Municipio = new FOCIMIRSDataContext().amb_cuestionario_llenos.Where(amb_cuestionario_lleno => amb_cuestionario_lleno.cuestionario_llenoid == cuestionarioid).First().amb_municipio.NOM_MUNICIPIO;
        
            return View();
        }
    }
}