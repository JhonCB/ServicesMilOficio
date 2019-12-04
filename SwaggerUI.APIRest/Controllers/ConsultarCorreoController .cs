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
    /// ConsultarCorreoController   
    /// </summary> 
    public class ConsultarCorreoController : ApiController
    {
        /// <summary>  
        /// getConsultarCorreo
        /// </summary>  
        public ResultadoConsultaCorreo getConsultarCorreo(String email)
        {

            ResultadoConsultaCorreo response = new ResultadoConsultaCorreo();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("VALIDAR_EMAIL", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", email);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
             
                    response.codResultado = dr.IsDBNull(dr.GetOrdinal("CodResultado")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("CodResultado"));
                    response.desResultado = dr.IsDBNull(dr.GetOrdinal("DesResultado")) ? "" : dr.GetString(dr.GetOrdinal("DesResultado"));
                    response.codUsuario = dr.IsDBNull(dr.GetOrdinal("codUsuario")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("codUsuario"));
                    response.codTipoUsuario = dr.IsDBNull(dr.GetOrdinal("codTipoUsuario")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("codTipoUsuario"));
                    response.telefono = dr.IsDBNull(dr.GetOrdinal("telefono")) ? "" : dr.GetString(dr.GetOrdinal("telefono"));
            }
            catch (Exception ex)
            {
                response.codResultado = 0;
                response.codUsuario = 0;
                response.codTipoUsuario = 0;
                response.telefono = "0";
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