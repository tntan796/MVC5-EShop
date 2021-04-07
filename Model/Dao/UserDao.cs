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

        public IPagedList<User> GetUsersPaging(string keyword, int pageNum, int pageSize)
        {
            IOrderedQueryable<User> query = db.Users;
            if (!String.IsNullOrEmpty(keyword))
            {
                query = query.Where(t => t.UserName.Contains(keyword) || t.Name.Contains(keyword))
                    .OrderBy(t => t.CreatedDate);
            } else
            {
                query = query.OrderBy(t => t.CreatedDate);
            }
            return query.ToPagedList(pageNum, pageSize);
        }

        public long Insert(User user)
        {
            db.Users.Add(user);
            db.SaveChanges();
            return user.ID;
        }

        public bool CheckUserName(string userName)
        {
            var result = db.Users.Count(t => t.UserName == userName);
            return result > 0;
        }

        public bool CheckEmail(string email)
        {
            return db.Users.Count(t => t.Email == email) > 0;
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

        public string Login(string userName, string password)
        {
            User user = db.Users.SingleOrDefault(t => t.UserName == userName);
            if (user == null)
            {
                return COMMON_CONSTANTS.LOGIN_USER_NAME_FAIL;
            } else
            {
                if (user.Password == password)
                {
                    if (user.Status == false)
                    {
                        return COMMON_CONSTANTS.USER_INACTIVE;
                    } else
                    {
                        return COMMON_CONSTANTS.USER_ACTIVE;
                    }
                } else
                {
                    return COMMON_CONSTANTS.LOGIN_PASSWORD_FAIL;
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

        public string ChangeStatusAjax(long id)
        {
            User user = db.Users.SingleOrDefault(t => t.ID == id);
            if (user == null)
            {
                return COMMON_CONSTANTS.NOT_EXISTS;
            }
            if (user.Status != null)
            {
                user.Status = !user.Status;
            } else
            {
                user.Status = true;
            }
            int result = db.SaveChanges();
            if (result > 0)
                return COMMON_CONSTANTS.EDIT_SUCCESS;
            return COMMON_CONSTANTS.EDIT_FAIL;
        }

        public string Update(User user)
        {
            User userUpdate = db.Users.SingleOrDefault(t => t.ID == user.ID);
            int checkDuplicateUserName = db.Users.Count(t => t.UserName == user.UserName && t.ID != user.ID);
            if (userUpdate == null)
            {
                return COMMON_CONSTANTS.EDIT_FAIL;
            }
            if (checkDuplicateUserName > 0)
            {
                return COMMON_CONSTANTS.DUPPLICATE_USER_NAME;
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
            return COMMON_CONSTANTS.EDIT_SUCCESS;
        }
    }
}
