using Model.EF;
using System;

namespace Model.Dao
{
    public class OrderDetailDao
    {
        private EShopDbContext dbContext = null;
        public OrderDetailDao()
        {
            dbContext = new EShopDbContext();
        }

        public bool Insert(OrderDetail orderDetail)
        {
            try
            {
                dbContext.OrderDetails.Add(orderDetail);
                dbContext.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
