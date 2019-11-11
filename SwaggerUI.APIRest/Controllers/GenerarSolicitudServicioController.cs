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
    /// GenerarSolicitudServicioController  
    /// </summary> 
    public class GenerarSolicitudServicioController : ApiController
    {
        /// <summary>  
        /// getGenerarSolicitudServicio
        /// </summary>  
        public ResponseUsuarioReg getGenerarSolicitudServicio(int codServicio, double costo, double cotizacion, int codUsuario)
        {

            ResponseUsuarioReg response = new ResponseUsuarioReg();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("GENERAR_SOLICITUD_SERVICIO", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idServicio", codServicio);
                cmd.Parameters.AddWithValue("@costo", costo);
                cmd.Parameters.AddWithValue("@cotizacion", cotizacion);
                cmd.Parameters.AddWithValue("@idUsuario", codUsuario);

                con.Open();

                int codResultado = cmd.ExecuteNonQuery();
                //SqlDataReader dr = cmd.ExecuteReader();
                //dr.Read();
                //int codResultado = dr.IsDBNull(dr.GetOrdinal("Return Value")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("Return Value"));
               if (codResultado == 1)
                {
                    response.codResultado = 1;
                    //response.codResultado = dr.IsDBNull(dr.GetOrdinal("codResultado")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("codResultado"));
                    response.desResultado = "Solicitud generado correctamente";
                }
                else
                {
                    response.codResultado = 0;
                    //response.desResultado = dr.IsDBNull(dr.GetOrdinal("Mensaje")) ? "" : dr.GetString(dr.GetOrdinal("Mensaje"));
                    response.desResultado = "Error al generar solicitud";
                }
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