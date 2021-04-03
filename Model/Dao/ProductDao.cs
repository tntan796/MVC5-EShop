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
    public class ProductDao
    {
        private EShopDbContext dbContext = null;
        public ProductDao()
        {
            if (dbContext == null)
            {
                dbContext = new EShopDbContext();
            }
        }

        public IPagedList<Product> GetProductsPaging(string keyword, int pageNumber, int pageSize)
        {
            IOrderedQueryable<Product> query = dbContext.Products;
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

        public List<Product> ListNewProduct(int top)
        {
            return dbContext.Products.OrderByDescending(t => t.CreatedDate).Take(top).ToList();
        }

        public List<Product> ListFeatureProduct(int top)
        {
            return dbContext.Products.Where(t => t.TopHot != null && t.TopHot > DateTime.Now)
                .OrderByDescending(t => t.CreatedDate).Take(top).ToList();
        }

        public IEnumerable<Product> GetAll()
        {
            return dbContext.Products.ToList();
        }

        public Product GetByID(long id)
        {
            return dbContext.Products.SingleOrDefault(t => t.ID == id);
        }

        public string Delete(long id)
        {
            Product product = dbContext.Products.SingleOrDefault(t => t.ID == id);
            if (product == null)
            {
                return COMMON_CONSTANTS.NOT_EXISTS;
            }
            dbContext.Products.Remove(product);
            int result = dbContext.SaveChanges();
            if (result > 0)
            {
                return COMMON_CONSTANTS.DELETE_SUCCESS;
            }
            return COMMON_CONSTANTS.DELETE_FAIL;
        }

        public string Add(Product product)
        {
            int checkExistsName = dbContext.Products.Count(t => t.Name == product.Name);
            if (checkExistsName > 0)
            {
                return COMMON_CONSTANTS.DUPPLICATE_NAME;
            }
            dbContext.Products.Add(product);
            int result = dbContext.SaveChanges();
            if (result > 0)
            {
                return COMMON_CONSTANTS.ADD_SUCCESS;
            }
            return COMMON_CONSTANTS.ADD_FAIL;
        }

        public string Edit(Product product)
        {
            Product productUpdate = dbContext.Products.SingleOrDefault(t => t.ID == product.ID);
            if (productUpdate == null)
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

        public List<Product> GetProductByCategory(long category, ref int totalRecord, int pageNumber = 1, int pageSize = 2)
        {
            totalRecord = dbContext.Products.Where(t => t.CategoryID == category).Count();
            return dbContext.Products.Where(t => t.CategoryID == category)
                                    .OrderBy(t => t.CreatedDate)
                                    .Skip(pageSize * (pageNumber - 1))
                                    .Take(pageSize)
                                    .ToList();
        }
        public List<Product> GetRelatedProducts(long id)
        {
            Product product = dbContext.Products.SingleOrDefault(t => t.ID == id);
            if (product == null)
            {
                return null;
            }
            return dbContext.Products
                .Where(t => t.CategoryID == product.CategoryID && t.ID != product.ID).Take(4).ToList();
        }
    }
}