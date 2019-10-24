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
    /// ConsultarUsuarioPorDNIController2  
    /// </summary> 
    public class ConsultarUsuarioPorDNI2Controller : ApiController
    {
        /// <summary>  
        /// GetConsultarUsuarioPorDNI2
        /// </summary>  
        public ResponseConsultarUsuario2 GetConsultarUsuarioPorDNI2(String DNI)
        {

            ResponseConsultarUsuario2 response = new ResponseConsultarUsuario2();
            List<Usuario> lstUsuario = new List<Usuario>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("USP_CONSULTARUSUARIO", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@DNI", SqlDbType.Char, 8).Value = DNI;
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

           
                    Usuario usuario = new Usuario();
                    usuario.Tipo_usuario = dr.IsDBNull(dr.GetOrdinal("Tipo_usuario")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("Tipo_usuario"));
                    usuario.NomUsuario = dr.IsDBNull(dr.GetOrdinal("NomUsuario")) ? "" : dr.GetString(dr.GetOrdinal("NomUsuario"));
                    usuario.Contrasena = dr.IsDBNull(dr.GetOrdinal("Contraseña")) ? "" : dr.GetString(dr.GetOrdinal("Contraseña"));
                    usuario.Nombres = dr.IsDBNull(dr.GetOrdinal("Nombres")) ? "" : dr.GetString(dr.GetOrdinal("Nombres"));
                    usuario.Apellidos = dr.IsDBNull(dr.GetOrdinal("Apellidos")) ? "" : dr.GetString(dr.GetOrdinal("Apellidos"));
                    usuario.DNI = dr.IsDBNull(dr.GetOrdinal("DNI")) ? "" : dr.GetString(dr.GetOrdinal("DNI"));
                    usuario.Correo = dr.IsDBNull(dr.GetOrdinal("Correo")) ? "" : dr.GetString(dr.GetOrdinal("Correo"));
                    usuario.Telefono = dr.IsDBNull(dr.GetOrdinal("Telefono")) ? "" : dr.GetString(dr.GetOrdinal("Telefono"));
                    usuario.Direccion = dr.IsDBNull(dr.GetOrdinal("Direccion")) ? "" : dr.GetString(dr.GetOrdinal("Direccion"));
                    //usuario.FechaNacimiento = dr.IsDBNull(dr.GetOrdinal("FechaNacimiento")) ? default(DateTime) : dr.GetDateTime(dr.GetOrdinal("FechaNacimiento"));
                    DateTime now = dr.IsDBNull(dr.GetOrdinal("FechaNacimiento")) ? default(DateTime) : dr.GetDateTime(dr.GetOrdinal("FechaNacimiento"));
                    string asString = now.ToString("dd/MMMM/yyyy hh:mm:ss tt");
                    usuario.FechaNacimiento = asString;
                    lstUsuario.Add(usuario);
              
             
                    response.codResultado = 1;
                    response.desResultado = "Correcto";
                    response.usuario = usuario;

            }
            catch (Exception ex)
            {
                response.codResultado = 0;
                response.desResultado = ex.ToString();
                response.usuario = null;
            }

            finally
            {
                con.Close();
            }

            return response;
        }

    }
}