using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FOCIMIRS.Models
{
    /// <summary>
    /// Clase que representa la tabla pregunta_seccion
    /// </summary>
    public class Seccion
    {
        /// <summary>
        /// Lista de pregunta
        /// </summary>
        List<Preguntas> _preguntas;
        /// <summary>
        /// Seccion 
        /// </summary>
        amb_pregunta_seccion _seccion;
        /// <summary>
        /// Retorna todas las secciones
        /// </summary>
        /// <returns>Retorna una lista de secciones</returns>
        public static List<Seccion> getAll() {
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            var query = (from amb_pregunta_seccion in db.amb_pregunta_seccions select amb_pregunta_seccion);
            List<Seccion> _return = new List<Seccion>();
            foreach (amb_pregunta_seccion i in query) 
            {
                Seccion aux = new Seccion();
                aux.Pregunta = Preguntas.getbySeccion(i);
                aux.Seccione = i;
                _return.Add(aux);
            }

            return _return;
        }
        /// <summary>
        /// Propiedad perteneciente a la seccion
        /// </summary>
        public amb_pregunta_seccion Seccione
        {
            get
            {
                return _seccion;
            }
            set
            {
                _seccion= value;
            }
        }
        /// <summary>
        /// Propiedad perteneciente a la lista de  preguntas
        /// </summary>
        public List<Preguntas> Pregunta 
        {
            get 
            {
                return _preguntas;
            }
            set
            {
                _preguntas = value;
            }
        }
    }
}