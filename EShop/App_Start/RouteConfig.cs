using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace EShop
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
             name: "product-detail",
             url: "chi-tiet/{id}",
             defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional },
                 namespaces: new string[] { "EShop.Controllers" }
           );

            routes.MapRoute(
              name: "products",
              url: "san-pham/{metatitle}-{id}",
              defaults: new { controller = "Product", action = "Index", id = UrlParameter.Optional },
                  namespaces: new string[] { "EShop.Controllers" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                    namespaces: new string[] { "EShop.Controllers" }
            );
        }
    }
}
