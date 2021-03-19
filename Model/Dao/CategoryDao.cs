using Model.Commons;
using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class CategoryDao
    {
        EShopDbContext dbContext = null;
        public CategoryDao()
        {
            if (dbContext == null)
            {
                dbContext = new EShopDbContext();
            }
        }

        public List<Category> GetAll()
        {
            return dbContext.Categories.ToList();
        }

        public IPagedList<Category> GetPaging(string keyword, int pageNumber, int pageSize)
        {
            IOrderedQueryable<Category> query = dbContext.Categories;
            if (!String.IsNullOrEmpty(keyword))
            {
                query = query.Where(t => t.Name.Contains(keyword) || t.Status == true)
                             .OrderBy(t => t.CreatedDate);
            } else
            {
                query = query.OrderBy(t => t.CreatedDate);
            }
            return query.ToPagedList(pageNumber, pageSize);
        }

        public Category GetById(long id)
        {
            return dbContext.Categories.SingleOrDefault(t => t.ID == id);
        }

        public string Add(Category category)
        {
            int categoryCheck = dbContext.Categories.Count(t => t.Name == category.Name);
            if (categoryCheck > 0)
            {
                return COMMON_CONSTANTS.DUPPLICATE_NAME;
            }
            dbContext.Categories.Add(category);
            int save = dbContext.SaveChanges();
            if (save > 0)
            {
                return COMMON_CONSTANTS.ADD_SUCCESS;
            }
            else
            {
                return COMMON_CONSTANTS.ADD_FAIL;
            }
        }

        public string Delete(long id)
        {
            Category categoryDelete = dbContext.Categories.SingleOrDefault(t => t.ID == id);
            if (categoryDelete == null)
            {
                return COMMON_CONSTANTS.NOT_EXISTS;
            }
            dbContext.Categories.Remove(categoryDelete);
            int save = dbContext.SaveChanges();
            if (save > 0)
            {
                return COMMON_CONSTANTS.DELETE_SUCCESS;
            }
            else
            {
                return COMMON_CONSTANTS.DELETE_FAIL;
            }
        }

        public string Edit(Category category)
        {
            Category categoryEdit = dbContext.Categories.SingleOrDefault(t => t.ID == category.ID);
            if (categoryEdit == null)
            {
                return COMMON_CONSTANTS.NOT_EXISTS;
            }
            Category categoryCheckDupplicateName = dbContext.Categories.SingleOrDefault(t => t.ID == category.ID
                                                                                             && t.Name == category.Name);
            if (categoryCheckDupplicateName != null)
            {
                return COMMON_CONSTANTS.DUPPLICATE_NAME;
            }
            categoryEdit.Name = category.Name;
            categoryEdit.MetaKeywords = category.MetaKeywords;
            categoryEdit.MetaTitle = category.MetaTitle;
            categoryEdit.ModifiedBy = category.ModifiedBy;
            categoryEdit.ModifiedDate = category.ModifiedDate;
            categoryEdit.CreatedBy = category.CreatedBy;
            categoryEdit.CreatedDate = category.CreatedDate;
            categoryEdit.Status = category.Status;
            categoryEdit.ShowOnHome = category.ShowOnHome;
            categoryEdit.SeoTitle = category.SeoTitle;
            categoryEdit.DisplayOrder = category.DisplayOrder;
            int save = dbContext.SaveChanges();
            if (save > 0)
            {
                return COMMON_CONSTANTS.EDIT_SUCCESS;
            }
            else
            {
                return COMMON_CONSTANTS.EDIT_FAIL;
            }
        }
    }
}
