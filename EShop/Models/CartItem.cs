using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EShop.Models
{
    [Serializable]
    public class CartItem
    {
        public Product Product{ set; get; }
        public int Quantity { set; get; }
    }
}