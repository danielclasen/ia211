namespace VersionR.Helpers.BootstrapMvcHelpers.Strategies
{
    internal interface IStatusStrategy
    {
        string GetClassForStatus(string type);
    }
}