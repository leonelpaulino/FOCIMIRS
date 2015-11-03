using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FOCIMIRS.Models
{
    public class Provincia
    {
        public static void updateProvincia (amb_provincia p){
            FOCIMIRSDataContext db = new FOCIMIRSDataContext();
            amb_provincia provincia = (from amb_provincia in db.amb_provincias where amb_provincia.COD_PERIODO == p.COD_PERIODO && amb_provincia.COD_PROVINCIA == p.COD_PROVINCIA && amb_provincia.COD_REGION == p.COD_REGION select amb_provincia).Single();
            provincia = p;
            db.SubmitChanges();
        
        }
    }
}