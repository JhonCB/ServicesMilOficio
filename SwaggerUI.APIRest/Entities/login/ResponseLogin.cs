using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwaggerUI.APIRest.Entities
{
   
    public class ResponseLogin : Resultado
    {
        public Login login { get; set; }
        public ResponseLogin()
        {
            this.login = new Login(); ;
        }
    }
}