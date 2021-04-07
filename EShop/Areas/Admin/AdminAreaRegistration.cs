using System.Web.Mvc;

namespace EShop.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Admin_login",
                "Admin/login",
                new { action = "Login", controller = "Login"}
            );
            context.MapRoute(
                 "admin-dang-nhap",
                 "admin/dang-nhap",
                 new { action = "Login", controller = "Login" }
            );
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}