using CaptchaMvc.HtmlHelpers;
using Common;
using EShop.Commons;
using EShop.Models;
using Facebook;
using Model.Commons;
using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EShop.Controllers
{
    public class UserController : Controller
    {
        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
                return uriBuilder.Uri;
            }
        }
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

        public ActionResult LoginFacebook()
        {
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(
                new
                {
                    client_id = ConfigurationManager.AppSettings["AppId"],
                    client_secret = ConfigurationManager.AppSettings["FbAppId"],
                    redirect_uri = RedirectUri.AbsoluteUri,
                    response_type = "code",
                    scope = "email"
                });
            return Redirect(loginUrl.AbsoluteUri);
        }

        public ActionResult FacebookCallback(string code)
        {
            var fb = new FacebookClient();
            dynamic result = fb.Post("oauth/access_token",
                new
                {
                    client_id = ConfigurationManager.AppSettings["AppId"],
                    client_secret = ConfigurationManager.AppSettings["FbAppId"],
                    redirect_uri = RedirectUri.AbsoluteUri,
                    code = code
                });
            var accessToken = result.access_token;
            if (!string.IsNullOrEmpty(accessToken))
            {
                fb.AccessToken = accessToken;
                // Get he user's information like email, first name, middle name,...
                dynamic me = fb.Get("me?fields=first_name, middle_name, last_name, id, email");
                if (userDao.CheckUserName(me.id) == false) {
                    string email = me.id;
                    string username = me.id;
                    string firstname = me.first_name;
                    string middlename = me.middle_name;
                    string lastname = me.last_name;
                    User user = new User()
                    {
                        UserName = username,
                        Email = email,
                        Status = true,
                        Name = firstname + " " + middlename + " " + lastname
                    };
                    long resultInsert = userDao.Insert(user);
                    if (resultInsert > 0)
                    {
                        var userSession = new UserLogin();
                        userSession.UserID = user.ID;
                        userSession.UserName = user.UserName;
                        Session.Add(Constants.USER_SESSION, userSession);
                    }
                    return RedirectToAction("Index", "Home");
                }
            } else
            {

            }
            return RedirectToAction("Index", "Home");
        }
    }
}