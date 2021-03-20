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
    public class ContentDao
    {
        EShopDbContext dbContext = null;
        public ContentDao()
        {
            if (dbContext == null)
            {
                dbContext = new EShopDbContext();
            }
        }

        public IPagedList<Content> GetContentsPaging(string keyword, int pageNumber, int pageSize)
        {
            IOrderedQueryable<Content> query = dbContext.Contents;
            if (!string.IsNullOrEmpty(keyword))
            {
                query = query.Where(t => t.Name.Contains(keyword))
                             .OrderBy(t => t.CreatedDate);
            } else
            {
                query = query.OrderBy(t => t.CreatedDate);
            }
            return query.ToPagedList(pageNumber, pageSize);
        }

        public IEnumerable<Content> GetAll()
        {
            return dbContext.Contents.ToList();
        }

        public Content GetByID(long id)
        {
            return dbContext.Contents.SingleOrDefault(t => t.ID == id); 
        }

        public string Delete(long id)
        {
            Content content = dbContext.Contents.SingleOrDefault(t => t.ID == id);
            if (content == null)
            {
                return COMMON_CONSTANTS.NOT_EXISTS;
            }
            dbContext.Contents.Remove(content);
            int result = dbContext.SaveChanges();
            if (result > 0)
            {
                return COMMON_CONSTANTS.DELETE_SUCCESS;
            }
            return COMMON_CONSTANTS.DELETE_FAIL;
        }

        public string Add(Content content)
        {
            int checkExistsName = dbContext.Contents.Count(t => t.Name == content.Name);
            if (checkExistsName > 0)
            {
                return COMMON_CONSTANTS.DUPPLICATE_NAME;
            }
            dbContext.Contents.Add(content);
            int result = dbContext.SaveChanges();
            if (result > 0)
            {
                return COMMON_CONSTANTS.ADD_SUCCESS;
            }
            return COMMON_CONSTANTS.ADD_FAIL;
        }

        public string Edit(Content content)
        {
            Content contentUpdate = dbContext.Contents.SingleOrDefault(t => t.ID == content.ID);
            if (contentUpdate == null)
            {
                return COMMON_CONSTANTS.NOT_EXISTS;
            }
            contentUpdate.Name = content.Name;
            contentUpdate.CategoryID = content.CategoryID;
            contentUpdate.Description = content.Description;
            contentUpdate.Detail = content.Detail;
            contentUpdate.Image = content.Image;
            contentUpdate.MetaKeywords = content.MetaKeywords;
            contentUpdate.MetaTitle = content.MetaTitle;
            contentUpdate.ModifiedBy = content.ModifiedBy;
            contentUpdate.ModifiedDate = content.ModifiedDate;
            contentUpdate.Status = content.Status;
            contentUpdate.Tags = content.Tags;
            contentUpdate.TopHot = content.TopHot;
            contentUpdate.ViewCount = content.ViewCount;
            contentUpdate.Warranty = content.Warranty;
            int result = dbContext.SaveChanges();
            if (result > 0)
            {
                return COMMON_CONSTANTS.EDIT_SUCCESS;
            }
            return COMMON_CONSTANTS.EDIT_FAIL;
        }
    }
}

