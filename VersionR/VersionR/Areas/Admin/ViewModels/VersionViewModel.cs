using System;
using Version = VersionR.Models.Version;

namespace VersionR.Areas.Admin.ViewModels
{
    public class VersionViewModel
    {
        public Version Version { get; set; }

        public String ReleaseDate { get; set; }
    }
}