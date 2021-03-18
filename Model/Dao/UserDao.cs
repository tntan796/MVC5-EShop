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

        public bool Login(string userName, string password)
        {
            var result = db.Users.Count(t => t.UserName == userName && t.Password == password);
            return (result > 0);
        }

        public User GetByUserName(string userName)
        {
            return db.Users.SingleOrDefault(t => t.UserName == userName);
        }
    }
}
