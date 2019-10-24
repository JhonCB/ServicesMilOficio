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
        /// Tipo_usuario  
        /// </summary>  
        public int Tipo_usuario { get; set; }
        /// <summary>  
        /// NomUsuario  
        /// </summary>  
        public string NomUsuario { get; set; }
        /// <summary>  
        /// Contrasena  
        /// </summary>  
        public string Contrasena { get; set; }
        /// <summary>  
        /// Nombres  
        /// </summary>  
        public string Nombres { get; set; }
        /// <summary>  
        /// Apellidos 
        /// </summary>  
        public string Apellidos { get; set; }
        /// <summary>  
        /// DNI 
        /// </summary>  
        public string DNI { get; set; }
        /// <summary>  
        /// Correo 
        /// </summary>  
        public string Correo { get; set; }
        /// <summary>  
        /// Telefono
        /// </summary>  
        public string Telefono { get; set; }
        /// <summary>  
        /// Direccion  
        /// </summary>  
        public string Direccion { get; set; }
        /// <summary>  
        /// FechaNacimiento  
        /// </summary>
        public string FechaNacimiento { get; set; }
    }
}
