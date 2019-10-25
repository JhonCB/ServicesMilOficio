using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwaggerUI.APIRest.Entities
{
    public class ResponseConsultarUsuario2 : Resultado
    {
        
        public Usuario usuario { get; set; }
        public ResponseConsultarUsuario2()
        {
            this.usuario = new Usuario();
        }

    }
}