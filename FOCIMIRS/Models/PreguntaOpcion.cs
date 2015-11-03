using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FOCIMIRS.Models
{
    /// <summary>
    /// Clase que hace las consultas a la tabla consulta opcion. 
    /// </summary>
    public class PreguntaOpcion
    {   

        /// <summary>
        /// Variable que representa una opcion
        /// </summary>
   
        amb_opcione _opcion;
        /// <summary>
        /// Variable que representa una pregunta
        /// </summary>
 
        amb_pregunta _pregunta;
        public static List<PreguntaOpcion> getAll() { 
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            var query = from amb_opciones_pregunta in db.amb_opciones_preguntas select amb_opciones_pregunta;
            List<PreguntaOpcion> _return = new List<PreguntaOpcion>();
            foreach (amb_opciones_pregunta i in query) {
                PreguntaOpcion aux = new PreguntaOpcion();
                amb_pregunta qp = (from amb_pregunta in db.amb_preguntas where i.preguntaid == amb_pregunta.pregunta_id select amb_pregunta).Single();
                amb_opcione qo = (from amb_opcione in db.amb_opciones where i.opcionid == amb_opcione.opcion_id select amb_opcione).Single();
                aux.Opcion = qo;
                aux.Pregunta = qp;
                _return.Add(aux);
                
            }
            return _return;
        }
        public static List<amb_opcione> getOpcione(amb_pregunta p) {
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            var query = from amb_opciones_pregunta in db.amb_opciones_preguntas 
                        where amb_opciones_pregunta.preguntaid == p.pregunta_id
                        select amb_opciones_pregunta;
            List<amb_opcione> _return = new List<amb_opcione>();
            foreach (amb_opciones_pregunta i in query)
            {
                amb_opcione qo = (from amb_opcione in db.amb_opciones where i.opcionid == amb_opcione.opcion_id select amb_opcione).Single();
                _return.Add(qo);

            }
            return _return;
        }
        /// <summary>
        /// Propiedad de la opcion
        /// </summary>
       public amb_opcione Opcion { 
            get {
                return _opcion;
              }
           set {
               _opcion = value;
           }
        }
        /// <summary>
        /// Propiedad de la pregunta
        /// </summary>
       public amb_pregunta Pregunta
       {
           get
           {
               return _pregunta;
           }
           set
           {
               _pregunta = value;
           }
       }
        
    }
}