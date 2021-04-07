using Common;
using EShop.Commons;
using EShop.Models;
using Model.Commons;
using Model.Dao;
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
            string checkLogin = userDao.Login(login.UserName, login.Password);
            if (checkLogin == COMMON_CONSTANTS.USER_ACTIVE)
            {
                var user = userDao.GetByUserName(login.UserName);
                UserLogin userLogin = new UserLogin();
                userLogin.UserName = user.UserName;
                userLogin.UserID = user.ID;
                Session.Add(Constants.USER_SESSION, userLogin);
                return RedirectToAction("Index", "Home");
            } else
            {
                if (checkLogin == COMMON_CONSTANTS.LOGIN_USER_NAME_FAIL)
                {
                    ModelState.AddModelError("", "Sai tên tài khoản!");
                }
                else if (checkLogin == COMMON_CONSTANTS.LOGIN_PASSWORD_FAIL)
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