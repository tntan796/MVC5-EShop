using EShop.Commons;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace EShop.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);
            if (Session[Constants.CURRENT_CULTURE] != null)
            {
                Thread.CurrentThread.CurrentCulture = new CultureInfo(Session[Constants.CURRENT_CULTURE].ToString());
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(Session[Constants.CURRENT_CULTURE].ToString());
            } else
            {
                Thread.CurrentThread.CurrentCulture = new CultureInfo("vi");
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("vi");
            }
        }

        public ActionResult ChangeCulture(string ddlCulture, string returnUrl)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo(ddlCulture);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(ddlCulture);
            Session[Constants.CURRENT_CULTURE] = ddlCulture;
            return Redirect(returnUrl);
        }

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            UserLogin session = Session[Constants.USER_SESSION] as UserLogin;
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