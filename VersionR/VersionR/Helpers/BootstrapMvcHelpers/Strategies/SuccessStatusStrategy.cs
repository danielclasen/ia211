﻿namespace VersionR.Helpers.BootstrapMvcHelpers.Strategies
{
    internal class SuccessStatusStrategy : IStatusStrategy
    {
        public string GetClassForStatus(string type)
        {
            return string.Format("{0} {0}-success", type);
        }
    }
}