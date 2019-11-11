using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public partial class Login
    {
        /// <summary>  
        /// codUsuario  
        /// </summary>  
        public int codUsuario { get; set; }
        /// <summary>  
        /// idRol  
        /// </summary>  
        public int idRol { get; set; }
        /// <summary>  
        /// nomRol  
        /// </summary>  
        public string nomRol { get; set; }
        /// <summary>  
        /// Contrasena  
        /// </summary>  
        public string nombres { get; set; }
        /// <summary>  
        /// Correo 
        /// </summary>  
        public string correo { get; set; }
        /// <summary>  
        /// Activo
        /// </summary>  
        public int activo { get; set; }
        /// <summary>  
        /// Eliminado
        /// </summary>  
        public int eliminado { get; set; }
        /// <summary>  
        /// Telefono
        /// </summary>  
        public string telefono { get; set; }
        /// <summary>  
        /// idLocalizacion  
        /// </summary>  
        public int idLocalizacion { get; set; }
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
