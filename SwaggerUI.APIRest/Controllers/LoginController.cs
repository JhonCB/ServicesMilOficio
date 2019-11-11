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
    /// LoginController  
    /// </summary> 
    public class LoginController : ApiController
    {
        /// <summary>  
        /// getLogin
        /// </summary>  
        public ResponseLogin getLogin(String usuario, String contrasenia)
        {
            ResponseLogin response = new ResponseLogin();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("LOGIN_USUARIO", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Usuario", usuario);
                cmd.Parameters.AddWithValue("@Contraseña", contrasenia);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                    
                int codResultado = dr.IsDBNull(dr.GetOrdinal("codResultado")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("codResultado"));
                response.codResultado = codResultado;
                response.desResultado = dr.IsDBNull(dr.GetOrdinal("desResultado")) ? "" : dr.GetString(dr.GetOrdinal("desResultado"));

                Login login = new Login();
                login.codUsuario = dr.IsDBNull(dr.GetOrdinal("codUsuario")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("codUsuario"));
                login.idRol = dr.IsDBNull(dr.GetOrdinal("codRol")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("codRol"));
                login.nomRol = dr.IsDBNull(dr.GetOrdinal("nomRol")) ? "" : dr.GetString(dr.GetOrdinal("nomRol"));
                login.nombres = dr.IsDBNull(dr.GetOrdinal("nomUsuario")) ? "" : dr.GetString(dr.GetOrdinal("nomUsuario"));
                if(codResultado > 0)
                {
                    login.correo = usuario;
                }
                login.telefono = dr.IsDBNull(dr.GetOrdinal("telefono")) ? "" : dr.GetString(dr.GetOrdinal("telefono"));
                login.fechaNacimiento = dr.IsDBNull(dr.GetOrdinal("fechaNacimiento")) ? "" : dr.GetString(dr.GetOrdinal("fechaNacimiento"));
                login.activo = dr.IsDBNull(dr.GetOrdinal("activo")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("activo"));
                login.eliminado = dr.IsDBNull(dr.GetOrdinal("eliminado")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("eliminado"));
                login.urlFoto = dr.IsDBNull(dr.GetOrdinal("urlFoto")) ? "" : dr.GetString(dr.GetOrdinal("urlFoto"));
                login.idLocalizacion = dr.IsDBNull(dr.GetOrdinal("idLocalizacion")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("idLocalizacion"));

                response.login = login;


            }
            catch (Exception ex)
            {
                response.codResultado = 0;
                response.desResultado = ex.ToString();
                response.login = null;
            }

            finally
            {
                con.Close();
            }

            return response;
        }

    }
}