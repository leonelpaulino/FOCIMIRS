using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FOCIMIRS.Models
{
    /// <summary>
    /// Clase que representa un cuestionario lleno de la base de datos.
    /// </summary>
    public class CuestionarioLleno
    {
        //Busca el ultimo cuestionario lleno de un municipio.
        public static amb_cuestionario_lleno getLastTempCuestionario( amb_municipio mu) {
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            var qs = (from amb_cuestionario_lleno in db.amb_cuestionario_llenos
                     where (mu.COD_MUNICIPIO == amb_cuestionario_lleno.COD_MUNICIPIO && mu.COD_PERIODO == amb_cuestionario_lleno.COD_PERIODO &&
                            mu.COD_PROVINCIA == amb_cuestionario_lleno.COD_PROVINCIA && mu.COD_REGION == amb_cuestionario_lleno.COD_REGION && amb_cuestionario_lleno.temp_cuestionario == true)
                     select amb_cuestionario_lleno);
            
            return qs.ToList().Count == 0 ? null:qs.ToList()[0];
               
        }
        public static List<amb_cuestionario_lleno> getAll(amb_municipio mu)
        {
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            var qs = (from amb_cuestionario_lleno in db.amb_cuestionario_llenos
                      where (mu.COD_MUNICIPIO == amb_cuestionario_lleno.COD_MUNICIPIO && mu.COD_PERIODO == amb_cuestionario_lleno.COD_PERIODO &&
                             mu.COD_PROVINCIA == amb_cuestionario_lleno.COD_PROVINCIA && mu.COD_REGION == amb_cuestionario_lleno.COD_REGION && amb_cuestionario_lleno.temp_cuestionario == false)
                      orderby amb_cuestionario_lleno.fecha
                      select amb_cuestionario_lleno);

            return qs.ToList().Count == 0 ? null : qs.ToList();
        }
        public static int idLast() { 
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            var qs = (from amb_cuestionario_lleno in db.amb_cuestionario_llenos orderby (amb_cuestionario_lleno.cuestionario_llenoid) select amb_cuestionario_lleno);
            int l = (int)qs.ToList().Count == 0 ?0:(int)(qs.ToList().Last().Cuestionario_id);
            return l;
        }
        public static List<amb_cuestionario_lleno> getAll(amb_usuario user)
        {
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            return db.amb_cuestionario_llenos.Where(amb_cuestionario_lleno => amb_cuestionario_lleno.amb_cuestionario_usuario.usuario_id == user.usuario_id ).ToList();

        }
    }
}