using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EcommGroceryStore.Startup))]
namespace EcommGroceryStore
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
