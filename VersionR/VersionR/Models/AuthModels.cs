using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace VersionR.Models
{

    #region Modelle
    [PropertiesMustMatch("NewPassword", "ConfirmPassword", ErrorMessage = "Das neue Kennwort entspricht nicht dem Bestätigungskennwort.")]
    public class ChangePasswordModel
    {
        [Required]
        [DataType(DataType.Password)]
        [DisplayName("Aktuelles Kennwort")]
        public string OldPassword { get; set; }

        [Required]
        [ValidatePasswordLength]
        [DataType(DataType.Password)]
        [DisplayName("Neues Kennwort")]
        public string NewPassword { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [DisplayName("Neues Kennwort bestätigen")]
        public string ConfirmPassword { get; set; }
    }

    public class LogOnModel
    {
        [Required]
        [DisplayName("Benutzername")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [DisplayName("Kennwort")]
        public string Password { get; set; }

        [DisplayName("Speichern?")]
        public bool RememberMe { get; set; }
    }

    [PropertiesMustMatch("Password", "ConfirmPassword", ErrorMessage = "Das Kennwort entspricht nicht dem Bestätigungskennwort.")]
    public class RegisterModel
    {
        [Required]
        [DisplayName("Benutzername")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        [DisplayName("E-Mail-Adresse")]
        public string Email { get; set; }

        [Required]
        [ValidatePasswordLength]
        [DataType(DataType.Password)]
        [DisplayName("Kennwort")]
        public string Password { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [DisplayName("Kennwort bestätigen")]
        public string ConfirmPassword { get; set; }
    }
    #endregion

    #region Services
    // Der FormsAuthentication-Typ ist versiegelt und enthält statische Member, weshalb
    // Komponententests des Codes, von dem die Member aufgerufen werden, nicht ganz einfach sind. Von der Schnittstellen- und Helper-Klasse weiter unten wird veranschaulicht,
    // wie ein abstrakter Wrapper für einen solchen Typ erstellt wird, um dafür zu sorgen, dass für den AccountController-
    // Code Komponententests ausgeführt werden können.

    public interface IMembershipService
    {
        int MinPasswordLength { get; }

        bool ValidateUser(string userName, string password);
        MembershipCreateStatus CreateUser(string userName, string password, string email);
        bool ChangePassword(string userName, string oldPassword, string newPassword);
    }

    public class AccountMembershipService : IMembershipService
    {
        private readonly MembershipProvider _provider;

        public AccountMembershipService()
            : this(null)
        {
        }

        public AccountMembershipService(MembershipProvider provider)
        {
            _provider = provider ?? Membership.Provider;
        }

        public int MinPasswordLength
        {
            get
            {
                return _provider.MinRequiredPasswordLength;
            }
        }

        public bool ValidateUser(string userName, string password)
        {
            if (String.IsNullOrEmpty(userName)) throw new ArgumentException("Der Wert darf nicht NULL oder leer sein.", "userName");
            if (String.IsNullOrEmpty(password)) throw new ArgumentException("Der Wert darf nicht NULL oder leer sein.", "password");

            return _provider.ValidateUser(userName, password);
        }

        public MembershipCreateStatus CreateUser(string userName, string password, string email)
        {
            if (String.IsNullOrEmpty(userName)) throw new ArgumentException("Der Wert darf nicht NULL oder leer sein.", "userName");
            if (String.IsNullOrEmpty(password)) throw new ArgumentException("Der Wert darf nicht NULL oder leer sein.", "password");
            if (String.IsNullOrEmpty(email)) throw new ArgumentException("Der Wert darf nicht NULL oder leer sein.", "email");

            MembershipCreateStatus status;
            _provider.CreateUser(userName, password, email, null, null, true, null, out status);
            return status;
        }

        public bool ChangePassword(string userName, string oldPassword, string newPassword)
        {
            if (String.IsNullOrEmpty(userName)) throw new ArgumentException("Der Wert darf nicht NULL oder leer sein.", "userName");
            if (String.IsNullOrEmpty(oldPassword)) throw new ArgumentException("Der Wert darf nicht NULL oder leer sein.", "oldPassword");
            if (String.IsNullOrEmpty(newPassword)) throw new ArgumentException("Der Wert darf nicht NULL oder leer sein.", "newPassword");

            // In bestimmten Fehlerszenarios wird von der zugrunde liegenden ChangePassword()-Methode
            // nicht "false" zurückgegeben, sondern eine Ausnahme ausgelöst.
            try
            {
                MembershipUser currentUser = _provider.GetUser(userName, true /* userIsOnline */);
                return currentUser.ChangePassword(oldPassword, newPassword);
            }
            catch (ArgumentException)
            {
                return false;
            }
            catch (MembershipPasswordException)
            {
                return false;
            }
        }
    }

    public interface IFormsAuthenticationService
    {
        void SignIn(string userName, bool createPersistentCookie);
        void SignOut();
    }

    public class FormsAuthenticationService : IFormsAuthenticationService
    {
        public void SignIn(string userName, bool createPersistentCookie)
        {
            if (String.IsNullOrEmpty(userName)) throw new ArgumentException("Der Wert darf nicht NULL oder leer sein.", "userName");

            FormsAuthentication.SetAuthCookie(userName, createPersistentCookie);
        }

        public void SignOut()
        {
            FormsAuthentication.SignOut();
        }
    }
    #endregion

    #region Validation
    public static class AccountValidation
    {
        public static string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // Unter "http://go.microsoft.com/fwlink/?LinkID=177550" finden Sie
            // eine vollständige Liste mit Statuscodes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "Der Benutzername ist bereits vorhanden. Geben Sie einen anderen Benutzernamen ein.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "Für diese E-Mail-Adresse ist bereits ein Benutzername vorhanden. Geben Sie eine andere E-Mail-Adresse ein.";

                case MembershipCreateStatus.InvalidPassword:
                    return "Das angegebene Kennwort ist ungültig. Geben Sie einen gültigen Kennwortwert ein.";

                case MembershipCreateStatus.InvalidEmail:
                    return "Die angegebene E-Mail-Adresse ist ungültig. Überprüfen Sie den Wert, und wiederholen Sie den Vorgang.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "Die angegebene Kennwortabrufantwort ist ungültig. Überprüfen Sie den Wert, und wiederholen Sie den Vorgang.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "Die angegebene Kennwortabruffrage ist ungültig. Überprüfen Sie den Wert, und wiederholen Sie den Vorgang.";

                case MembershipCreateStatus.InvalidUserName:
                    return "Der angegebene Benutzername ist ungültig. Überprüfen Sie den Wert, und wiederholen Sie den Vorgang.";

                case MembershipCreateStatus.ProviderError:
                    return "Vom Authentifizierungsanbieter wurde ein Fehler zurückgegeben. Überprüfen Sie die Eingabe, und wiederholen Sie den Vorgang. Sollte das Problem weiterhin bestehen, wenden Sie sich an den zuständigen Systemadministrator.";

                case MembershipCreateStatus.UserRejected:
                    return "Die Benutzererstellungsanforderung wurde abgebrochen. Überprüfen Sie die Eingabe, und wiederholen Sie den Vorgang. Sollte das Problem weiterhin bestehen, wenden Sie sich an den zuständigen Systemadministrator.";

                default:
                    return "Unbekannter Fehler. Überprüfen Sie die Eingabe, und wiederholen Sie den Vorgang. Sollte das Problem weiterhin bestehen, wenden Sie sich an den zuständigen Systemadministrator.";
            }
        }
    }

    [AttributeUsage(AttributeTargets.Class, AllowMultiple = true, Inherited = true)]
    public sealed class PropertiesMustMatchAttribute : ValidationAttribute
    {
        private const string _defaultErrorMessage = "'{0}' und '{1}' stimmen nicht überein.";
        private readonly object _typeId = new object();

        public PropertiesMustMatchAttribute(string originalProperty, string confirmProperty)
            : base(_defaultErrorMessage)
        {
            OriginalProperty = originalProperty;
            ConfirmProperty = confirmProperty;
        }

        public string ConfirmProperty { get; private set; }
        public string OriginalProperty { get; private set; }

        public override object TypeId
        {
            get
            {
                return _typeId;
            }
        }

        public override string FormatErrorMessage(string name)
        {
            return String.Format(CultureInfo.CurrentUICulture, ErrorMessageString,
                OriginalProperty, ConfirmProperty);
        }

        public override bool IsValid(object value)
        {
            PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(value);
            object originalValue = properties.Find(OriginalProperty, true /* ignoreCase */).GetValue(value);
            object confirmValue = properties.Find(ConfirmProperty, true /* ignoreCase */).GetValue(value);
            return Object.Equals(originalValue, confirmValue);
        }
    }

    [AttributeUsage(AttributeTargets.Field | AttributeTargets.Property, AllowMultiple = false, Inherited = true)]
    public sealed class ValidatePasswordLengthAttribute : ValidationAttribute
    {
        private const string _defaultErrorMessage = "'{0}' muss mindestens {1} Zeichen lang sein.";
        private readonly int _minCharacters = Membership.Provider.MinRequiredPasswordLength;

        public ValidatePasswordLengthAttribute()
            : base(_defaultErrorMessage)
        {
        }

        public override string FormatErrorMessage(string name)
        {
            return String.Format(CultureInfo.CurrentUICulture, ErrorMessageString,
                name, _minCharacters);
        }

        public override bool IsValid(object value)
        {
            string valueAsString = value as string;
            return (valueAsString != null && valueAsString.Length >= _minCharacters);
        }
    }
    #endregion

}