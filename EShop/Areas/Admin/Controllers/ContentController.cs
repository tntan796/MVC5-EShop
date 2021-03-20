using Model.Commons;
using Model.Dao;
using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EShop.Areas.Admin.Controllers
{
    public class ContentController : BaseController
    {
        ContentDao contentDao = null;
        public ContentController()
        {
            contentDao = new ContentDao();
        }

        // GET: Admin/Content
        public ActionResult Index(string keyword = "", int pageNumber = 1, int pageSize = 5)
        {
            IPagedList<Content> contents = contentDao.GetContentsPaging(keyword, pageNumber, pageSize);
            return View(contents);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Content content)
        {
            if (!ModelState.IsValid)
            {
                return View(content);
            }
            string result = contentDao.Add(content);
            if (result == COMMON_CONSTANTS.ADD_SUCCESS)
            {
                return View("Index", "Content");
            }
            else
            {
                return RedirectToAction("Index", "Error");
            }
        }

        public ActionResult Edit(long id)
        {
            Content content = contentDao.GetByID(id);
            if (content == null)
            {
                return RedirectToAction("Index", "Error");
            }
            return View(content);
        }

        [HttpPost]
        public ActionResult Edit(Content content)
        {
            if(!ModelState.IsValid)
            {
                return View(content);
            }
            string result = contentDao.Edit(content);
            if (result == COMMON_CONSTANTS.EDIT_SUCCESS)
            {
                return View("Index", "Content");
            }
            else
            {
                return RedirectToAction("Index", "Error");
            }
        }

        public ActionResult Detail(long id)
        {
            Content content = contentDao.GetByID(id);
            return View(content);
        }

        public ActionResult Delete(long id)
        {
            string result = contentDao.Delete(id);
            if (result == COMMON_CONSTANTS.DELETE_SUCCESS)
            {
                return View("Index", "Content");
            }
            else
            {
                return RedirectToAction("Index", "Error");
            }
            return View();
        }
    }
}