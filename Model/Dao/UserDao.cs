using Model.Commons;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList.Mvc;
using PagedList;

namespace Model.Dao
{
    public class UserDao
    {
        EShopDbContext db = null;

        public UserDao()
        {
            db = new EShopDbContext();
        }

        public List<User> GetUsers()
        {
            return db.Users.ToList();
        }

        public IPagedList<User> GetUsersPaging(int pageNum, int pageSize)
        {
            return db.Users.OrderBy(t => t.CreatedDate).ToPagedList(pageNum, pageSize);
        }

        public long Insert(User user)
        {
            db.Users.Add(user);
            db.SaveChanges();
            return user.ID;
        }

        public bool Delete(long id)
        {
            try
            {
                User user = db.Users.SingleOrDefault(t => t.ID == id);
                db.Users.Remove(user);
                db.SaveChanges();
                return true;
            } catch(Exception ex)
            {
                return false;
            }
        }

        public CommonConstants.LoginStatus Login(string userName, string password)
        {
            User user = db.Users.SingleOrDefault(t => t.UserName == userName);
            if (user == null)
            {
                return CommonConstants.LoginStatus.UserNameWrong;
            } else
            {
                if (user.Password == password)
                {
                    if (user.Status == false)
                    {
                        return CommonConstants.LoginStatus.UserInActive;
                    } else
                    {
                        return CommonConstants.LoginStatus.UserActive;
                    }
                } else
                {
                    return CommonConstants.LoginStatus.PasswordWrong;
                }
            }
        }

        public User GetByUserName(string userName)
        {
            return db.Users.SingleOrDefault(t => t.UserName == userName);
        }

        public User GetById(long id)
        {
            return db.Users.SingleOrDefault(t => t.ID == id);
        }

        public CommonConstants.UserStatus Update(User user)
        {
            User userUpdate = db.Users.SingleOrDefault(t => t.ID == user.ID);
            int checkDuplicateUserName = db.Users.Count(t => t.UserName == user.UserName && t.ID != user.ID);
            if (userUpdate == null)
            {
                return CommonConstants.UserStatus.UpdateFail;
            }
            if (checkDuplicateUserName > 0)
            {
                return CommonConstants.UserStatus.DupplicateUserName;
            }
            userUpdate.UserName = user.UserName;
            userUpdate.Password = user.Password;
            userUpdate.Phone = user.Phone;
            userUpdate.Address = user.Address;
            userUpdate.Name = user.Name;
            userUpdate.Status = user.Status;
            userUpdate.MetaKeywords = user.MetaKeywords;
            userUpdate.ModifiedBy = user.ModifiedBy;
            userUpdate.ModifiedDate = DateTime.Now;
            userUpdate.CreatedDate = user.CreatedDate;
            userUpdate.CreatedBy = user.CreatedBy;
            db.SaveChanges();
            return CommonConstants.UserStatus.UpdateSuccess;
        }
    }
}
