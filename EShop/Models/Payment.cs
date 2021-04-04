using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EShop.Models
{
    public class Payment
    {
        [Required]
        public string ShipName { set; get; }
        [Required]
        public string Mobile { set; get; }
        [Required]
        public string Address { set; get; }
        [Required]
        public string Email { set; get; }
    }
}