using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwaggerUI.APIRest.Entities
{
    public class ResponseRecuperarContrasenia : Resultado
    {
        public RecuperarContrasenia recuperarContrasenia { get; set; }
        public ResponseRecuperarContrasenia()
        {
        this.recuperarContrasenia = new RecuperarContrasenia();
        }

    }
}