using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SwaggerUI.APIRest.Controllers
{
    
    /// <summary>
    /// Prueba
    /// </summary>
    /// <remarks>
    /// Texto
    /// </remarks>

    public class TestController : ApiController
    {
        /// GET: /api/Nombre
        /// <summary>
        /// Prueba
        /// </summary>
        
        [HttpGet]
        public string Nombre()
        {
            return "Texto de prueba.";
        }
    }
}
