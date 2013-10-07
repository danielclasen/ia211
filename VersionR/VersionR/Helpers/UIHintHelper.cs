using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Web.Routing;
using VersionR.Helpers.BootstrapMvcHelpers.Strategies;

namespace VersionR.Helpers
{
    public static class UiHintHelper
    {
        public static MvcHtmlString UiHint(this HtmlHelper htmlHelper, UiHint uiHint)
        {
            try
            {
                var div = new TagBuilder("div");
                div.MergeAttributes(new RouteValueDictionary(uiHint.htmlAttributes));
                div.AddCssClass("fade");
                div.AddCssClass("in");
                var titleString = string.Empty;
                if (!uiHint.title.Equals(string.Empty))
                {
                    var b = new TagBuilder("b") { InnerHtml = uiHint.title + " " };
                    titleString = b.ToString();
                }
                const string closeButton = "<button type='button' class='close' data-dismiss='alert'>×</button>";
                div.InnerHtml = closeButton + titleString + uiHint.text;
                return MvcHtmlString.Create(div.ToString());
            }
            catch (Exception)
            {
                return MvcHtmlString.Create(string.Empty);
            }
        }
    }

    public class UiHint
    {
        public string title { get; set; }

        public string text { get; set; }

        public object htmlAttributes { get; set; }

        public UiHint(string title, string text, object htmlAttributes)
        {
            this.title = title;
            this.text = text;
            this.htmlAttributes = htmlAttributes;
        }

        public UiHint(string text, object htmlAttributes)
            : this(string.Empty, text, htmlAttributes)
        {
        }
    }
}