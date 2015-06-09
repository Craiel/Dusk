using System.Threading;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

using Dusk.Dawn.App_Start;
using Dusk.Dawn.Logic;

namespace Dusk.Dawn
{
    public class MvcApplication : System.Web.HttpApplication
    {
        private static SimpleMembershipInitializer membershipInitializer;
        private static object initializerLock = new object();
        private static bool isInitialized;

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Ensure ASP.NET Membership is initialized only once per app start
            LazyInitializer.EnsureInitialized(ref membershipInitializer, ref isInitialized, ref initializerLock);

            DawnLogic.ReloadCache();
        }
    }
}