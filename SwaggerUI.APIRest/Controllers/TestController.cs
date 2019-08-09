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
        /// GET: /api/Test
        /// <summary>
        /// Prueba
        /// </summary>
        
        
        public string Get()
        {
            return "Texto de prueba.";
        }
    }
}
