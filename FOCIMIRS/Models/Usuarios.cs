using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
namespace FOCIMIRS.Models
{
    public class Usuarios
    {
        /// <summary>
        /// Inserta un usuario en la base de datos.
        /// </summary>
        /// <param name="u">usuario</param>
        /// <returns>retorna true en caso de que se pudo insertar de lo contrario retorna false</returns>
        public static bool InsertUser(amb_usuario u)
        {
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            if (db.amb_usuarios.Any(us => us.usuario_id == u.usuario_id))
            {
                return false;
            }
            db.amb_usuarios.InsertOnSubmit(u);
            db.SubmitChanges();
            return true;
        }
        /// <summary>
        /// Verifica si un usuario y su contraseña existen en la base de datos.
        /// </summary>
        /// <param name="user">usuarioid</param>
        /// <param name="pass">contraseña</param>
        /// <returns>retorna true si existe de lo contrario retorna false</returns>
        public static bool CheckUser(string user, string pass) {

            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            byte[] passen = System.Text.Encoding.ASCII.GetBytes(pass);
            if (db.amb_usuarios.Any(u => u.usuario_id == user) && db.amb_usuarios.Any(u => u.Pass == passen)) {
                return true;
            }
            return false;
        }
        /// <summary>
        /// Actualiza un usuario en la base de datos.
        /// </summary>
        /// <param name="u">usuario que se va actualizar</param>
        /// <returns>retorna true si se pudo actualizar de lo contario retorna false</returns>
        /// TODO 
        public static bool UpdateUser(amb_usuario u)
        {
             FOCIMIRSDataContext db = new FOCIMIRSDataContext();
             amb_usuario user = (from amb_usuario in db.amb_usuarios where amb_usuario.usuario_id == u.usuario_id select amb_usuario).Single();
             user = u;
             Provincia.updateProvincia(user.amb_provincia);
             db.SubmitChanges();
     
            return true;
        }
        public static amb_usuario GetUser(string id) {
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            amb_usuario user = (from amb_usuario in db.amb_usuarios where amb_usuario.usuario_id == id select amb_usuario).Single();
            return user;
        }
    }
}