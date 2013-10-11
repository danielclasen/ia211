using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using VersionR.Models;
using Version = VersionR.Models.Version;

namespace VersionR.DAL
{
    public class ManualRepository : GenericRepository<Manual>
    {
        public ManualRepository(VersionRContext context)
            : base(context)
        {
        }

        public IEnumerable<Manual> getByVersion(object version)
        {
            return Get(q => q.Version == version);
        }
    }

    public class UserRepository : GenericRepository<User>
    {
        private Repositories repos;

        public UserRepository(VersionRContext context, Repositories repos)
            : base(context)
        {
            this.repos = repos;
        }

        public Role getUserRole(object userID)
        {
            return repos.RoleRepoistory.GetByID(this.GetByID(userID).RId);
        }

        public bool UserHasModule(object userID, int moduleID)
        {
            return this.GetByID(userID).Customer_Modules.Any(c => c.ModId == moduleID);
        }
    }

    public class VersionRepository : GenericRepository<Version>
    {
        private Repositories repos;

        public VersionRepository(VersionRContext context, Repositories repos)
            : base(context)
        {
            this.repos = repos;
        }

        public void Delete(Version versionToDelete, string deletePath)
        {
            //            var deletePath = Path.Combine(HttpContext.Server.MapPath("~/"), versionToDelete.Filename);

            //new FileInfo(deletePath).Delete();

            this.repos.DownloadRepoistory.Delete(versionToDelete.Downloads);

            base.Delete(versionToDelete);
        }
    }
}