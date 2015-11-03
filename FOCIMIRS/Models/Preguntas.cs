using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FOCIMIRS.Models
{
    /// <summary>
    /// Clase Representa una pregunta de la base de datos.
    /// </summary>
    public class Preguntas
    {   

        List<amb_opcione> _opcion;
        List<Preguntas> _subPreguntas;
        amb_pregunta _pregunta;
        int _padreId;
        /// <summary>
        /// Retorna todas las preguntas
        /// </summary>
        public static List<Preguntas> getAll() {
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            var query = (from amb_pregunta in db.amb_preguntas
                         join amb_subPregunta in db.amb_subPreguntas on amb_pregunta.pregunta_id equals amb_subPregunta.pregunta_id
                         where amb_pregunta.pregunta_id != amb_subPregunta.subpreguntasid            
                         select amb_pregunta ).ToList();

            return Preguntas.ConvertToPreguntas(query);
        }
        /// <summary>
        /// Crea una lista de objetos Preguntas a partir de una lista de objetos de amb_pregunta
        /// </summary>
        /// <param name="lp">Lista de preguntas</param>
        /// <returns>Retorna una lista de preguntas de tipo Preguntas</returns>
        public static List<Preguntas> ConvertToPreguntas(List<amb_pregunta> lp) 
        {
            List<Preguntas> _return = new List<Preguntas>();
            foreach (amb_pregunta i in lp)
            {
                Preguntas aux = new Preguntas();
                aux._padreId = -1;
                aux.Subpreguntas = Preguntas.getSubpreguntas(i);
                aux.Opcion = PreguntaOpcion.getOpcione(i);
                aux.Pregunta = i;
                _return.Add(aux);
            }
            return _return;
        }
        /// <summary>
        /// Retorna todas las pregunta perteneciente a una seccion
        /// </summary>
        /// <param name="s">Seccion</param>
        /// <returns>Retorna una lista de preguntas</returns>
        public static List<Preguntas> getbySeccion(amb_pregunta_seccion s){
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            var  query = db.ExecuteQuery<amb_pregunta>
                
                (@"select *from amb_preguntas where seccion_id = {0} and 
                 pregunta_id not in (select subpreguntasid from amb_subPreguntas)",
                 s.seccionID.ToString()).ToList();

            return Preguntas.ConvertToPreguntas(query);
            
        }
        /// <summary>
        /// Retornas todas las subpreguntas de una pregunta dada.
        /// </summary>
        /// <param name="p">Pregunta</param>
        /// <returns>Retorna una lista de preguntas</returns>
        private static List<Preguntas> getSubpreguntas(amb_pregunta p) {
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            List<amb_subPregunta> qs = (from amb_subPregunta in db.amb_subPreguntas
                                        where p.pregunta_id == amb_subPregunta.pregunta_id
                                        select amb_subPregunta).ToList();
            List<Preguntas> _return = new List<Preguntas>();
            foreach (amb_subPregunta i in qs) {

                Preguntas _returnP = new Preguntas();
                amb_pregunta aux = (from amb_pregunta in db.amb_preguntas 
                                    where amb_pregunta.pregunta_id == i.subpreguntasid select amb_pregunta).Single();
                _returnP._padreId = p.pregunta_id;
                _returnP.Subpreguntas = Preguntas.getSubpreguntas(aux);
                _returnP.Pregunta = aux;
                _returnP.Opcion = PreguntaOpcion.getOpcione(aux);
                _return.Add(_returnP);
            }
   
            return _return;
        }
        /// <summary>
        /// Propiedad con una lista de Opciones
        /// </summary>
        public List<amb_opcione> Opcion {
            get {
                return _opcion;
            }
            set {
                _opcion = value;
            }
        }
        /// <summary>
        /// Propiedad con una lista de subPreguntas.
        /// </summary>
        public List<Preguntas> Subpreguntas
        {
            get
            {
                return _subPreguntas;
            }
            set
            {
                _subPreguntas = value;
            }
        }
        /// <summary>
        /// Propiedad con la pregunta
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
        /// <summary>
        /// Propiedad con el id del padre de esta pregunta. ( es -1 en caso de que no sea una subPregunta)
        /// </summary>
        public int PadreId 
        {
            get 
            {
                return _padreId;
            }
        }
    }
}