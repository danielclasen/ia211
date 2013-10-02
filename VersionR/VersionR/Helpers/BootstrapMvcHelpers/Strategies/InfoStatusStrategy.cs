namespace VersionR.Helpers.BootstrapMvcHelpers.Strategies
{
    internal class InfoStatusStrategy : IStatusStrategy
    {
        public string GetClassForStatus(string type)
        {
            return string.Format("{0} {0}-info", type);
        }
    }
}