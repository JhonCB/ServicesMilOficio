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
    /// ListarCategoriaController  
    /// </summary> 
    public class ListarCategoriaController : ApiController
    {
        /// <summary>  
        /// getListarCategoria
        /// </summary>  
        public ResponseCategoria getListarCategoria()
        {

            ResponseCategoria response = new ResponseCategoria();
            List<Categoria> alCategoria = new List<Categoria>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
                SqlCommand cmd = new SqlCommand("LISTA_CATEGORIA", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Categoria categoria = new Categoria();
                    categoria.codCategoria = dr.IsDBNull(dr.GetOrdinal("CODIGO")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("CODIGO"));
                    categoria.nomCategoria = dr.IsDBNull(dr.GetOrdinal("NOMBRE")) ? "" : dr.GetString(dr.GetOrdinal("NOMBRE"));
                    alCategoria.Add(categoria);
                }
             
                    response.codResultado = 1;
                    response.desResultado = "Lista de Categorias";
                    response.alCategoria = alCategoria;

            }
            catch (Exception ex)
            {
                response.codResultado = 0;
                response.desResultado = ex.ToString();
                response.alCategoria = null;
            }

            finally
            {
                con.Close();
            }

            return response;
        }

    }
}