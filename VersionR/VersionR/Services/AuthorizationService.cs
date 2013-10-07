using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace VersionR.Services
{
    public class VersionRMembershipProvider : SqlMembershipProvider
    {
        private VersionR.Models.VersionR db = new VersionR.Models.VersionR();

        public override bool ValidateUser(string email, string password)
        {
            string hashedPassword = PasswordService.getMD5Hash(password);

            try
            {
                var user = (from u in db.Users
                            where u.EMail == email && u.PwHash == hashedPassword
                            select u).Single();
                return true;
            }
            catch (Exception e)
            {
                //throw new Exception(e.Message + "  hashedPassword = " + hashedPassword + "  email = " + email);
                return false;
            }
            //return FormsAuthentication.Authenticate(email, password);
        }
    }

    public class VersionRRoleProvider : RoleProvider
    {
        private VersionR.Models.VersionR db = new VersionR.Models.VersionR();

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override string ApplicationName
        {
            get { throw new NotImplementedException(); }
            set { throw new NotImplementedException(); }
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override string[] GetRolesForUser(string email)
        {
            string[] roles = (from r in db.Roles
                              where r.Users.Any(u => u.EMail == email)
                              select r.Name).ToArray();

            //throw new Exception("email = " + email + " roles = " + roles[0]);

            return roles;
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string email, string roleName)
        {
            bool inRole = (from u in db.Users
                           where u.EMail == email && u.Role.Name == roleName
                           select u).Any();

            //throw new Exception("email = " + email + " rolename = " + roleName);

            return inRole;
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }

    public class AuthorizeWithNotifyAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            base.OnAuthorization(filterContext);

            if (!filterContext.HttpContext.User.Identity.IsAuthenticated)
            {
                if (filterContext.HttpContext.Request.HttpMethod.Equals("GET",
                                                                        System.StringComparison.CurrentCultureIgnoreCase))
                {
                    filterContext.Result =
                        new RedirectResult("~/Auth/LogOn?ReturnUrl=" +
                                           HttpUtility.UrlEncode(filterContext.HttpContext.Request.RawUrl));
                }
                else
                {
                    filterContext.Result = new RedirectResult("~/Auth/LogOn");
                }
            }
            else if (filterContext.Result is HttpUnauthorizedResult)
            {
                filterContext.Result = new RedirectResult("~/Auth/AccessDenied");
            }
        }
    }

    public class PasswordService
    {
        /// <summary>
        /// Gibt einen MD5 Hash als String zurück
        /// </summary>
        /// <param name="TextToHash">string der Gehasht werden soll.</param>
        /// <returns>Hash als string.</returns>
        public static string getMD5Hash(string TextToHash)
        {
            //Prüfen ob Daten übergeben wurden.
            if ((TextToHash == null) || (TextToHash.Length == 0))
            {
                throw new FormatException("Password empty!");
            }

            //MD5 Hash aus dem String berechnen. Dazu muss der string in ein Byte[]
            //zerlegt werden. Danach muss das Resultat wieder zurück in ein string.
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] textToHash = Encoding.Default.GetBytes(TextToHash);
            byte[] result = md5.ComputeHash(textToHash);

            string ret = System.BitConverter.ToString(result);
            return ret.Replace("-", "");
        }
    }
}