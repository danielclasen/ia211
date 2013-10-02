namespace VersionR.Helpers.BootstrapMvcHelpers.Strategies
{
    internal class ImportantStatusStrategy : IStatusStrategy
    {
        public string GetClassForStatus(string type)
        {
            return string.Format("{0} {0}-important", type);
        }
    }
}