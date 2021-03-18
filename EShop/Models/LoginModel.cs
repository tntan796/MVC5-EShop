using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EShop.Models
{
    public class LoginModel
    {
        public string UserName { set; get; }
        public string Password { set; get; }
        public bool Remember { set; get; }
    }
}