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
    /// RegistrarServicioController  
    /// </summary> 
    public class RegistrarServicioController : ApiController
    {
        /// <summary>  
        /// getRegistrarServicio
        /// </summary>  
        public ResponseUsuarioReg getRegistrarServicio(int CodUsuario, String Descripcion, String FechaFin, int CodCategoria, int codLocalizacion, String latitud, String longitud)
        {

            ResponseUsuarioReg response = new ResponseUsuarioReg();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("REGISTRAR_SERVICIO", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idusuario", CodUsuario);
                cmd.Parameters.AddWithValue("@descripcion", Descripcion);
                cmd.Parameters.AddWithValue("@calificacion", 0);
                DateTime aDate = DateTime.Now;
                cmd.Parameters.AddWithValue("@fecha_inicio", aDate.ToString("dd/MM/yyyy HH:mm:ss"));
                cmd.Parameters.AddWithValue("@fecha_fin", FechaFin);
                cmd.Parameters.AddWithValue("@idcategoria", CodCategoria);
                cmd.Parameters.AddWithValue("@localizacion", codLocalizacion);
                cmd.Parameters.AddWithValue("@latitud", latitud);
                cmd.Parameters.AddWithValue("@longitud", longitud);
                cmd.Parameters.AddWithValue("@estado", 1);
                //
                con.Open();

                int codResultado = cmd.ExecuteNonQuery();
                //SqlDataReader dr = cmd.ExecuteReader();
                //dr.Read();
                //int codResultado = dr.IsDBNull(dr.GetOrdinal("Return Value")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("Return Value"));
                if (codResultado == 1)
                {
                    response.codResultado = 1;
                    response.desResultado = "Servicio registrado correctamente";
                }
                else
                {
                    response.codResultado = 0;
                    //response.desResultado = dr.IsDBNull(dr.GetOrdinal("Mensaje")) ? "" : dr.GetString(dr.GetOrdinal("Mensaje"));
                    response.desResultado = "Error al registrar";
                }
              
               // response.codResultado = dr.IsDBNull(dr.GetOrdinal("Conectado")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("Conectado"));
               


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