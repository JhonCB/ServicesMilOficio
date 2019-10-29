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
        public ResponseUsuarioReg getRegistrarServicio(int codServicio, int CodUsuario, String Descripcion, int Calificacion, String FechaInicio, String FechaFin, int Estado,int CodCategoria, int codLocalizacion)
        {

            ResponseUsuarioReg response = new ResponseUsuarioReg();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("MODIFICAR_SERVICIO", con);
                cmd.CommandType = CommandType.StoredProcedure;
		        cmd.Parameters.AddWithValue("@ID", codServicio);
                cmd.Parameters.AddWithValue("@idusuario", CodUsuario);
                cmd.Parameters.AddWithValue("@descripcion", Descripcion);
                cmd.Parameters.AddWithValue("@calificacion", Calificacion);
                cmd.Parameters.AddWithValue("@fecha_inicio", FechaInicio);
                cmd.Parameters.AddWithValue("@fecha_fin", FechaFin);
                cmd.Parameters.AddWithValue("@estado", Estado);
                cmd.Parameters.AddWithValue("@idcategoria", CodCategoria);
                cmd.Parameters.AddWithValue("@localizacion", codLocalizacion);
                //
                con.Open();

                int codResultado = cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                //int codResultado = dr.IsDBNull(dr.GetOrdinal("Return Value")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("Return Value"));
                if (codResultado == 1)
                {
                    response.codResultado = 1;
                    response.desResultado = "Modificado Correctamente";
                }
                else
                {
                    response.codResultado = 0;
                    response.desResultado = dr.IsDBNull(dr.GetOrdinal("Mensaje")) ? "" : dr.GetString(dr.GetOrdinal("Mensaje"));
                    //response.desResultado = "Error al modificar";
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