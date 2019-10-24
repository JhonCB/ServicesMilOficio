using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwaggerUI.APIRest.Entities
{
    public class ResponseCategoria : AbstractEntity
    {
        public List<Categoria> alCategoria { get; set; }
        public ResponseCategoria()
        {
            this.alCategoria = new List<Categoria>();
        }

    }
}