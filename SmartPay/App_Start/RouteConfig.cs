using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace SmartPay
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);
            routes.MapPageRoute("", "Default", "~/Default.aspx");
            routes.MapPageRoute("","About","~/About.aspx");
            routes.MapPageRoute("","Contact","~/Contact.aspx");
            routes.MapPageRoute("","Register","~/Account/Register.aspx");
            routes.MapPageRoute("","Login","~/Account/Login.aspx");
        }
    }
}
