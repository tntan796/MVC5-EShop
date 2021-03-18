using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Commons
{
    public static class CommonConstants
    {
        public enum LoginStatus
        {
            UserNameWrong = -1,
            UserInActive = 0,
            PasswordWrong = 1,
            UserActive = 2
        }
    }
}
