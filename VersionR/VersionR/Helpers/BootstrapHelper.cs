using System;
using System.Linq.Expressions;
using System.Web.Mvc;
using System.Web.Routing;

namespace VersionR.Helpers
{
    public static class BootstrapExtensions
    {
        public static MvcHtmlString BootstrapLabelFor<TModel, TValue>(this HtmlHelper<TModel> html,
                                                                      Expression<Func<TModel, TValue>> expression,
                                                                      string labelText, object htmlAttributes)
            where TModel : class
        {
            var builder = new TagBuilder("label");
            builder.MergeAttributes(new RouteValueDictionary(htmlAttributes));
            // to convert an object into an IDictionary
            var value = ExpressionHelper.GetExpressionText(expression);
            builder.InnerHtml = labelText;
            //the replaces shouldnt be necessary in the next statement, but there is a bug in the MVC framework that makes them necessary.
            builder.Attributes.Add("for",
                                   html.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldId(value).Replace('[', '_').
                                       Replace(']', '_'));
            return MvcHtmlString.Create(builder.ToString(TagRenderMode.Normal));
        }

        public static MvcHtmlString BootstrapLabelFor<TModel, TValue>(this HtmlHelper<TModel> html,
                                                                      Expression<Func<TModel, TValue>> expression,
                                                                      string labelText) where TModel : class
        {
            var builder = new TagBuilder("label");
            builder.Attributes.Add("class", "control-label");
            var value = ExpressionHelper.GetExpressionText(expression);
            builder.InnerHtml = labelText;
            //the replaces shouldnt be necessary in the next statement, but there is a bug in the MVC framework that makes them necessary.
            builder.Attributes.Add("for",
                                   html.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldId(value).Replace('[', '_').
                                       Replace(']', '_'));
            return MvcHtmlString.Create(builder.ToString(TagRenderMode.Normal));
        }
    }
}