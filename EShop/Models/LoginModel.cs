using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EShop.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Vui lòng nhập Tên đăng nhập")]
        public string UserName { set; get; }

        [Required(ErrorMessage = "Vui lòng nhập Mật khẩu")]
        public string Password { set; get; }

        public bool Remember { set; get; }
    }
}