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
     * SE ENCARGA DE LISTAR TODOS LAS OFERTAS DISPONIBLES
     **/

    /// <summary>  
    /// ListarServicioController  
    /// </summary> 
    public class ListarServicioController : ApiController
    {
        /// <summary>  
        /// getListarServicio
        /// </summary>  
        public ResponseServicio getListarServicio()
        {

            ResponseServicio response = new ResponseServicio();
            List<Servicio> alServicio = new List<Servicio>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("LISTAR_SERVICIO", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Servicio servicio = new Servicio();
                    servicio.codServicio = dr.IsDBNull(dr.GetOrdinal("CODIGO")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("CODIGO"));
                    servicio.nombre = dr.IsDBNull(dr.GetOrdinal("NOMBRE")) ? "" : dr.GetString(dr.GetOrdinal("NOMBRE"));
                    servicio.urlFoto = dr.IsDBNull(dr.GetOrdinal("URLFOTO")) ? "" : dr.GetString(dr.GetOrdinal("URLFOTO"));
                    servicio.calificacion = dr.IsDBNull(dr.GetOrdinal("CALIFICACION")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("CALIFICACION"));

                    DateTime dtFechaInicio = dr.IsDBNull(dr.GetOrdinal("FECHA-INICIO")) ? default(DateTime) : dr.GetDateTime(dr.GetOrdinal("FECHA-INICIO"));
                    string fechaInicioString = dtFechaInicio.ToString("dd/MM/yyyy hh:mm:ss");
                    servicio.fechaInicio = fechaInicioString;

                    DateTime dtFechaFin = dr.IsDBNull(dr.GetOrdinal("FECHA-FIN")) ? default(DateTime) : dr.GetDateTime(dr.GetOrdinal("FECHA-FIN"));
                    string fechaFinString = dtFechaFin.ToString("dd/MM/yyyy hh:mm:ss");
                    servicio.fechaFin = fechaFinString;

                    servicio.estado = dr.IsDBNull(dr.GetOrdinal("ESTADO")) ? "" : dr.GetString(dr.GetOrdinal("ESTADO"));
                    servicio.descripcionServicio = dr.IsDBNull(dr.GetOrdinal("DESCRIPCIONSERVICIO")) ? "" : dr.GetString(dr.GetOrdinal("DESCRIPCIONSERVICIO"));
                    servicio.descripcion = dr.IsDBNull(dr.GetOrdinal("DESCRIPCION")) ? "" : dr.GetString(dr.GetOrdinal("DESCRIPCION"));
                    servicio.ubicacion = dr.IsDBNull(dr.GetOrdinal("UBICACION")) ? "" : dr.GetString(dr.GetOrdinal("UBICACION"));
                    servicio.latitud = dr.IsDBNull(dr.GetOrdinal("LATITUD")) ? "" : dr.GetString(dr.GetOrdinal("LATITUD"));
                    servicio.longitud = dr.IsDBNull(dr.GetOrdinal("LONGITUD")) ? "" : dr.GetString(dr.GetOrdinal("LONGITUD"));

                    alServicio.Add(servicio);
                }
             
                    response.codResultado = 1;
                    response.desResultado = "Lista de Servicios";
                    response.listaServicio = alServicio;

            }
            catch (Exception ex)
            {
                response.codResultado = 0;
                response.desResultado = ex.ToString();
                response.listaServicio = null;
            }

            finally
            {
                con.Close();
            }

            return response;
        }

    }
}