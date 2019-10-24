using System.Web.Http;
using WebActivatorEx;
using SwaggerUI.APIRest;
using Swashbuckle.Application;
using System.Reflection;
using System.IO;
using System;

[assembly: PreApplicationStartMethod(typeof(SwaggerConfig), "Register")]

namespace SwaggerUI.APIRest
{
    public class SwaggerConfig
    {
        public static void Register()
        {
            var thisAssembly = typeof(SwaggerConfig).Assembly;

            GlobalConfiguration.Configuration
                .EnableSwagger(c =>
                    {
                        c.SingleApiVersion("v1", "SwaggerUI.APIRest")
                        .Description("A sample API for MilOficios")
                            .TermsOfService("Some terms")
                        .Contact(cc => cc
                          .Name("Jhon Coronel")
                          .Url("https://somostechies.com/contact")
                          .Email("Ghoozh@gmail.com"))
                        .License(lc => lc
                          .Name("Some License")
                          .Url("https://somostechies.com/license"));
                        c.IncludeXmlComments(string.Format(@"{0}\bin\SwaggerUI.APIRest.xml", System.AppDomain.CurrentDomain.BaseDirectory));
                        // c.IncludeXmlComments(string.Format(@"{0}\bin\SwaggerUI.APIRest.xml", System.AppDomain.CurrentDomain.BaseDirectory));
                        c.DescribeAllEnumsAsStrings();
                        var xmlFile = string.Format(@"{0}\bin\SwaggerUI.APIRest.xml", System.AppDomain.CurrentDomain.BaseDirectory);
                        var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
                        c.IncludeXmlComments(xmlPath);

                    })

                .EnableSwaggerUi(c => {
                    c.DocExpansion(DocExpansion.List);
                });
         
            /*GlobalConfiguration.Configuration
            .EnableSwagger(c => {
                                  c.SingleApiVersion("v1", "SwaggerUI.APIRest");
                                  c.IncludeXmlComments(string.Format(@"{0}\bin\SwaggerUI.APIRest.xml", System.AppDomain.CurrentDomain.BaseDirectory)); 
            })
            .EnableSwaggerUi();*/

        }
    }
}
