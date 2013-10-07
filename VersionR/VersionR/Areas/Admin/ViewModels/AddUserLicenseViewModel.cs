using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;
using VersionR.Models;

namespace VersionR.Areas.Admin.ViewModels
{
    public class AddUserLicenseViewModel
    {
        private readonly Models.VersionR _db = new Models.VersionR();

        public IEnumerable<SelectListItem> Modules { get; set; }

        public int LicenseYears { get; set; }

        public string BuyDate { get; set; }

        public int ModId { get; set; }

        public User User { get; set; }

        public AddUserLicenseViewModel()
        {
            BuyDate = DateTime.Now.ToString("d", CultureInfo.CreateSpecificCulture("de-DE"));
            LicenseYears = 1;
            PopulateSelectList();
        }

        public void PopulateSelectList()
        {
            //var negativeList = _db.Customer_Modules.Where(m => m.CmId == UId).Select(m => m.Module).ToList();

            var moduleList = _db.Modules.ToList();
            var moduleSelectList =
                moduleList.Select(m => new SelectListItem
                                           {
                                               Text = m.Name,
                                               Value =
                                                   m.ModId.
                                                   ToString(
                                                       CultureInfo
                                                           .
                                                           InvariantCulture),
                                               Selected = false
                                           }).ToList();
            Modules = new SelectList(moduleSelectList, "Value", "Text", 0);
        }
    }
}