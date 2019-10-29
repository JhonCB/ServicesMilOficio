using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public partial class Usuario
    {
        /// <summary>  
        /// codUsuario  
        /// </summary>  
        public int codUsuario { get; set; }
        /// <summary>  
        /// Tipo_usuario  
        /// </summary>  
        public int Tipo_usuario { get; set; }
        /// <summary>  
        /// Rol  
        /// </summary>  
        public string Rol { get; set; }
        /// <summary>  
        /// Contrasena  
        /// </summary>  
        public string Contrasena { get; set; }
        /// <summary>  
        /// Nombres  
        /// </summary>  
        public string Nombres { get; set; }
        /// <summary>  
        /// Correo 
        /// </summary>  
        public string Correo { get; set; }
        /// <summary>  
        /// Activo
        /// </summary>  
        public Boolean Activo { get; set; }
        /// <summary>  
        /// Eliminado
        /// </summary>  
        public Boolean Eliminado { get; set; }
        /// <summary>  
        /// Telefono
        /// </summary>  
        public string Telefono { get; set; }
        /// <summary>  
        /// Ubicacion  
        /// </summary>  
        public string Ubicacion { get; set; }
        /// <summary>  
        /// Latitud  
        /// </summary>  
        public string Latitud { get; set; }
        /// <summary>  
        /// Longitud  
        /// </summary>  
        public string Longitud { get; set; }
        /// <summary>  
        /// FechaNacimiento  
        /// </summary>
        public string FechaNacimiento { get; set; }
    }
}
