using SmartPay.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace SmartPay
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Create the custom role and user.
            RoleActions roleActions = new RoleActions();
            roleActions.AddUserAndRole();

            RegisterRoutes(RouteTable.Routes);
        }

        void RegisterRoutes(RouteCollection routes)
        {
            // Routing used to change the appearance of urls of the asp.net pages 
            routes.MapPageRoute("Home","SmartPay","~/Default.aspx");
            routes.MapPageRoute("About", "SmartPay/About", "~/About.aspx");
            routes.MapPageRoute("Contact", "SmartPay/ContactUs", "~/Contact.aspx");
        }
    }
}