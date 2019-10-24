using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwaggerUI.APIRest.Entities
{
    public class ResponeLocalizacion : AbstractEntity
    {
        public List<Localizacion> alLocalizacion { get; set; }
        public ResponeLocalizacion()
        {
            this.alLocalizacion = new List<Localizacion>();
        }

    }
}