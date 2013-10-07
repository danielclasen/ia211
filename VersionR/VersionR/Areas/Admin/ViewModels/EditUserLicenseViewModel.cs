using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;
using VersionR.Models;

namespace VersionR.Areas.Admin.ViewModels
{
    public class EditUserLicenseViewModel
    {
        public int OrderId { get; set; }

        public int CmId { get; set; }

        public int LicenseYears { get; set; }

        public string BuyDate { get; set; }

        public User User { get; set; }

        public Module Module { get; set; }
    }
}