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
    public class SlideDao
    {
        private EShopDbContext dbContext = null;
        public SlideDao()
        {
            if (dbContext == null)
            {
                dbContext = new EShopDbContext();
            }
        }

        public IPagedList<Slide> GetSlidesPaging(string keyword, int pageNumber, int pageSize)
        {
            IOrderedQueryable<Slide> query = dbContext.Slides;
            if (!string.IsNullOrEmpty(keyword))
            {
                query = query.Where(t => t.Link.Contains(keyword))
                             .OrderBy(t => t.CreatedDate);
            }
            else
            {
                query = query.OrderBy(t => t.CreatedDate);
            }
            return query.ToPagedList(pageNumber, pageSize);
        }

        public IEnumerable<Slide> GetAll()
        {
            return dbContext.Slides.ToList();
        }

        public ProductCategory GetByID(long id)
        {
            return dbContext.ProductCategories.SingleOrDefault(t => t.ID == id);
        }

        public string Delete(long id)
        {
            Slide slide = dbContext.Slides.SingleOrDefault(t => t.ID == id);
            if (slide == null)
            {
                return COMMON_CONSTANTS.NOT_EXISTS;
            }
            dbContext.Slides.Remove(slide);
            int result = dbContext.SaveChanges();
            if (result > 0)
            {
                return COMMON_CONSTANTS.DELETE_SUCCESS;
            }
            return COMMON_CONSTANTS.DELETE_FAIL;
        }

        public string Add(Slide slide)
        {
            dbContext.Slides.Add(slide);
            int result = dbContext.SaveChanges();
            if (result > 0)
            {
                return COMMON_CONSTANTS.ADD_SUCCESS;
            }
            return COMMON_CONSTANTS.ADD_FAIL;
        }

        public string Edit(Slide slide)
        {
            Slide slideUpdate= dbContext.Slides.SingleOrDefault(t => t.ID == slide.ID);
            if (slideUpdate == null)
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