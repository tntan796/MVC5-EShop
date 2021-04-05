using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class FeedbackDao
    {
        private EShopDbContext dbContext = null;
        public FeedbackDao()
        {
            if (dbContext == null)
            {
                dbContext = new EShopDbContext();
            }
        }

        public int Insert(Feedback fb)
        {
            dbContext.Feedbacks.Add(fb);
            dbContext.SaveChanges();
            return fb.ID;
        }
    }
}
