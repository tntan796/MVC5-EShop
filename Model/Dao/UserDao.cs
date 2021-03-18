using Model.Commons;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class UserDao
    {
        EShopDbContext db = null;

        public UserDao()
        {
            db = new EShopDbContext();
        }
        public long Insert(User user)
        {
            db.Users.Add(user);
            db.SaveChanges();
            return user.ID;
        }

        public int Login(string userName, string password)
        {
            User user = db.Users.SingleOrDefault(t => t.UserName == userName);
            if (user == null)
            {
                return (int)CommonConstants.LoginStatus.UserNameWrong;
            } else
            {
                if (user.Password == password)
                {
                    if (user.Status == false)
                    {
                        return (int)CommonConstants.LoginStatus.UserInActive;
                    } else
                    {
                        return (int)CommonConstants.LoginStatus.UserActive;
                    }
                } else
                {
                    return (int)CommonConstants.LoginStatus.PasswordWrong;
                }
            }
        }

        public User GetByUserName(string userName)
        {
            return db.Users.SingleOrDefault(t => t.UserName == userName);
        }
    }
}
