using Model.Commons;
using Model.EF;
using PagedList;
using System.Collections.Generic;
using System.Linq;

namespace Model.Dao
{
    public class ProductCategoryDao
    {
        private EShopDbContext dbContext = null;
        public ProductCategoryDao()
        {
            if(dbContext == null)
            {
                dbContext = new EShopDbContext();
            }
        }

        public IPagedList<ProductCategory> GetContentsPaging(string keyword, int pageNumber, int pageSize)
        {
            IOrderedQueryable<ProductCategory> query = dbContext.ProductCategories;
            if (!string.IsNullOrEmpty(keyword))
            {
                query = query.Where(t => t.Name.Contains(keyword))
                             .OrderBy(t => t.CreatedDate);
            }
            else
            {
                query = query.OrderBy(t => t.CreatedDate);
            }
            return query.ToPagedList(pageNumber, pageSize);
        }

        public IEnumerable<ProductCategory> GetAll()
        {
            return dbContext.ProductCategories.ToList();
        }

        public ProductCategory GetByID(long id)
        {
            return dbContext.ProductCategories.SingleOrDefault(t => t.ID == id);
        }

        public string Delete(long id)
        {
            ProductCategory productCategory = dbContext.ProductCategories.SingleOrDefault(t => t.ID == id);
            if (productCategory == null)
            {
                return COMMON_CONSTANTS.NOT_EXISTS;
            }
            dbContext.ProductCategories.Remove(productCategory);
            int result = dbContext.SaveChanges();
            if (result > 0)
            {
                return COMMON_CONSTANTS.DELETE_SUCCESS;
            }
            return COMMON_CONSTANTS.DELETE_FAIL;
        }

        public string Add(ProductCategory productCategory)
        {
            int checkExistsName = dbContext.ProductCategories.Count(t => t.Name == productCategory.Name);
            if (checkExistsName > 0)
            {
                return COMMON_CONSTANTS.DUPPLICATE_NAME;
            }
            dbContext.ProductCategories.Add(productCategory);
            int result = dbContext.SaveChanges();
            if (result > 0)
            {
                return COMMON_CONSTANTS.ADD_SUCCESS;
            }
            return COMMON_CONSTANTS.ADD_FAIL;
        }

        public string Edit(ProductCategory content)
        {
            ProductCategory productCategoryUpdate = dbContext.ProductCategories.SingleOrDefault(t => t.ID == content.ID);
            if (productCategoryUpdate == null)
            {
                return COMMON_CONSTANTS.NOT_EXISTS;
            }
            int result = dbContext.SaveChanges();
            if (result > 0)
            {
                return COMMON_CONSTANTS.EDIT_SUCCESS;
            }
            return COMMON_CONSTANTS.EDIT_FAIL;
        }
    }
}