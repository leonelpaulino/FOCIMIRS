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
    public class VehiculosController : Controller
    {
        //
        // GET: /Vehiculos/
        public ActionResult Index()
        {
                amb_usuario user = Usuarios.GetUser(Session["Usuarioid"].ToString());
                ViewBag.User = user;
                List<amb_municipio> aux = new List<amb_municipio>(user.amb_provincia.amb_municipios.OrderBy(amb_municipio => amb_municipio.NOM_MUNICIPIO));
                ViewBag.responsable = aux.First().responsable;
                ViewBag.vertedero = aux.First().vertedero;
                ViewBag.Municipios = aux;
                return View();
        }
        public ActionResult ChangeDm(string id) {

                amb_usuario user = Usuarios.GetUser(Session["Usuarioid"].ToString());
                ViewBag.User = user;
                FOCIMIRSDataContext db = new FOCIMIRSDataContext();
                List<amb_municipio> aux = new List<amb_municipio>(user.amb_provincia.amb_municipios.OrderBy(amb_municipio => amb_municipio.NOM_MUNICIPIO));
                amb_municipio aux1 = db.amb_municipios.Where(amb_municipio => amb_municipio.NOM_MUNICIPIO == id).First();
                ViewBag.responsable = aux1.responsable;
                ViewBag.vertedero = aux1.vertedero;
                ViewBag.Mun = aux1.NOM_MUNICIPIO;
                ViewBag.Municipios = aux;
                return View("Index");
        }
        [HttpPost]
        public ActionResult EnviarForm(FormCollection formc) 
        {
                FOCIMIRSDataContext db = new FOCIMIRSDataContext();
                amb_municipio m = new amb_municipio();
                m = db.amb_municipios.Where(amb_municipio => amb_municipio.NOM_MUNICIPIO == formc["ComboBox"]).FirstOrDefault();
                m.vertedero = formc["vertedero"];
                m.responsable = formc["responsable"];
                formc.Remove("vertedero");
                formc.Remove("ComboBox");
                formc.Remove("responsable");
                Dictionary<string, Tuple<amb_vehiculo, amb_viajes_mensuale>> vs = new Dictionary<string, Tuple<amb_vehiculo, amb_viajes_mensuale>>();
                foreach (string i in formc.AllKeys)
                {
                    if (i == "fecha1" || i == "fecha2" || i == "submitbutton")
                        continue;
                    if (!vs.ContainsKey(i[0].ToString()))
                    {
                        Tuple<amb_vehiculo, amb_viajes_mensuale> aux = new Tuple<amb_vehiculo, amb_viajes_mensuale>(new amb_vehiculo(), new amb_viajes_mensuale());
                        vs.Add(i[0].ToString(), aux);
                    }
                    switch (i[2])
                    {
                        case '1':
                            vs[i[0].ToString()].Item1.Tipo_residuos = formc[i];
                            break;
                        case '2':
                            vs[i[0].ToString()].Item1.amb_tipo_vehiculo = db.amb_tipo_vehiculos.Where(amb_tipo_vehiculo=>amb_tipo_vehiculo.id == Int32.Parse(formc[i])).First();
                            break;
                        case '3':
                            vs[i[0].ToString()].Item1.chasis = formc[i];
                            break;
                        case '4':
                            vs[i[0].ToString()].Item1.Capacidad = Double.Parse(formc[i]);
                            break;
                        case '5':
                            string d1 = formc["fecha1"];
                            string d2 = formc["fecha2"];
                            vs[i[0].ToString()].Item2.fecha1 = Convert.ToDateTime(formc["fecha1"]);
                            vs[i[0].ToString()].Item2.fecha2 = Convert.ToDateTime(formc["fecha2"]);
                            vs[i[0].ToString()].Item2.viajes = Int32.Parse(formc[i]);
                            break;
                        case '7':
                            vs[i[0].ToString()].Item1.densidad = 0.5;
                            break;
                        default:
                            vs[i[0].ToString()].Item1.ficha = formc[i];
                            break;
                    }

                }
                foreach (Tuple<amb_vehiculo, amb_viajes_mensuale> i in vs.Values)
                {
                    if (i.Item1.densidad == null)
                        i.Item2.cantidad = i.Item1.Capacidad * i.Item2.viajes;
                    else
                        i.Item2.cantidad = i.Item1.Capacidad * i.Item1.densidad * i.Item2.viajes;
                    i.Item1.amb_viajes_mensuales.Add(i.Item2);
                    i.Item1.COD_MUNICIPIO = m.COD_MUNICIPIO;
                    i.Item1.COD_PERIODO = m.COD_PERIODO;
                    i.Item1.COD_REGION = m.COD_REGION;
                    i.Item1.COD_PROVINCIA = m.COD_PROVINCIA;
                    db.amb_vehiculos.InsertOnSubmit(i.Item1);
                }
                db.SubmitChanges();
                return RedirectToAction("Mensaje", "Home", "Vehiculos");
            
        }
        public ActionResult List(string dm)
        {
            amb_usuario user = Usuarios.GetUser(Session["Usuarioid"].ToString());
            amb_municipio mu = null;
            if (dm == null)
            {
                 mu = new FOCIMIRSDataContext().amb_municipios.Where(amb_municipio=>amb_municipio.COD_PROVINCIA == user.COD_PROVINCIA ).OrderBy(amb_municipio=>amb_municipio.NOM_MUNICIPIO).FirstOrDefault();
            }
            else
            {
                 mu = new FOCIMIRSDataContext().amb_municipios.Where(amb_municipio => amb_municipio.NOM_MUNICIPIO == dm).FirstOrDefault();
            }
            List<amb_vehiculo> lista = new FOCIMIRSDataContext().amb_vehiculos.Where(amb_vehiculo => amb_vehiculo.COD_MUNICIPIO == mu.COD_MUNICIPIO && amb_vehiculo.COD_REGION == mu.COD_REGION && amb_vehiculo.COD_PROVINCIA == mu.COD_PROVINCIA && amb_vehiculo.COD_PERIODO == mu.COD_PERIODO).ToList();
            ViewBag.Vehiculos = lista;
            ViewBag.municipio = mu.NOM_MUNICIPIO;
            ViewBag.Municipios = new List<amb_municipio>(user.amb_provincia.amb_municipios.OrderBy(amb_municipio => amb_municipio.NOM_MUNICIPIO));
            return View();
        }
         
	}
}