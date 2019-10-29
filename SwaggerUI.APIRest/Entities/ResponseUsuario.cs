using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwaggerUI.APIRest.Entities
{
    public class ResponseUsuario : Resultado
    {
        public List<Usuario> listaUsuario { get; set; }
        public ResponseUsuario()
        {
            this.listaUsuario = new List<Usuario>();
        }

    }
}