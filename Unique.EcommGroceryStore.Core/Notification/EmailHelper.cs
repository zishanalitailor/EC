using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Unique.EcommGroceryStore.Core.Notification
{
    public class EmailHelper
    {
        #region "Constant(s)"
        private static readonly string smtpHost = ConfigurationManager.AppSettings["smtpHost"];
        private static readonly int smtpPort = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPort"]);
        private static readonly string smtpUserName = ConfigurationManager.AppSettings["smtpUserName"];
        private static readonly string smtpPassword = ConfigurationManager.AppSettings["smtpPassword"];
        private static readonly bool enableSSL = Convert.ToBoolean(ConfigurationManager.AppSettings["enableSSL"]);
        private static readonly string fromEmail = ConfigurationManager.AppSettings["fromemail"];
        #endregion

        #region "Constructor(s)"
        public EmailHelper()
        {

        }
        #endregion

        #region "Public Method(s)"
        #region "Public Method(s)"
        public static bool SendMail(string sFrom, string sTo, string sSubject, string sBody)
        {
            try
            {
                sFrom = fromEmail;
                MailMessage message = new MailMessage();
                SmtpClient client = new SmtpClient();
                MailAddress fromAddress = new MailAddress(sFrom);
                message.From = fromAddress;
                message.To.Add(sTo);
                message.IsBodyHtml = true;
                message.Body = sBody;
                message.Subject = sSubject;
                client.Host = smtpHost;
                client.Port = smtpPort;
                client.EnableSsl = enableSSL;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential(smtpUserName, smtpPassword);
                client.Send(message);
                return true;
            }
            catch (SmtpException ex)
            {
                //throw ex;
                return false;
            }
        }

        #endregion

        public static string GetBodyFromHtml(string path)
        {
            return File.ReadAllText(path);
        }

        #endregion

        #region "Private Method(s)"
        #endregion
    }
}
