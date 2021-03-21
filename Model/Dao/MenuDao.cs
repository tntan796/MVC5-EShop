using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class MenuDao
    {
        EShopDbContext dbContext = null;
        public MenuDao()
        {
            if (dbContext == null)
            {
                dbContext = new EShopDbContext();
            }
        }

        public IEnumerable<Menu> GetAll()
        {
            return dbContext.Menus.ToList();
        }

        public IEnumerable<Menu> GetByTypeId(int typeId)
        {
            try
            {
                return dbContext.Menus.Where(t => t.TypeID == typeId).ToList();

            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}
