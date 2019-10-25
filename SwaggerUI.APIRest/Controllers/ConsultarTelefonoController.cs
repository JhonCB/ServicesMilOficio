using Entities;
using SwaggerUI.APIRest.Entities;
using Swashbuckle.Swagger.Annotations;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace SwaggerUI.APIRest.Controllers
{

    /// <summary>  
    /// ConsultarTelefonoController  
    /// </summary> 
    public class ConsultarTelefonoController : ApiController
    {
        /// <summary>  
        /// getConsultarCorreo
        /// </summary>  
        public Resultado getConsultarTelefono(int telefono)
        {

            Resultado response = new Resultado();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("VALIDAR_TELEFONO", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@telefono", telefono);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
             
                    response.codResultado = dr.IsDBNull(dr.GetOrdinal("CodResultado")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("CodResultado"));
                    response.desResultado = dr.IsDBNull(dr.GetOrdinal("DesResultado")) ? "" : dr.GetString(dr.GetOrdinal("DesResultado"));

            }
            catch (Exception ex)
            {
                response.codResultado = 0;
                response.desResultado = ex.ToString();
            }

            finally
            {
                con.Close();
            }

            return response;
        }

    }
}