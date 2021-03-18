using EShop.Commons;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace EShop.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            UserLogin session = Session[Contants.USER_SESSION] as UserLogin;
            if (session == null)
            {
                filterContext.Result = RedirectToRoute("Admin_login");
                //filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(
                //    new { controller = "Login", action = "Login", Area = "Admin" }));
            }
            base.OnActionExecuting(filterContext);
        }
    }
}