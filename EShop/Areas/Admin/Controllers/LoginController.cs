using EShop.Commons;
using EShop.Models;
using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EShop.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginModel login)
        {
            if (!ModelState.IsValid)
            {
                return View(login);
            }
            UserDao userDao = new UserDao();
            bool checkLogin = userDao.Login(login.UserName, login.Password);
            if (checkLogin)
            {
                var user = userDao.GetByUserName(login.UserName);
                UserLogin userLogin = new UserLogin();
                userLogin.UserName = user.UserName;
                userLogin.UserID = user.ID;
                Session.Add(Contants.USER_SESSION, userLogin);
                return RedirectToAction("Index", "Home");
            } else
            {
                ModelState.AddModelError("", "Đăng nhập thất bại!");
            }
            return View();
        }
    }
}