namespace VersionR.Helpers.BootstrapMvcHelpers.Strategies
{
    internal class PrimaryStatusStrategy : IStatusStrategy
    {
        public string GetClassForStatus(string type)
        {
            return string.Format("{0} {0}-primary", type);
        }
    }
}