using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace VersionR.Models
{
    [MetadataType(typeof(UserMetadata))]
    public partial class User
    {
        class UserMetadata
        {
            [Required(ErrorMessage = "Es wird ein Name benötigt.")]
            [MaxLength(64, ErrorMessage = "Der Name darf nicht länger als 64 Zeichen sein.")]
            public string NickName { get; set; }

            [Required(ErrorMessage = "Es wird eine Email benötigt.")]
            [MaxLength(64, ErrorMessage = "Die Email darf nicht länger als 64 Zeichen sein.")]
            //[RegularExpression("([A-Z]|[a-z])+[0-9]", ErrorMessage="Ungültige Emailadresse.")]
            public string EMail { get; set; }

        }
    }
}