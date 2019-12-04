using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwaggerUI.APIRest.Entities
{
    public class ResultadoConsultaCorreo
    {
        /// <summary>  
        /// codResultado 
        /// </summary>  
        public int codResultado { get; set; }
        /// <summary>  
        /// desResultado
        /// </summary>  
        public string desResultado { get; set; }
        /// <summary>  
        /// codUsuario
        /// </summary>  
        public int codUsuario { get; set; }
        /// <summary>  
        /// codTipoUsuario
        /// </summary>  
        public int codTipoUsuario { get; set; }
        /// <summary>  
        /// telefono
        /// </summary>  
        public String telefono { get; set; }

    }
}