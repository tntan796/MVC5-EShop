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
    public class UserController : BaseController
    {
        EShopDbContext dbContext = null;
        UserDao userDao = null;
        public UserController()
        {
            dbContext = new EShopDbContext();
            userDao = new UserDao();
        }
        // GET: Admin/User
        public ActionResult Index(int page = 1, int pageSize = 5)
        {
            IPagedList<User> users = userDao.GetUsersPaging(page, pageSize);
            return View(users);
        }

        public ActionResult Create()
        {
            return View();
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
            user.CreatedBy = (Session[Contants.USER_SESSION] as UserLogin).UserID.ToString();
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
            user.ModifiedBy = (Session[Contants.USER_SESSION] as UserLogin).UserID.ToString();
            CommonConstants.UserStatus result = userDao.Update(user);
            if (result == CommonConstants.UserStatus.UpdateSuccess)
            {
                return View(user);
            }
            else
            {
                return RedirectToAction("Index", "Error");
            }
        }
    }
}