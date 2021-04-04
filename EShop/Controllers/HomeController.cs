using EShop.Commons;
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
    public class HomeController : Controller
    {
        private MenuDao menuDao = null;
        private ProductDao productDao = null;
        public HomeController()
        {
            menuDao = new MenuDao();
            productDao = new ProductDao();
        }
        public ActionResult Index()
        {
            ViewBag.NewProducts = productDao.ListNewProduct(3);
            ViewBag.FeatureProducts = productDao.ListFeatureProduct(3);
            return View();
        }

        [ChildActionOnly]
        public ActionResult HeaderTop()
        {
            var carts = Session[Constants.CART_SESSION];
            List<CartItem> cartList = new List<CartItem>();
            if (carts != null)
            {
                cartList = (List<CartItem>)carts;
            }
            return PartialView(cartList);
        }
    }
}