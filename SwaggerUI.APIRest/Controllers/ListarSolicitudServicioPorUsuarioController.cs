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
     * SE ENCARGA DE LISTAR TODAS LAS SOLICITUDES QUE HIZO UN USUARIO
     **/

    /// <summary>  
    /// ListarSolicitudServicioPorUsuarioController  
    /// </summary> 
    public class ListarSolicitudServicioPorUsuarioController : ApiController
    {
        /// <summary>  
        /// getListarSolicitudPorUsuario
        /// </summary>  
        public ResponseSolicitud getListarSolicitudPorUsuario(int codUsuario)
        {

            ResponseSolicitud response = new ResponseSolicitud();
            List<Solicitud> alServicio = new List<Solicitud>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("BUSCAR_SOLICITUD_POR_USUARIO", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idusuario", codUsuario);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Solicitud solicitud = new Solicitud();

                    solicitud.idServicio = dr.IsDBNull(dr.GetOrdinal("IDSERVICIO")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("IDSERVICIO"));
                    solicitud.costo = dr.IsDBNull(dr.GetOrdinal("COSTO")) ? "" : dr.GetString(dr.GetOrdinal("COSTO"));
                    solicitud.cotizacion = dr.IsDBNull(dr.GetOrdinal("COTIZACION")) ? "" : dr.GetString(dr.GetOrdinal("COTIZACION"));
                    solicitud.estado = dr.IsDBNull(dr.GetOrdinal("ESTADO")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("ESTADO"));
                    DateTime dtFecha = dr.IsDBNull(dr.GetOrdinal("FECHA")) ? default(DateTime) : dr.GetDateTime(dr.GetOrdinal("FECHA"));
                    string fechaInicioString = dtFecha.ToString("dd/MM/yyyy hh:mm:ss");
                    solicitud.fecha = fechaInicioString;
                    solicitud.categoria = dr.IsDBNull(dr.GetOrdinal("CATEGORIA")) ? "" : dr.GetString(dr.GetOrdinal("CATEGORIA"));
                    solicitud.urlFoto = dr.IsDBNull(dr.GetOrdinal("URLFOTO")) ? "" : dr.GetString(dr.GetOrdinal("URLFOTO"));
                    solicitud.nomOfertante = dr.IsDBNull(dr.GetOrdinal("NOMBREOFERTANTE")) ? "" : dr.GetString(dr.GetOrdinal("NOMBREOFERTANTE"));
                    solicitud.desServicio = dr.IsDBNull(dr.GetOrdinal("DESCRIPCIONSERVICIO")) ? "" : dr.GetString(dr.GetOrdinal("DESCRIPCIONSERVICIO"));
                    solicitud.ubicacion = dr.IsDBNull(dr.GetOrdinal("UBICACION")) ? "" : dr.GetString(dr.GetOrdinal("UBICACION"));
                    
                    alServicio.Add(solicitud);
                }
             
                    response.codResultado = 1;
                    response.desResultado = "Lista de solicitudes del usuario";
                    response.listaSolicitud = alServicio;

            }
            catch (Exception ex)
            {
                response.codResultado = 0;
                response.desResultado = ex.ToString();
                response.listaSolicitud = null;
            }

            finally
            {
                con.Close();
            }

            return response;
        }

    }
}