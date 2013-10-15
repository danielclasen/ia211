using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VersionR.Models
{
    public partial class Version
    {
        public bool IsGreater(Version compareVersion)
        {
            return (this.Release > compareVersion.Release || this.SubRelease > compareVersion.SubRelease ||
                    this.BuildId != compareVersion.BuildId);
        }
    }

    public partial class Module
    {
        public Version GetLatestVersion()
        {
            return Versions.OrderByDescending(v => v.Release + v.SubRelease + v.BuildId).First();
        }
    }
}