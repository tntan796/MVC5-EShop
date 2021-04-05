using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EShop.Controllers
{
    public class ContactController : Controller
    {
        private FeedbackDao feedbackDao = null;
        public ContactController()
        {
            feedbackDao = new FeedbackDao();
        }
        // GET: Contact
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult FeedBack(Feedback fb)
        {
            if (!ModelState.IsValid)
            {
                return View(fb);
            }
            feedbackDao.Insert(fb);
            return View();
        }
    }
}