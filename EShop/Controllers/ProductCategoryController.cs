using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EShop.Controllers
{
    public class ProductCategoryController : Controller
    {
        private ProductCategoryDao productCategoryDao = null;
        public ProductCategoryController()
        {
            productCategoryDao = new ProductCategoryDao();
        }
        // GET: ProductCategory
        public ActionResult Index()
        {
            var productCategories = productCategoryDao.GetAll();
            return View(productCategories);
        }
    }
}