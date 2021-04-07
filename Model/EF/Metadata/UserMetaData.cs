using System;
using System.ComponentModel.DataAnnotations;

namespace Model.EF.Metadata
{
    [MetadataType(typeof(UserMetaData))]
    public partial class User
    {
        // leave it empty.
    }

    public class UserMetaData
    {
        [Required(ErrorMessage = "Vui lòng nhập Tài khoản")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập Mật khẩu")]
        public string Password { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập  Email")]
        public string Email { get; set; }
    }
}
