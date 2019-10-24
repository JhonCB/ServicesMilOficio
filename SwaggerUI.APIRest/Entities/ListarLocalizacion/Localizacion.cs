using SwaggerUI.APIRest.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Localizacion 
    {
        /// <summary>  
        /// codLocalizacion  
        /// </summary>
        public int codLocalizacion { get; set; }
        /// <summary>  
        /// nomLocalizacion  
        /// </summary>  
        public string nomLocalizacion { get; set; }
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
    
