namespace VersionR.Helpers.BootstrapMvcHelpers.Strategies
{
    internal class InverseStatusStragety : IStatusStrategy
    {
        public string GetClassForStatus(string type)
        {
            return string.Format("{0} {0}-inverse", type);
        }
    }
}