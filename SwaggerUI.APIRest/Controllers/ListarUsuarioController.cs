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
    /**
     * SE ENCARGA DE LISTAR TODOS LOS USUARIOS DISPONIBLES
     **/

    /// <summary>  
    /// ListarUsuarioController  
    /// </summary> 
    public class ListarUsuarioController : ApiController
    {
        /// <summary>  
        /// getListarUsuario
        /// </summary>  
        public ResponseUsuario getListarUsuario()
        {

            ResponseUsuario response = new ResponseUsuario();
            List<Usuario> alUsuario = new List<Usuario>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("LISTAR_USUARIO", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Usuario usuario = new Usuario();
                    usuario.codUsuario = dr.IsDBNull(dr.GetOrdinal("CODIGO")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("CODIGO"));
                    usuario.nombres = dr.IsDBNull(dr.GetOrdinal("NOMBRE")) ? "" : dr.GetString(dr.GetOrdinal("NOMBRE"));
                    usuario.correo = dr.IsDBNull(dr.GetOrdinal("CORREO")) ? "" : dr.GetString(dr.GetOrdinal("CORREO"));

                    usuario.contrasenia = dr.IsDBNull(dr.GetOrdinal("PASSWORD")) ? "" : dr.GetString(dr.GetOrdinal("PASSWORD"));
                    usuario.telefono = dr.IsDBNull(dr.GetOrdinal("TELEFONO")) ? "" : dr.GetString(dr.GetOrdinal("TELEFONO"));
                    usuario.activo = dr.IsDBNull(dr.GetOrdinal("ACTIVO")) ? false : dr.GetBoolean(dr.GetOrdinal("ACTIVO"));
                    usuario.eliminado = dr.IsDBNull(dr.GetOrdinal("ELIMINADO")) ? false : dr.GetBoolean(dr.GetOrdinal("ELIMINADO"));

                    DateTime dtFechaInicio = dr.IsDBNull(dr.GetOrdinal("FECHA")) ? default(DateTime) : dr.GetDateTime(dr.GetOrdinal("FECHA"));
                    string fechaInicioString = dtFechaInicio.ToString("dd/MM/yyyy hh:mm:ss");
                    usuario.fechaNacimiento = fechaInicioString;

                    usuario.tipoUsuario = dr.IsDBNull(dr.GetOrdinal("IDROL")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("IDROL"));
                    usuario.rol = dr.IsDBNull(dr.GetOrdinal("ROL")) ? "" : dr.GetString(dr.GetOrdinal("ROL"));
                    usuario.ubicacion = dr.IsDBNull(dr.GetOrdinal("UBICACION")) ? "" : dr.GetString(dr.GetOrdinal("UBICACION"));
                    usuario.latitud = dr.IsDBNull(dr.GetOrdinal("LATITUD")) ? "" : dr.GetString(dr.GetOrdinal("LATITUD"));
                    usuario.longitud = dr.IsDBNull(dr.GetOrdinal("LONGITUD")) ? "" : dr.GetString(dr.GetOrdinal("LONGITUD"));
                    usuario.urlFoto = dr.IsDBNull(dr.GetOrdinal("URLFOTO")) ? "" : dr.GetString(dr.GetOrdinal("URLFOTO"));

                    alUsuario.Add(usuario);
                }
             
                    response.codResultado = 1;
                    response.desResultado = "Lista de Usuarios";
                    response.listaUsuario = alUsuario;

            }
            catch (Exception ex)
            {
                response.codResultado = 0;
                response.desResultado = ex.ToString();
                response.listaUsuario = null;
            }

            finally
            {
                con.Close();
            }

            return response;
        }

    }
}