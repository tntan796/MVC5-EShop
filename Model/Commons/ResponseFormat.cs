using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Commons
{
    public class ResponseFormat
    {
        [DefaultValue(0)]
        public int Status { set; get; }
        [DefaultValue("")]
        public string Message { set; get; }
        [DefaultValue(null)]
        public object Data { set; get; }
    }
}
