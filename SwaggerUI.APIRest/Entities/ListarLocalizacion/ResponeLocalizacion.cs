using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwaggerUI.APIRest.Entities
{
    public class ResponeLocalizacion : AbstractEntity
    {
        public List<Localizacion> listaLocalizacion { get; set; }
        public ResponeLocalizacion()
        {
            this.listaLocalizacion = new List<Localizacion>();
        }

    }
}