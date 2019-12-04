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
    /// ModificarServicioController 
    /// </summary> 
    public class ModificarServicioController : ApiController
    {
        /// <summary>  
        /// getModificarServicio
        /// </summary>  
        public ResponseUsuarioReg getRegistrarServicio(int codServicio, int CodUsuario, String Descripcion, int Calificacion, String FechaInicio, String FechaFin,int CodCategoria, int codLocalizacion,String latitud,String longitud, int Estado)
        {

            ResponseUsuarioReg response = new ResponseUsuarioReg();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {   //FECHA EN FORMATO AMERICANO yyyy/MM/dd
                SqlCommand cmd = new SqlCommand("MODIFICAR_SERVICIO", con);
                cmd.CommandType = CommandType.StoredProcedure;
		        cmd.Parameters.AddWithValue("@ID", codServicio);
                cmd.Parameters.AddWithValue("@idusuario", CodUsuario);
                cmd.Parameters.AddWithValue("@descripcion", Descripcion);
                cmd.Parameters.AddWithValue("@calificacion", Calificacion);
                cmd.Parameters.AddWithValue("@fecha_inicio", FechaInicio);
                cmd.Parameters.AddWithValue("@fecha_fin", FechaFin);
                cmd.Parameters.AddWithValue("@idcategoria", CodCategoria);
                cmd.Parameters.AddWithValue("@localizacion", codLocalizacion);
                cmd.Parameters.AddWithValue("@latitud", latitud);
                cmd.Parameters.AddWithValue("@longitud", longitud);
                cmd.Parameters.AddWithValue("@estado", Estado);
                //
                con.Open();

                int codResultado = cmd.ExecuteNonQuery();
                //SqlDataReader dr = cmd.ExecuteReader();
                //dr.Read();
                //int codResultado = dr.IsDBNull(dr.GetOrdinal("Return Value")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("Return Value"));
                if (codResultado == 1)
                {
                    response.codResultado = 1;
                    response.desResultado = "Servicio modificado correctamente";
                }
                else
                {
                    response.codResultado = 0;
                    //response.desResultado = dr.IsDBNull(dr.GetOrdinal("Mensaje")) ? "" : dr.GetString(dr.GetOrdinal("Mensaje"));
                    response.desResultado = "Error al modificar";
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