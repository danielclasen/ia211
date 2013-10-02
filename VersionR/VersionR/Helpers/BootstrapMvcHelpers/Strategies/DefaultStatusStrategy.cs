namespace VersionR.Helpers.BootstrapMvcHelpers.Strategies
{
    internal class DefaultStatusStrategy : IStatusStrategy
    {
        public string GetClassForStatus(string type)
        {
            return type;
        }
    }
}