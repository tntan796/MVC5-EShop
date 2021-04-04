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
    public class CartController : Controller
    {
        private ProductDao productDao = null;
        private OrderDao orderDao = null;
        private OrderDetailDao orderDetailDao = null;
        public CartController()
        {
            productDao = new ProductDao();
            orderDao = new OrderDao();
            orderDetailDao = new OrderDetailDao();
        }

        // GET: Cart
        public ActionResult Index()
        {
            var carts = Session[Constants.CART_SESSION];
            var list = new List<CartItem>();
            if (carts != null)
            {
                list = (List<CartItem>)carts;
            }
            return View(list);
        }

        public ActionResult AddItem(long productId, int quantity)
        {
            var carts = Session[Constants.CART_SESSION];
            Product product = productDao.GetByID(productId);
            if (carts != null)
            {
                var list = (List<CartItem>)carts;
                if (list.Exists(t => t.Product.ID == productId))
                {
                    foreach (CartItem cart in list)
                    {
                        if (cart.Product.ID == productId)
                        {
                            cart.Quantity += quantity;
                        }
                    }
                }
                else
                {
                    var item = new CartItem();
                    item.Product = product;
                    item.Quantity = quantity;
                    list.Add(item);
                }
                Session[Constants.CART_SESSION] = list;
            }
            else
            {
                var item = new CartItem();
                item.Product = product;
                item.Quantity = quantity;
                var cartList = new List<CartItem>();
                cartList.Add(item);
                Session[Constants.CART_SESSION] = cartList;
            }
            return RedirectToAction("Index");
        }

        public ActionResult UpdateCart(List<CartItem> carts)
        {
            var cartsSession = (List<CartItem>)Session[Constants.CART_SESSION];
            foreach (CartItem cart in carts)
            {
                var cartUpdate = cartsSession.SingleOrDefault(t => t.Product.ID == cart.Product.ID);
                if (cartUpdate != null)
                {
                    cartUpdate.Quantity = cart.Quantity;
                }
            }
            Session[Constants.CART_SESSION] = cartsSession;
            return Json(
                new
                {
                    status = true
                }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteAllCart()
        {
            Session[Constants.CART_SESSION] = null;
            return Json(
                new
                {
                    status = true
                }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult RemoveCartItem(long productID)
        {
            List<CartItem> cartsSession = (List<CartItem>)Session[Constants.CART_SESSION];
            cartsSession.RemoveAll(t => t.Product.ID == productID);
            Session[Constants.CART_SESSION] = cartsSession;
            return Json(
                new
                {
                    status = true
                }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Payment()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Payment(Payment payment)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View(payment);
                }
                Order order = new Order();
                order.ShipName = payment.ShipName;
                order.ShipMobile = payment.Mobile;
                order.ShipEmail = payment.Email;
                order.ShipAddress = payment.Address;
                long orderId = orderDao.Insert(order);
                List<CartItem> carts = (List<CartItem>)Session[Constants.CART_SESSION];
                foreach (CartItem cart in carts)
                {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.OrderID = orderId;
                    orderDetail.ProductID = cart.Product.ID;
                    orderDetail.Price = cart.Product.Price;
                    orderDetail.Quantity = cart.Quantity;
                    orderDetailDao.Insert(orderDetail);
                }
                return RedirectToAction("PaymentSuccess");
            }
            catch (Exception ex)
            {
                return RedirectToAction("Index", "Error");
            }
        }

        public ActionResult PaymentSuccess()
        {
            return View();
        }
    }
}