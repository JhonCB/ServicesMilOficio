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
    /// ListaTipoUsuarioController  
    /// </summary> 
    public class ListaTipoUsuarioController : ApiController
    {
        /// <summary>  
        /// getListarTipoUsuario
        /// </summary>  
        public ResponseRol getListarTipoUsuario()
        {

            ResponseRol response = new ResponseRol();
            List<Rol> alRol = new List<Rol>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("LISTAR_ROL", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Rol categoria = new Rol();
                    categoria.codRol = dr.IsDBNull(dr.GetOrdinal("CODIGO")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("CODIGO"));
                    categoria.nomRol = dr.IsDBNull(dr.GetOrdinal("NOMBRE")) ? "" : dr.GetString(dr.GetOrdinal("NOMBRE"));
                    alRol.Add(categoria);
                }
             
                    response.codResultado = 1;
                    response.desResultado = "Lista de Roles";
                    response.listaRol = alRol;

            }
            catch (Exception ex)
            {
                response.codResultado = 0;
                response.desResultado = ex.ToString();
                response.listaRol = null;
            }

            finally
            {
                con.Close();
            }

            return response;
        }

    }
}