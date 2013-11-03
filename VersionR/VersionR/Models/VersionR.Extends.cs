using System;
using System.Collections.Generic;
using System.Data;
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

        public string GetVersionString()
        {
            return this.Release + "." + this.SubRelease + "." + this.BuildId;
        }

        public bool IsNewest()
        {
            return this.VrId ==
                   this.Module.Versions.OrderByDescending(v => v.Release + v.SubRelease + v.BuildId).First().VrId;
        }
    }

    public partial class Module
    {
        public Version GetLatestVersion()
        {
            var versions = Versions.OrderByDescending(v => v.Release + v.SubRelease + v.BuildId);
            if (versions.Any())
                return versions.First();
            else
            {
                throw new DataException("Es wurden keiner Versionen gefunden!");
            }
        }

        public int GetTotalDownloads()
        {
            return this.Versions.Sum(v => v.Downloads.Count);
        }

        public int GetRgbColor()
        {
            uint hash = 0;
            foreach (byte b in System.Text.Encoding.Unicode.GetBytes(Name))
            {
                hash += b;
                hash += (hash << 10);
                hash ^= (hash >> 6);
            }
            // final avalanche
            hash += (hash << 3);
            hash ^= (hash >> 11);
            hash += (hash << 15);
            // we only want positive integer < 1000000
            return (int) (hash%1000000);
        }
    }
}