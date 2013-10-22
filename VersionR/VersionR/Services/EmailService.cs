using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Globalization;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Hosting;
using VersionR.Models;
using Version = VersionR.Models.Version;

namespace VersionR.Services
{
    public interface IEmailTemplate
    {
        string TemplatePath { get; set; }

        string Body { get; set; }

        bool IsHtml { get; set; }

        Regex Re { get; set; }

        Dictionary<string, string> Fields { get; set; }
    }

    public class DefaultEmailTemplate : IEmailTemplate
    {
        public string TemplatePath { get; set; }

        public string Body { get; set; }

        public bool IsHtml { get; set; }

        public Regex Re { get; set; }

        public Dictionary<string, string> Fields { get; set; }

        private string FileContents { get; set; }

        protected DefaultEmailTemplate(string path = "")
        {
            TemplatePath = Path.Combine(HttpContext.Current.Request.PhysicalApplicationPath, path);
            IsHtml = true;
            Re = new Regex(@"\$(\w+)\$", RegexOptions.Compiled);
        }

        protected void ReadTemplate()
        {
            FileContents = File.ReadAllText(TemplatePath);
            Body = Re.Replace(FileContents, match => Fields[match.Groups[1].Value]);
        }
    }

    public class NewVersionEmailTemplate : DefaultEmailTemplate
    {
        public NewVersionEmailTemplate(User user, Module module, Version version)
            : base("Services/EmailTemplates/NewVersionEmailTemplate.html")
        {
            Fields = new Dictionary<string, string>(
                StringComparer.OrdinalIgnoreCase)
                         {
                             {"username", user.NickName},
                             {"date", DateTime.Now.ToString("d", CultureInfo.CreateSpecificCulture("de-DE"))},
                             {"modulename", module.Name},
                             {"newversion", version.Release.ToString()}
                         };

            ReadTemplate();
        }
    }

    public class EmailMessage
    {
        public string To { get; set; }

        public string From { get; set; }

        public string Subject { get; set; }

        public IEmailTemplate Template { get; set; }
    }

    public class EmailService
    {
        public bool SendMessage(EmailMessage message, string username, string password, string host, int port,
                                bool enableSsl)
        {
            MailMessage mm = new MailMessage(message.From, message.To, message.Subject, message.Template.Body);
            if (message.Template.IsHtml)
                mm.IsBodyHtml = true;
            NetworkCredential credentials = new NetworkCredential(username, password);
            SmtpClient sc = new SmtpClient(host, port);
            sc.EnableSsl = enableSsl;
            sc.Credentials = credentials;

            try
            {
                sc.SendAsync(mm, message.To);
                return true;
            }
            catch (Exception)
            {
                //add to logging db
                return false;
            }
        }
    }
}