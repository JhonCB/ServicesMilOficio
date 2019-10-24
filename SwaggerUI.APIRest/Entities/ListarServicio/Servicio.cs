using SwaggerUI.APIRest.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Servicio 
    {
        /// <summary>  
        /// codUsuario  
        /// </summary>
        public int codUsuario { get; set; }
        /// <summary>  
        /// nombre  
        /// </summary>  
        public string nombre { get; set; }
        /// <summary>  
        /// calificacion  
        /// </summary>  
        public int calificacion { get; set; }
        /// <summary>  
        /// fechaInicio  
        /// </summary>  
        public string fechaInicio { get; set; }
        /// <summary>  
        /// fechaFin  
        /// </summary>  
        public string fechaFin { get; set; }
        /// <summary>  
        /// activo  
        /// </summary>  
        public Boolean isActivo { get; set; }
        /// <summary>  
        /// eliminado  
        /// </summary>  
        public Boolean isEliminado { get; set; }
        /// <summary>  
        /// descripcion  
        /// </summary>  
        public string descripcion { get; set; }
        /// <summary>  
        /// ubicacion  
        /// </summary>  
        public string ubicacion { get; set; }
        /// <summary>  
        /// latitud  
        /// </summary>  
        public string latitud { get; set; }
        /// <summary>  
        /// longitud  
        /// </summary>  
        public string longitud { get; set; }

    }
}
    
