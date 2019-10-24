using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwaggerUI.APIRest.Entities
{
    public class ResponseRol : AbstractEntity
    {
        public List<Rol> listaRol { get; set; }
        public ResponseRol()
        {
            this.listaRol = new List<Rol>();
        }

    }
}