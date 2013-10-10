using System.Collections.Generic;
using System.Linq;
using System.Web;
using VersionR.Models;

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
}