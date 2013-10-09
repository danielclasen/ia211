using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace VersionR.DAL
{
    public class VersionRContext : DbContext
    {
        public VersionRContext(VersionR.Models.VersionR objectContext)
            : base(objectContext, false)
        {

        }
    }
}