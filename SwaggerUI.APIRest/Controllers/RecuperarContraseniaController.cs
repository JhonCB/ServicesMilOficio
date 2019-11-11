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
    /// RecuperarContraseniaController  
    /// </summary> 
    public class RecuperarContraseniaController : ApiController
    {
        /// <summary>  
        /// getListarTipoUsuario
        /// </summary>  
        public ResponseUsuarioReg getRecuperarContrasenia(int codUsuario, String codRecuperacion, String contraseniaNueva)
        {

            ResponseUsuarioReg response = new ResponseUsuarioReg();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("RECUPERACION_CUENTA", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idUsuario", codUsuario);
                cmd.Parameters.AddWithValue("@codRecuperacion", codRecuperacion);
                cmd.Parameters.AddWithValue("@contraseniaNueva", contraseniaNueva);

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