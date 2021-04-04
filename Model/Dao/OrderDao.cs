using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class OrderDao
    {
        private EShopDbContext dbContext = null;
        public OrderDao()
        {
            dbContext = new EShopDbContext();
        }

        public long Insert(Order order)
        {
            try
            {
                dbContext.Orders.Add(order);
                dbContext.SaveChanges();
                return order.ID;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
          
        }
    }
}
