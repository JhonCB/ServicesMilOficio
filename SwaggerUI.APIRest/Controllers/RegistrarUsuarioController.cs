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
    /// RegistrarUsuarioController  
    /// </summary> 
    public class RegistrarUsuarioController : ApiController
    {
        /// <summary>  
        /// getListarTipoUsuario
        /// </summary>  
        public ResponseUsuarioReg getRegistrarUsuario(String Nombre, String Email, String Contrasenia, Boolean isActivo, Boolean isElimando, String FechaCreacion,int Telefono, int codRol, int codLocalizacion)
        {

            ResponseUsuarioReg response = new ResponseUsuarioReg();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("REGISTRAR_USUARIO", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nombre", Nombre);
                cmd.Parameters.AddWithValue("@email", Email);
                cmd.Parameters.AddWithValue("@Contraseña", Contrasenia);
                cmd.Parameters.AddWithValue("@Activo", isActivo);
                cmd.Parameters.AddWithValue("@Eliminado", isElimando);
                cmd.Parameters.AddWithValue("@fecha", FechaCreacion);
                cmd.Parameters.AddWithValue("@telefono", Telefono);
                cmd.Parameters.AddWithValue("@rol", codRol);
                cmd.Parameters.AddWithValue("@localizacion", codLocalizacion);

                con.Open();

                int codResultado = cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                //int codResultado = dr.IsDBNull(dr.GetOrdinal("Return Value")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("Return Value"));
                if (codResultado == 1)
                {
                    response.codResultado = 1;
                    response.desResultado = "Registrado Correctamente";
                }
                else
                {
                    response.codResultado = 0;
                    response.desResultado = dr.IsDBNull(dr.GetOrdinal("Mensaje")) ? "" : dr.GetString(dr.GetOrdinal("Mensaje"));
                    //response.desResultado = "Error al registrar";
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