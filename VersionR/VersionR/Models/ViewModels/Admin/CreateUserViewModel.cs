using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;

namespace VersionR.Models.ViewModels.Admin
{
    public class CreateUserViewModel
    {
        private readonly VersionR _db = new VersionR();

        public CreateUserViewModel()
        {
            User = new User();
            var roleList = _db.Roles.ToList();
            var roleSelectList = roleList.Select(role => new SelectListItem
                                                             {
                                                                 Text = role.Name,
                                                                 Value = role.RId.ToString(CultureInfo.InvariantCulture),
                                                                 Selected = false
                                                             }).ToList();
            Roles = new SelectList(roleSelectList, "Value", "Text", 0);
        }

        public User User { get; private set; }

        public IEnumerable<SelectListItem> Roles { get; private set; }
    }
}