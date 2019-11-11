using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwaggerUI.APIRest.Entities
{
    public class ResponseSolicitud : Resultado
    {
        public List<Solicitud> listaSolicitud { get; set; }
        public ResponseSolicitud()
        {
            this.listaSolicitud = new List<Solicitud>();
        }

    }
}