namespace VersionR.Helpers.BootstrapMvcHelpers.Strategies
{
    internal class WarningStatusStrategy : IStatusStrategy
    {
        public string GetClassForStatus(string type)
        {
            return string.Format("{0} {0}-warning", type);
        }
    }
}