using System.Web.Http;
using WebActivatorEx;
using SwaggerUI.APIRest;
using Swashbuckle.Application;

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
                        .Description("A sample API for testing")
                            .TermsOfService("Some terms")
                        .Contact(cc => cc
                          .Name("Juan Delgado")
                          .Url("https://somostechies.com/contact")
                          .Email("juan1215_jc@outlook.com"))
                        .License(lc => lc
                          .Name("Some License")
                          .Url("https://somostechies.com/license"));
                        c.IncludeXmlComments(string.Format(@"{0}\bin\SwaggerUI.APIRest.xml", System.AppDomain.CurrentDomain.BaseDirectory));
                        c.DescribeAllEnumsAsStrings();

                    })
                .EnableSwaggerUi(c => {
                    c.DocExpansion(DocExpansion.List);
                });
        }
    }
}
