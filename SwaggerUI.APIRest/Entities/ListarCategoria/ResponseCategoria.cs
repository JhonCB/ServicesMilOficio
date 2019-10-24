using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwaggerUI.APIRest.Entities
{
    public class ResponseCategoria : AbstractEntity
    {
        public List<Categoria> listaCategoria { get; set; }
        public ResponseCategoria()
        {
            this.listaCategoria = new List<Categoria>();
        }

    }
}