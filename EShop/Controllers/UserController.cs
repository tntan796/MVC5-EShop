using CaptchaMvc.HtmlHelpers;
using EShop.Models;
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
        UserDao userDao = null;
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
                Password = register.Password,
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
    }
}