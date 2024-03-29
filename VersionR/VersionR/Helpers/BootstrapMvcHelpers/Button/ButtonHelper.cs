﻿using System.Web.Mvc;
using VersionR.Helpers.BootstrapMvcHelpers.Enums;
using VersionR.Helpers.BootstrapMvcHelpers.Interfaces;
using VersionR.Helpers.BootstrapMvcHelpers.Shared;
using VersionR.Helpers.BootstrapMvcHelpers.Strategies;

namespace VersionR.Helpers.BootstrapMvcHelpers.Button
{
    internal class ButtonHelper : IBootstrapComponent
    {
        private IStatusStrategy strategy;
        private object htmlAttributes;
        private string text;
        private ButtonStatus status;
        private string action;
        private string controller;
        private HtmlHelper helper;

        /// <summary>
        /// Initializes a new instance of the <see cref="ButtonHelper" /> class.
        /// </summary>
        /// <param name="strategy">The strategy.</param>
        /// <param name="text">The text.</param>
        /// <param name="status">The status.</param>
        /// <param name="htmlAttributes">The HTML attributes.</param>
        public ButtonHelper(HtmlHelper helper, IStatusStrategy strategy, string text, string action, string controller,
                            ButtonStatus status, object htmlAttributes)
        {
            this.strategy = strategy;
            this.text = text;
            this.status = status;
            this.htmlAttributes = htmlAttributes;
            this.helper = helper;
            this.action = action;
            this.controller = controller;
        }

        /// <summary>
        /// Renders this instance.
        /// </summary>
        /// <returns></returns>
        public string Render()
        {
            string cssClass = strategy.GetClassForStatus("btn");

            MenuItem item = new MenuItem(helper, text, action, controller, htmlAttributes, cssClass);
            return item.Render();
        }
    }
}