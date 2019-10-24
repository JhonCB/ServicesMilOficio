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
    /// ListarLocalizacionController  
    /// </summary> 
    public class ListarLocalizacionController : ApiController
    {
        /// <summary>  
        /// getListarLocalizacion
        /// </summary>  
        public ResponeLocalizacion getListarLocalizacion()
        {

            ResponeLocalizacion response = new ResponeLocalizacion();
            List<Localizacion> alLocalizacion = new List<Localizacion>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("LISTAR_UBICACION", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Localizacion localizacion = new Localizacion();
                    localizacion.codLocalizacion = dr.IsDBNull(dr.GetOrdinal("ID")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("ID"));
                    localizacion.nomLocalizacion = dr.IsDBNull(dr.GetOrdinal("Ubicacion")) ? "" : dr.GetString(dr.GetOrdinal("Ubicacion"));
                    localizacion.latitud = dr.IsDBNull(dr.GetOrdinal("Latitud")) ? "" : dr.GetString(dr.GetOrdinal("Latitud"));
                    localizacion.longitud = dr.IsDBNull(dr.GetOrdinal("Longitud")) ? "" : dr.GetString(dr.GetOrdinal("Longitud"));
                    alLocalizacion.Add(localizacion);
                }
             
                    response.codResultado = 1;
                    response.desResultado = "Lista de Ubicaciones";
                    response.alLocalizacion = alLocalizacion;

            }
            catch (Exception ex)
            {
                response.codResultado = 0;
                response.desResultado = ex.ToString();
                response.alLocalizacion = null;
            }

            finally
            {
                con.Close();
            }

            return response;
        }

    }
}