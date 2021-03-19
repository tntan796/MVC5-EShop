using EShop.Commons;
using EShop.Models;
using Model.Commons;
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
            CommonConstants.LoginStatus checkLogin = userDao.Login(login.UserName, Security.MD5Hash(login.Password));
            if (checkLogin == CommonConstants.LoginStatus.UserActive)
            {
                var user = userDao.GetByUserName(login.UserName);
                UserLogin userLogin = new UserLogin();
                userLogin.UserName = user.UserName;
                userLogin.UserID = user.ID;
                Session.Add(Contants.USER_SESSION, userLogin);
                return RedirectToAction("Index", "Home");
            } else
            {
                if (checkLogin == CommonConstants.LoginStatus.UserNameWrong)
                {
                    ModelState.AddModelError("", "Sai tên tài khoản!");
                }
                else if (checkLogin == CommonConstants.LoginStatus.PasswordWrong)
                {
                    ModelState.AddModelError("", "Sai mật khẩu!");
                }
                else
                {
                    ModelState.AddModelError("", "Tài khoản không hoạt động!");
                }
            }
            return View();
        }
    }
}