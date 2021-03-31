using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EShop.Controllers
{
    public class SlideController : Controller
    {
        private SlideDao slideDao = null;
        public SlideController()
        {
            if (slideDao == null)
            {
                slideDao = new SlideDao();
            }
        }

        // GET: Slide
        public ActionResult Index()
        {
            var slides = slideDao.GetAll();
            return PartialView(slides);
        }
    }
}