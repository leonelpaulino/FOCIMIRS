using FOCIMIRS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using Microsoft.Crm.Sdk;
using FOCIMIRS.Filters;

namespace FOCIMIRS.Controllers
{
    [AuthenticationAttribute]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EnviarCuestionario(FormCollection formc, string submitbutton)
        {
            amb_cuestionario_usuario x = new amb_cuestionario_usuario();
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            amb_usuario u = new amb_usuario();
            string val = formc["ComboBox"].ToString();
            amb_municipio mun = (from amb_municipio in db.amb_municipios where (amb_municipio.NOM_MUNICIPIO == formc["ComboBox"].ToString()) select amb_municipio).First();
            u = Usuarios.GetUser(Session["Usuarioid"].ToString());
            x.cuestionario_id = 1;
            x.usuario_id = Session["Usuarioid"].ToString();
            amb_cuestionario_lleno c = new amb_cuestionario_lleno();
            c.cuestionario_llenoid = CuestionarioLleno.idLast() + 1;
            c.amb_cuestionario_usuario = x;
            c.Etapa = 1;
            c.fecha = DateTime.Today;
            c.COD_MUNICIPIO = mun.COD_MUNICIPIO;
            c.COD_PERIODO = mun.COD_PERIODO;
            c.COD_PROVINCIA = mun.COD_PROVINCIA;
            c.COD_REGION = mun.COD_REGION;
            c.temp_cuestionario = submitbutton == "Enviar" ? false : true;
            u.amb_provincia.Alcalde = formc["InAlcalde"];
            formc.Remove("InAlcalde");
            u.amb_provincia.AlcaldeMail = formc["InAlcaldeMail"];
            formc.Remove("InAlcaldeMail");
            u.amb_provincia.AlcaldeTel = formc["InAlcaldeTel"];
            formc.Remove("InAlcaldeTel");
            u.amb_provincia.encargado_ugam = formc["InUgam"];
            formc.Remove("InUgam");
            u.amb_provincia.UgamMail = formc["InUgamMail"];
            formc.Remove("InUgamMail");
            u.amb_provincia.UgamTel = formc["InUgamTel"];
            formc.Remove("InUgamTel");
            u.amb_provincia.enc_de_ornato = formc["InOrnato"];
            formc.Remove("InOrnato");
            u.amb_provincia.OrnatoTel = formc["InOrnatoTel"];
            formc.Remove("InOrnatoTel");
            u.amb_provincia.OrnatoMail = formc["InOrnatoMail"];
            formc.Remove("InOrnatoMail");
            u.amb_provincia.director_provincial_de_MA = formc["InMA"];
            formc.Remove("InMA");
            u.amb_provincia.Director_PTel = formc["InMATel"];
            formc.Remove("InMATel");
            u.amb_provincia.Director_PMail = formc["InMAMail"];
            formc.Remove("InMAMail");
            Dictionary<string, List<object>> respuestas = new Dictionary<string, List<dynamic>>();
            Dictionary<string, object> aux = new Dictionary<string, object>();
            formc.Remove("ComboBox");
            foreach (var key in formc.AllKeys)
            {
                if (key == "ComboBox" || key == "submitbutton") continue;
                string auxss = formc[key];
                foreach (string i in auxss.Split(','))
                {
                    dynamic xs;
                    if (submitbutton == "Enviar")
                        xs = new amb_respuesta();
                    else
                        xs = new amb_respuestas_temp();
                    string value = i;
                    if (value[0] == 'r')
                    {

                        if (value.IndexOf('d') == -1)
                        {
                            xs.opcion_id = Int32.Parse(value.Substring(1));
                        }
                        else
                        {
                            xs.opcion_id = Int32.Parse(value.Substring(2));
                            int x1 = key.IndexOf('-') + 1;
                            int x2 = key.IndexOf('-', key.IndexOf('-') + 1) - x1;
                            xs.preguntaP_id = Int32.Parse(key.Substring(x1, x2));
                        }
                        xs.pregunta_id = Int32.Parse(key.Substring(0, key.IndexOf('-')));
                        if (value[0] == 'r')
                            value = value.Remove(0, 1);
                        if (value[0] == 'd')
                            value = value.Remove(0, 1);
                    }
                    else
                    {
                        xs.opcion_id = Int32.Parse(key.Substring(key.LastIndexOf('-') + 1));
                        string p_id = key;
                        if (key[0] == 'd')
                        {
                            p_id = p_id.Remove(0, 1);
                            int x1 = key.IndexOf('-') + 1;
                            int x2 = key.IndexOf('-', key.IndexOf('-') + 1) - x1;
                            xs.preguntaP_id = Int32.Parse(key.Substring(x1, x2));
                        }

                        xs.pregunta_id = Int32.Parse(p_id.Substring(0, p_id.IndexOf('-')));

                    }
                    xs.amb_cuestionario_lleno = c;
                    xs.respuesta = value;
                    aux[submitbutton] = xs;
                    if (submitbutton == "Enviar")
                        db.amb_respuestas.InsertOnSubmit((amb_respuesta)aux[submitbutton]);
                    else
                        db.amb_respuestas_temps.InsertOnSubmit((amb_respuestas_temp)aux[submitbutton]);
                }

            }



            db.amb_cuestionario_usuarios.InsertOnSubmit(x);
            db.amb_cuestionario_llenos.InsertOnSubmit(c);
            
            var count = db.ExecuteCommand(@"UPDATE [amb_provincias]
                                 SET [Alcalde] = '" + u.amb_provincia.Alcalde + @"'
                                ,[encargado_ugam] =  '" + u.amb_provincia.encargado_ugam + @"'
                                ,[director_provincial_de_MA] = '" + u.amb_provincia.director_provincial_de_MA + @"'
                                ,[enc_de_ornato] = '" + u.amb_provincia.enc_de_ornato + @"'
                                ,[AlcaldeTel] ='" + u.amb_provincia.AlcaldeTel + @"'
                                ,[AlcaldeMail] = '" + u.amb_provincia.AlcaldeMail + @"'
                                ,[UgamTel] = '" + u.amb_provincia.UgamTel + @"'
                                ,[UgamMail] = '" + u.amb_provincia.UgamMail + @"'
                                ,[Director_PTel] = '" + u.amb_provincia.Director_PTel + @"'
                                ,[Director_PMail] = '" + u.amb_provincia.Director_PMail + @"'
                                ,[OrnatoTel] = '" + u.amb_provincia.OrnatoTel + @"'
                                ,[OrnatoMail] = '" + u.amb_provincia.OrnatoMail + @"'
                                WHERE COD_PERIODO = '" + u.amb_provincia.COD_PERIODO + "' and COD_PROVINCIA = '" + u.amb_provincia.COD_PROVINCIA + "' and COD_REGION = '" + u.amb_provincia.COD_REGION + "'");

            amb_cuestionario_lleno cu = CuestionarioLleno.getLastTempCuestionario(mun);
            if (cu != null)
            {
                db.ExecuteCommand("DELETE FROM amb_respuestas_temp where cuestionario_lleno_id = " + cu.cuestionario_llenoid);
                db.ExecuteCommand("DELETE FROM amb_cuestionario_lleno where cuestionario_id = " + cu.cuestionario_llenoid);
            }
            db.SubmitChanges();
            return (RedirectToAction("Mensaje", "Home", submitbutton));
        }
        public ActionResult Mensaje(string Length)
        {
            if (Length == null)
                return View("Index");
            if (Length == "7")
                ViewBag.Men = "Su Cuestionario ha sido guardado";
            else if (Length == "6")
                ViewBag.Men = "Su Cuestionario ha sido enviado";
            else
            {
                ViewBag.Men = "Su informacion fue enviada";
            }
            return View();


        }
        public ActionResult ChangeDm(string id)
        {
            List<Seccion> secciones = new List<Seccion>(Seccion.getAll());
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            amb_municipio m = db.amb_municipios.Where(amb_municipio => amb_municipio.NOM_MUNICIPIO == id).First();
            amb_usuario user = Usuarios.GetUser(Session["Usuarioid"].ToString());
            List<amb_municipio> munis = new List<amb_municipio>(user.amb_provincia.amb_municipios.OrderBy(amb_municipio => amb_municipio.NOM_MUNICIPIO));
            amb_cuestionario_lleno cu = CuestionarioLleno.getLastTempCuestionario(m);
            //if (cu != null && (((DateTime)cu.fecha - DateTime.Now).TotalDays <= 30 || cu.amb_respuestas_temps.Count == 0)) {
            //    ((IDisposable)cu).Dispose();
            //}
            ViewBag.Mun = id;
            ViewBag.Municipios = munis;
            ViewBag.secciones = secciones;
            if (cu == null || cu.amb_respuestas_temps.Count == 0)
                ViewBag.SaveCu = null;
            else
                ViewBag.SaveCu = cu;
            //Noo mostrar los cuestinoario de un municipio con menos de 30 dias.
            ViewBag.User = user;

            return View("Cuestionario");

        }
        public ActionResult Print()
        {

            return View();
        }
        public ActionResult Cuestionario()
        {

            List<Seccion> secciones = new List<Seccion>(Seccion.getAll());

            amb_usuario user = Usuarios.GetUser(Session["Usuarioid"].ToString());
            List<amb_municipio> munis = new List<amb_municipio>(user.amb_provincia.amb_municipios.OrderBy(amb_municipio => amb_municipio.NOM_MUNICIPIO));
            amb_cuestionario_lleno cu = CuestionarioLleno.getLastTempCuestionario(munis.First());
            //if (cu != null && (((DateTime)cu.fecha - DateTime.Now).TotalDays <= 30 || cu.amb_respuestas_temps.Count == 0)) {
            //    ((IDisposable)cu).Dispose();
            //}
            ViewBag.Municipios = munis;
            ViewBag.secciones = secciones;
            if (cu == null || cu.amb_respuestas_temps.Count == 0)
                ViewBag.SaveCu = null;
            else
                ViewBag.SaveCu = cu;
            //Noo mostrar los cuestinoario de un municipio con menos de 30 dias.
            ViewBag.User = user;

            return View();
        }
        public ActionResult LogOff()
        {
            Session.Remove("Usuarioid");
            return RedirectToAction("Login", "Login");
        }
        public ActionResult Home()
        {
            return RedirectToAction("Index", "Home");
        }


    }
}