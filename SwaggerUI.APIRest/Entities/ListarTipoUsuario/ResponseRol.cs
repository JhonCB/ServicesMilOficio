using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwaggerUI.APIRest.Entities
{
    public class ResponseRol : AbstractEntity
    {
        public List<Rol> alRol { get; set; }
        public ResponseRol()
        {
            this.alRol = new List<Rol>();
        }

    }
}