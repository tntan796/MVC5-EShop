using CaptchaMvc.HtmlHelpers;
using Common;
using EShop.Commons;
using EShop.Models;
using Model.Commons;
using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EShop.Controllers
{
    public class UserController : Controller
    {
        readonly UserDao userDao = null;
        public UserController()
        {
            if (userDao == null)
            {
                userDao = new UserDao();
            }
        }
        // GET: User
        public ActionResult Register()
        {
            return View(new RegisterModel());
        }
        [HttpPost]
        public ActionResult Register(RegisterModel register)
        {
            if (!ModelState.IsValid)
            {
                return View(register);
            }
            if (!this.IsCaptchaValid(""))
            {
                ViewBag.error = "Sai Captcha";
                return View(register);
            }
            if (userDao.CheckUserName(register.UserName))
            {
                ViewBag.ExistUserName = "Tài khoản đã tồn tại";
                return View(register);
            }
            if (userDao.CheckEmail(register.Email))
            {
                ViewBag.ExistEmail = "Email đã tồn tại";
                return View(register);
            }
            User user = new User()
            {
                UserName = register.UserName,
                Address = register.Address,
                Email = register.Email,
                CreatedBy = "",
                CreatedDate = DateTime.Now,
                Password = Security.MD5Hash(register.Password),
                Name = register.Name,
                Phone = register.Phone,
                Status = false
            };
            if (userDao.Insert(user) > 0)
            {
                ViewBag.SuccessMessage = "Đăng ký thành công";
            } else
            {
                ViewBag.SuccessMessage = "Đăng ký thất bại";
            }
            return View(register);
        }

        public ActionResult Logout()
        {
            Session[Constants.USER_SESSION] = null;
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Login()
        {
            return View(new LoginModel());
        }

        [HttpPost]
        public ActionResult Login(LoginModel loginModel)
        {
            if (!ModelState.IsValid)
            {
                return View(loginModel);
            }
            var loginStatus = userDao.Login(loginModel.UserName, loginModel.Password);
            if (loginStatus == COMMON_CONSTANTS.USER_ACTIVE) {
                var user = userDao.GetByUserName(loginModel.UserName);
                UserLogin userLogin = new UserLogin();
                userLogin.UserName = user.UserName;
                userLogin.UserID = user.ID;
                Session.Add(Constants.USER_SESSION, userLogin);
                return RedirectToAction("Index", "Home");
            } else if (loginStatus == COMMON_CONSTANTS.USER_INACTIVE)
            {
                ViewBag.LoginStatus = "Tài khoản bị khóa";
            } else
            {
                ViewBag.LoginStatus = "Sai tài khoản hoặc mật khẩu";
            }
            return View(loginModel);
        }
    }
}