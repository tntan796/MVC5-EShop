using EShop.Commons;
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
        CategoryDao categoryDao = null;
        ContentDao contentDao = null;

        public ContentController()
        {
            contentDao = new ContentDao();
            categoryDao = new CategoryDao();
        }

        // GET: Admin/Content
        public ActionResult Index(string keyword = "", int pageNumber = 1, int pageSize = 5)
        {
            IPagedList<Content> contents = contentDao.GetContentsPaging(keyword, pageNumber, pageSize);
            return View(contents);
        }

        public ActionResult Create()
        {
            ViewBag.Categories = categoryDao.GetAll();
            return View(new Content());
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Content content)
        {
            ViewBag.Categories = categoryDao.GetAll();
            if (!ModelState.IsValid)
            {
                return View(content);
            }
            content.CreatedDate = DateTime.Now;
            content.CreatedBy = (Session[Constants.USER_SESSION] as UserLogin).UserID.ToString();
            string result = contentDao.Add(content);
            if (result == COMMON_CONSTANTS.ADD_SUCCESS)
            {
                return RedirectToAction("Index", "Content");
            }
            else
            {
                return RedirectToAction("Index", "Error");
            }
        }

        public ActionResult Edit(long id)
        {
            ViewBag.Categories = categoryDao.GetAll();
            Content content = contentDao.GetByID(id);
            var t = content.TopHot.HasValue ? content.TopHot.Value.ToString("yyyy-MM-dd") : null;
            if (content == null)
            {
                return RedirectToAction("Index", "Error");
            }
            return View(content);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Content content)
        {
            ViewBag.Categories = categoryDao.GetAll();
            if (!ModelState.IsValid)
            {
                return View(content);
            }
            content.ModifiedBy = (Session[Constants.USER_SESSION] as UserLogin).UserID.ToString();
            content.ModifiedDate = DateTime.Now;
            string result = contentDao.Edit(content);
            if (result == COMMON_CONSTANTS.EDIT_SUCCESS)
            {
                return RedirectToAction("Index", "Content");
            }
            else
            {
                return RedirectToAction("Index", "Error");
            }
        }

        public ActionResult Detail(long id)
        {
            ViewBag.Categories = categoryDao.GetAll();
            Content content = contentDao.GetByID(id);
            return View(content);
        }

        public ActionResult Delete(long id)
        {
            string result = contentDao.Delete(id);
            if (result == COMMON_CONSTANTS.DELETE_SUCCESS)
            {
                return RedirectToAction("Index", "Content");
            }
            else
            {
                return RedirectToAction("Index", "Error");
            }
        }
    }
}