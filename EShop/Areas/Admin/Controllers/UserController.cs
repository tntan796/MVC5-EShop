using Common;
using EShop.Commons;
using Model.Commons;
using Model.Dao;
using Model.EF;
using PagedList;
using System;
using System.Linq;
using System.Web.Mvc;

namespace EShop.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {
        readonly EShopDbContext dbContext = null;
        readonly UserDao userDao = null;
        public UserController()
        {
            dbContext = new EShopDbContext();
            userDao = new UserDao();
        }
        // GET: Admin/User
        public ActionResult Index(string keyword = "", int page = 1, int pageSize = 5)
        {
            IPagedList<User> users = userDao.GetUsersPaging(keyword, page, pageSize);
            return View(users);
        }

        public ActionResult Create()
        {
            return View(new User());
        }

        [HttpPost]
        public ActionResult Create(User user)
        {
            if (!ModelState.IsValid)
            {
                return View(user);
            }
            user.Password = Security.MD5Hash(user.Password);
            user.CreatedDate = DateTime.Now;
            user.CreatedBy = (Session[Constants.USER_SESSION] as UserLogin).UserID.ToString();
            long id = userDao.Insert(user);
            if (id > 0)
            {
                return RedirectToAction("Index", "User");
            }
            else
            {
                ModelState.AddModelError("", "Thêm mới tài khoản thất bại");
            }
            return View("Index");
        }

        public ActionResult Details(long id)
        {
            User user = dbContext.Users.SingleOrDefault(t => t.ID == id);
            if (user == null)
            {
                return null;
            }
            return View(user);
        }

        public ActionResult Delete(long id)
        {

            if (userDao.Delete(id))
            {
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToRoute("error");
            }
        }

        public ActionResult Edit(long id)
        {
            User user = userDao.GetById(id);
            if (user == null)
            {
                return RedirectToAction("Index", "Error");
            }
            return View(user);
        }

        [HttpPost]
        public ActionResult Edit(User user)
        {
            if (!ModelState.IsValid)
            {
                return View(user);
            }
            user.ModifiedBy = (Session[Constants.USER_SESSION] as UserLogin).UserID.ToString();
            string result = userDao.Update(user);
            if (result == COMMON_CONSTANTS.EDIT_SUCCESS)
            {
                return View(user);
            }
            else
            {
                return RedirectToAction("Index", "Error");
            }
        }
        public JsonResult ChangeStatusAjax(long id)
        {
            string result = userDao.ChangeStatusAjax(id);
            if (result == COMMON_CONSTANTS.NOT_EXISTS)
            {
                return Json(new ResponseFormat() { Status = 404, Message = "User not exists" }, JsonRequestBehavior.AllowGet);
            }
            if (result == COMMON_CONSTANTS.EDIT_FAIL)
            {
                return Json(new ResponseFormat() { Status = 500, Message = "Change status fail" }, JsonRequestBehavior.AllowGet);
            }
            return Json(new ResponseFormat() { Status = 200}, JsonRequestBehavior.AllowGet);
        }
    }
}