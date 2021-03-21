using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EShop.Controllers
{
    public class HomeController : Controller
    {
        MenuDao menuDao = null;
        public HomeController()
        {
            menuDao = new MenuDao();
        }
        public ActionResult Index()
        {
            return View();
        }

        // GET: Menu
        [ChildActionOnly]
        public ActionResult TopMenu()
        {
            IEnumerable<Menu> menus = menuDao.GetByTypeId(1);
            return View(menus);
        }
    }
}