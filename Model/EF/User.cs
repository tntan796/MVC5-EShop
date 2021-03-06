namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        public long ID { get; set; }

        [StringLength(100)]
        public string UserName { get; set; }

        [StringLength(100)]
        public string Password { get; set; }

        [StringLength(100)]
        public string Name { get; set; }

        [StringLength(250)]
        public string Address { get; set; }
        [StringLength(250)]
        public string Email { get; set; }
        public string ProvinceID { set; get; }
        public string DistrictID { set; get; }

        [StringLength(20)]
        public string Phone { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(100)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(100)]
        public string ModifiedBy { get; set; }

        [StringLength(250)]
        public string MetaKeywords { get; set; }

        public bool? Status { get; set; }
    }
}
