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
    /// ListarSolicitudServicioPorSocioController  
    /// </summary> 
    public class ListarSolicitudServicioPorSocioController : ApiController
    {
        /// <summary>  
        /// getListarSolicitudPorUsuario
        /// </summary>  
        public ResponseSolicitud getListarSolicitudPorSocio(int codSocio)
        {

            ResponseSolicitud response = new ResponseSolicitud();
            List<Solicitud> alServicio = new List<Solicitud>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("LISTAR_SOLICITUD_X_SOCIO", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idUsuario", codSocio);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Solicitud solicitud = new Solicitud();

                    solicitud.idSolicitud = dr.IsDBNull(dr.GetOrdinal("IDSOLICITUD")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("IDSOLICITUD"));
                    solicitud.idServicio = dr.IsDBNull(dr.GetOrdinal("IDSERVICIO")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("IDSERVICIO"));
                    solicitud.costo = dr.IsDBNull(dr.GetOrdinal("COSTO")) ? "" : dr.GetString(dr.GetOrdinal("COSTO"));
                    solicitud.cotizacion = dr.IsDBNull(dr.GetOrdinal("COTIZACION")) ? "" : dr.GetString(dr.GetOrdinal("COTIZACION"));
                    solicitud.estado = dr.IsDBNull(dr.GetOrdinal("ESTADO")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("ESTADO"));
                    DateTime dtFecha = dr.IsDBNull(dr.GetOrdinal("FECHA")) ? default(DateTime) : dr.GetDateTime(dr.GetOrdinal("FECHA"));
                    string fechaInicioString = dtFecha.ToString("dd/MM/yyyy hh:mm:ss");
                    solicitud.fecha = fechaInicioString;
                    solicitud.categoria = dr.IsDBNull(dr.GetOrdinal("CATEGORIA")) ? "" : dr.GetString(dr.GetOrdinal("CATEGORIA"));
                    solicitud.urlFoto = dr.IsDBNull(dr.GetOrdinal("URLFOTO")) ? "" : dr.GetString(dr.GetOrdinal("URLFOTO"));
                    solicitud.nomOfertante = dr.IsDBNull(dr.GetOrdinal("NOMBRESOLICITANTE")) ? "" : dr.GetString(dr.GetOrdinal("NOMBRESOLICITANTE"));
                    solicitud.desServicio = dr.IsDBNull(dr.GetOrdinal("DESCRIPCIONSERVICIO")) ? "" : dr.GetString(dr.GetOrdinal("DESCRIPCIONSERVICIO"));
                    solicitud.ubicacion = dr.IsDBNull(dr.GetOrdinal("UBICACION")) ? "" : dr.GetString(dr.GetOrdinal("UBICACION"));
                    
                    alServicio.Add(solicitud);
                }
             
                    response.codResultado = 1;
                    response.desResultado = "Lista de solicitudes hacia el socio";
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