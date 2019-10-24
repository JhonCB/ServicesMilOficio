using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwaggerUI.APIRest.Entities
{
    public class ResponseServicio : AbstractEntity
    {
        public List<Servicio> listaServicio { get; set; }
        public ResponseServicio()
        {
            this.listaServicio = new List<Servicio>();
        }

    }
}