using System;
using System.Globalization;
using System.Linq.Expressions;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace VersionR.Helpers
{
    public static class DateBoxForHelper
    {
        public static MvcHtmlString DateBoxFor<TModel>(this HtmlHelper<TModel> helper,
                                                       Expression<Func<TModel, DateTime?>> property,
                                                       string name)
        {
            return helper.DateBoxFor(property, name, "d", null);
        }

        public static MvcHtmlString DateBoxFor<TModel>(this HtmlHelper<TModel> helper,
                                                       Expression<Func<TModel, DateTime?>> property,
                                                       string name,
                                                       object htmlAttributes)
        {
            return helper.DateBoxFor(property, name, "d", htmlAttributes);
        }

        public static MvcHtmlString DateBoxFor<TModel>(this HtmlHelper<TModel> helper,
                                                       Expression<Func<TModel, DateTime?>> property,
                                                       string name,
                                                       string format,
                                                       object htmlAttributes)
        {
            var viewData = helper.ViewContext.ViewData;
            var date = property.Compile().Invoke((TModel)viewData.Model);
            var value = date.HasValue
                            ? date.Value.ToString(format, CultureInfo.CreateSpecificCulture("de-DE"))
                            : string.Empty;
            //            var name = viewData.TemplateInfo.GetFullHtmlFieldName(ExpressionHelper.GetExpressionText(property));
            //            var name = ((MemberExpression)property.Body).Member.Name;

            return helper.TextBox(name, value, htmlAttributes);
        }
    }
}