using SwaggerUI.APIRest.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class UsuarioReg 
    {
        /// <summary>  
        /// Nombres  
        /// </summary>  
        public string Nombres { get; set; }
        /// <summary>  
        /// Correo 
        /// </summary>  
        public string Correo { get; set; }
        /// <summary>  
        /// Contraseña 
        /// </summary>  
        public string Contrasena { get; set; }

        /// <summary>  
        /// isActivo 
        /// </summary>  
        public Boolean isActivo { get; set; }
        /// <summary>  
        /// isEliminado 
        /// </summary>  
        public Boolean isEliminado { get; set; }

        /// <summary>  
        /// Fecha
        /// </summary>  
        public string Fecha { get; set; }
        /// <summary>  
        /// TipoUsuario  
        /// </summary>  
        public int TipoUsuario { get; set; }
        /// <summary>  
        /// Localizacion  
        /// </summary>
        public int Localizacion { get; set; }



    }
}
    
