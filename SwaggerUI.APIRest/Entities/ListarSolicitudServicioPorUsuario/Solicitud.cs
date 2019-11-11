using SwaggerUI.APIRest.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Solicitud 
    {
        /// <summary>  
        /// idServicio  
        /// </summary>
        public int idServicio { get; set; }
        /// <summary>  
        /// costo  
        /// </summary>  
        public String costo { get; set; }
        /// <summary>  
        /// cotizacion  
        /// </summary>  
        public String cotizacion { get; set; }
        /// <summary>  
        /// estado  
        /// </summary>  
        public int estado { get; set; }
        /// <summary>  
        /// fecha  
        /// </summary>  
        public String fecha { get; set; }
        /// <summary>  
        /// categoria  
        /// </summary>  
        public String categoria { get; set; }
        /// <summary>  
        /// urlFoto  
        /// </summary>  
        public String urlFoto { get; set; }
        /// <summary>  
        /// nombreOfertante  
        /// </summary>  
        public String nomOfertante { get; set; }
        /// <summary>  
        /// desServicio  
        /// </summary>  
        public String desServicio { get; set; }
        /// <summary>  
        /// ubicacion  
        /// </summary>  
        public String ubicacion { get; set; }

    }
}
    
