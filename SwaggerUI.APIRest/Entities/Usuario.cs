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
        public int tipoUsuario { get; set; }
        /// <summary>  
        /// Rol  
        /// </summary>  
        public string rol { get; set; }
        /// <summary>  
        /// Contrasena  
        /// </summary>  
        public string contrasenia { get; set; }
        /// <summary>  
        /// Nombres  
        /// </summary>  
        public string nombres { get; set; }
        /// <summary>  
        /// Correo 
        /// </summary>  
        public string correo { get; set; }
        /// <summary>  
        /// Activo
        /// </summary>  
        public Boolean activo { get; set; }
        /// <summary>  
        /// Eliminado
        /// </summary>  
        public Boolean eliminado { get; set; }
        /// <summary>  
        /// Telefono
        /// </summary>  
        public string telefono { get; set; }
        /// <summary>  
        /// Ubicacion  
        /// </summary>  
        public string ubicacion { get; set; }
        /// <summary>  
        /// Latitud  
        /// </summary>  
        public string latitud { get; set; }
        /// <summary>  
        /// Longitud  
        /// </summary>  
        public string longitud { get; set; }
        /// <summary>  
        /// urlFoto  
        /// </summary>  
        public string urlFoto { get; set; }
        /// <summary>  
        /// FechaNacimiento  
        /// </summary>
        public string fechaNacimiento { get; set; }
    }
}
