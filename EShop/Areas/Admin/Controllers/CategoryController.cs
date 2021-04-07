using EShop.Commons;
using Model.Commons;
using Model.Dao;
using Model.EF;
using PagedList;
using System;
using System.Web.Mvc;

namespace EShop.Areas.Admin.Controllers
{
    public class CategoryController : BaseController
    {
        CategoryDao categoryDao = null;
        public CategoryController()
        {
            categoryDao = new CategoryDao();
        }
        // GET: Admin/Category
        public ActionResult Index(string keyword = "", int pageNumber = 1, int pageSize = 5)
        {
            IPagedList<Category> categories = categoryDao.GetPaging(keyword, pageNumber, pageSize);
            return View(categories);
        }

        public ActionResult Create() 
        {
            return View(new Category());
        }

        [HttpPost]
        public ActionResult Create(Category category)
        {
            if (!ModelState.IsValid)
            {
                return View(category);
            }
            category.CreatedDate = DateTime.Now;
            category.CreatedBy = (Session[Constants.USER_SESSION] as UserLogin).UserID.ToString();
            string addStatus = categoryDao.Add(category);
            if (addStatus == COMMON_CONSTANTS.ADD_FAIL)
            {
                return RedirectToAction("Index", "Error");
            }
            return RedirectToAction("Index");
        }

        public ActionResult Delete(long id)
        {
            string deleteStatus = categoryDao.Delete(id);
            if (deleteStatus == COMMON_CONSTANTS.DELETE_SUCCESS)
            {
                return RedirectToAction("Index", "Category");
            } else
            {
                return RedirectToAction("Index", "Error");
            }
        }

        public ActionResult Detail(long id)
        {
            Category category = categoryDao.GetById(id);
            if (category == null)
            {
                return RedirectToAction("Index", "Error");
            }
            return View(category);
        }

        public ActionResult Edit(long id)
        {
            Category category = categoryDao.GetById(id);
            if (category == null)
            {
                return RedirectToAction("Index", "Error");
            }
            return View(category);
        }

        [HttpPost]
        public ActionResult Edit(Category category)
        {
            if (!ModelState.IsValid)
            {
                return View(category);
            }
            string addStatus = categoryDao.Edit(category);
            category.ModifiedDate = DateTime.Now;
            category.ModifiedBy = (Session[Constants.USER_SESSION] as UserLogin).UserID.ToString();
            if (addStatus == COMMON_CONSTANTS.EDIT_FAIL)
            {
                return RedirectToAction("Index", "Error");
            }
            return View(category);
        }
    }
}