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
using System.Net.Mail;
using System.Web.Http;
using System.Web.Http.Description;

namespace SwaggerUI.APIRest.Controllers
{

    /// <summary>  
    /// GenerarRecuperacionContraseniaController  
    /// </summary> 
    public class GenerarRecuperacionContraseniaController : ApiController
    {
        /// <summary>  
        /// getGenerarRecuperacionContrasenia
        /// </summary>  
        public ResponseRecuperarContrasenia getGenerarRecuperacionContrasenia(String correo)
        {

            ResponseRecuperarContrasenia response = new ResponseRecuperarContrasenia();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnxANTP"].ToString());
            try
            {
               SqlCommand cmd = new SqlCommand("GENERAR_RECUPERACION_CUENTA", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", correo);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();

                //corregir xd
                response.codResultado = dr.IsDBNull(dr.GetOrdinal("CodResultado")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("CodResultado"));
                MailMessage msgCorreo = new MailMessage();
                msgCorreo.To.Add(correo);
                msgCorreo.Subject = "Recuperación de cuenta";
                msgCorreo.SubjectEncoding = System.Text.Encoding.UTF8;
                //msgCorreo.Bcc.Add(""); //enviara a otros tambien
                RecuperarContrasenia recuperarContrasenia = new RecuperarContrasenia();
                int codUsuario = dr.IsDBNull(dr.GetOrdinal("IdUsuario")) ? default(Int32) : dr.GetInt32(dr.GetOrdinal("IdUsuario"));
                String codigoParaRecuperar = dr.IsDBNull(dr.GetOrdinal("CodAutogenerado")) ? "" : dr.GetString(dr.GetOrdinal("CodAutogenerado"));

                recuperarContrasenia.codUsuario = codUsuario;
                recuperarContrasenia.codigoAutogenerado = codigoParaRecuperar;
                response.recuperarContrasenia = recuperarContrasenia;

                if (response.codResultado == 1)
                {  
                    string htmlString = @"<html> <body><p>Hola estimado usuario,</p><p>Recientemente solicitó un cambio de contrasenia, si no fue usted ignore este mensaje.</p><p>código : " + codigoParaRecuperar + "<p>Tenga buen dia</p><br>-Equipo MilOficios</br></p> </body> </html>";
                    msgCorreo.Body = htmlString;
                    msgCorreo.IsBodyHtml = true;
                    //msgCorreo.BodyEncoding = System.Text.Encoding.UTF8;
                    msgCorreo.From = new MailAddress("miloficiossoporte@gmail.com");

                    SmtpClient cliente = new SmtpClient();
                    cliente.Credentials = new NetworkCredential("miloficiossoporte@gmail.com", "soyunacontrasenia");

                    cliente.Port = 25;
                    cliente.EnableSsl = true;
                    cliente.Host = "smtp.gmail.com";

                    cliente.Send(msgCorreo);
                    response.desResultado = "El mensaje fue enviado con exito";
                }
                else if(response.codResultado == 2)
                {
                    response.desResultado = "Sobrepasó el limite de envio por dia, vuelva a intentarlo mañana";
                }
                else
                {
                    response.desResultado = "No existe el correo en nuestro sistema";
                }

            }
            catch (Exception ex)
            {
                response.codResultado = 0;
                response.desResultado = ex.ToString();
            }

            finally
            {
                //con.Close();
            }

            return response;
        }

    }
}