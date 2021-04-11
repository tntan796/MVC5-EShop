using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EShop.Controllers
{
    public class ProductController : Controller
    {
        private ProductDao productDao = null;
        private CategoryDao categoryDao = null;
        private ProductCategoryDao productCategoryDao = null;
        public ProductController()
        {
            productDao = new ProductDao();
            productCategoryDao = new ProductCategoryDao();
            categoryDao = new CategoryDao();
        }
        // GET: Product
        public ActionResult Index(long id, int page = 1, int pageSize = 1)
        {
            int totalRecord = 0;
            ViewBag.Category = productCategoryDao.GetByID(id);
            var products = productDao.GetProductByCategory(id, ref totalRecord, page, pageSize);
            int totalPage = (int)Math.Ceiling((double)totalRecord / pageSize);
            ViewBag.MaxPage = 5;
            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
            ViewBag.TotalPage = totalPage;
            ViewBag.First = 1;
            ViewBag.Next = page + 1;
            ViewBag.Last = totalPage;
            ViewBag.Prev = page - 1;

            return View(products);
        }
        [OutputCache(Duration = int.MaxValue, VaryByParam = "id")]

        public ActionResult Detail(int id)
        {
            var product = productDao.GetByID(id);
            ViewBag.RelatedProducts = productDao.GetRelatedProducts(id);
            ViewBag.Category = productCategoryDao.GetByID(product.CategoryID.Value);
            return View(product);
        }
    }
}