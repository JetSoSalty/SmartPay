using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SmartPay.Startup))]
namespace SmartPay
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
