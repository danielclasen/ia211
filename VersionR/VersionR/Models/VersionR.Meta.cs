using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace VersionR.Models
{
    [MetadataType(typeof (UserMetadata))]
    public partial class User
    {
        public class UserMetadata
        {
            [Required(ErrorMessage = "Es wird ein Name benötigt.")]
            [MaxLength(64, ErrorMessage = "Der Name darf nicht länger als 64 Zeichen sein.")]
            public string NickName { get; set; }

            [Required(ErrorMessage = "Es wird eine Email benötigt.")]
            [MaxLength(64, ErrorMessage = "Die Email darf nicht länger als 64 Zeichen sein.")]
            [RegularExpression(@"[A-Za-z]+[0-9A-Za-z-_\.]*@[A-Za-z]+[0-9A-Za-z-_\.]*\.[a-z]+",
                ErrorMessage = "Ungültige Emailadresse.")]
            public string EMail { get; set; }

            [MaxLength(32, ErrorMessage = "Die Telefonnummer darf nicht länger als 32 Zeichen sein.")]
            [RegularExpression(@"[0-9]+", ErrorMessage = "Ungültige Telefonnummer.")]
            public string Phone { get; set; }
        }
    }

    [MetadataType(typeof (ModuleMetadata))]
    public partial class Module
    {
        public class ModuleMetadata
        {
            [Required(ErrorMessage = "Es wird ein Name benötigt.")]
            [MaxLength(64, ErrorMessage = "Der Name darf nicht länger als 64 Zeichen sein.")]
            public string Name { get; set; }

            [Required(ErrorMessage = "Es wird ein Preis benötigt.")]
            [RegularExpression(@"[0-9]+(\.[0-9]{2}$)?", ErrorMessage = "Ungültiger Preis.")]
            public double PricePerYear { get; set; }
        }
    }

    [MetadataType(typeof (RoleMetadata))]
    public partial class Role
    {
        public class RoleMetadata
        {
            [Required(ErrorMessage = "Es wird ein Name benötigt.")]
            [MaxLength(30, ErrorMessage = "Der Name darf nicht länger als 30 Zeichen sein.")]
            public string Name { get; set; }
        }
    }

    [MetadataType(typeof (VersionMetadata))]
    public partial class Version
    {
        public class VersionMetadata
        {
            [Required(ErrorMessage = "Es wird eine Releasenummer benötigt.")]
            [Range(0, 255, ErrorMessage = "Die Releasenummer muss zwischen 0 und 255 liegen")]
            public int Release { get; set; }

            [Required(ErrorMessage = "Es wird eine SubRelease Nummer benötigt.")]
            [Range(0, 255, ErrorMessage = "Die SubRelease Nummer muss zwischen 0 und 255 liegen")]
            public int SubRelease { get; set; }

            [Required(ErrorMessage = "Es wird eine Buildnummer benötigt.")]
            [MaxLength(32, ErrorMessage = "Die Buildnummer darf maximal 32 Zeichen lang sein")]
            public string BuildId { get; set; }

            [Required(ErrorMessage = "Es wird eine Plattform benötigt.")]
            [MaxLength(50, ErrorMessage = "Die Plattformbezeichnung darf maximal 50 Zeichen lang sein")]
            public string Platform { get; set; }

            [Required(ErrorMessage = "Es muss ein Dateipfad angegeben sein.")]
            [MaxLength(200, ErrorMessage = "Der Dateipfad darf maximal 200 Zeichen lang sein.")]
            public string Filename { get; set; }

            [MaxLength(1000, ErrorMessage = "Die Beschreibung darf maximal 1000 Zeichen lang sein.")]
            public string Description { get; set; }
        }
    }

    [MetadataType(typeof (ManualMetadata))]
    public partial class Manual
    {
        public class ManualMetadata
        {
            [Required(ErrorMessage = "Es wird eine Bezeichnung benötigt.")]
            [MaxLength(100, ErrorMessage = "Die Bezeichnung darf maximal 100 Zeichen lang sein")]
            public string Title { get; set; }

            [Required(ErrorMessage = "Es muss ein Dateipfad angegeben sein.")]
            [MaxLength(200, ErrorMessage = "Der Dateipfad darf maximal 200 Zeichen lang sein.")]
            public string Filename { get; set; }
        }
    }
}