using System.Collections.Generic;
using System.Linq;
using System.Web;
using VersionR.Models;

namespace VersionR.DAL
{
    public class Repositories
    {
        private VersionRContext context = new VersionRContext(new VersionR.Models.VersionR());

        private GenericRepository<Customer_Modules> customerModulesRepoistory;
        private GenericRepository<Download> downloadRepoistory;
        private ManualRepository manualRepoistory;
        private GenericRepository<Module> moduleRepoistory;
        private GenericRepository<Role> roleRepoistory;
        private UserRepository userRepoistory;
        private GenericRepository<Version> versionRepoistory;

        private bool disposed = false;

        public GenericRepository<Download> DownloadRepoistory
        {
            get
            {
                if (downloadRepoistory == null)
                {
                    downloadRepoistory = new GenericRepository<Download>(context);
                }
                return downloadRepoistory;
            }
        }

        public ManualRepository ManualRepoistory
        {
            get
            {
                if (manualRepoistory == null)
                {
                    manualRepoistory = new ManualRepository(context);
                }
                return manualRepoistory;
            }
        }

        public GenericRepository<Module> ModuleRepoistory
        {
            get
            {
                if (moduleRepoistory == null)
                {
                    moduleRepoistory = new GenericRepository<Module>(context);
                }
                return moduleRepoistory;
            }
        }

        public GenericRepository<Role> RoleRepoistory
        {
            get
            {
                if (roleRepoistory == null)
                {
                    roleRepoistory = new GenericRepository<Role>(context);
                }
                return roleRepoistory;
            }
        }

        public UserRepository UserRepoistory
        {
            get
            {
                if (userRepoistory == null)
                {
                    userRepoistory = new UserRepository(context, this);
                }
                return userRepoistory;
            }
        }

        public GenericRepository<Version> VersionRepoistory
        {
            get
            {
                if (versionRepoistory == null)
                {
                    versionRepoistory = new GenericRepository<Version>(context);
                }
                return versionRepoistory;
            }
        }

        public GenericRepository<Customer_Modules> CustomerModulesRepoistory
        {
            get
            {
                if (customerModulesRepoistory == null)
                {
                    customerModulesRepoistory = new GenericRepository<Customer_Modules>(context);
                }
                return customerModulesRepoistory;
            }
        }

        public void Save()
        {
            context.SaveChanges();
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed && disposing)
            {
                context.Dispose();
            }
        }

        public void Dispose()
        {
            Dispose(true);
            System.GC.SuppressFinalize(this);
        }
    }
}