using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Unique.EcommGroceryStore.Core.Interfaces;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace Unique.EcommGroceryStore.Core.Repository
{
    public class MasterCategoryRepository : IDisposable, ICustomInterface<MainCategoryMaster>
    {
        #region
        private EcommGroceryDataContext dataContext = null;
        #endregion

        #region Constructor
        public MasterCategoryRepository()
        {
            dataContext = new EcommGroceryDataContext();
        }
        #endregion

        public void Update()
        {
            dataContext.SaveChanges();
        }

        public void Dispose()
        {
            if (dataContext != null)
            {
                dataContext.Dispose();
                dataContext = null;
            }
        }

        public MainCategoryMaster Get(int id)
        {
            return dataContext.MainCategoryMaster.Where(r => r.MainCategoryId == id).FirstOrDefault();
        }

        public MainCategoryMaster Get(string value)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<MainCategoryMaster> GetList(int id)
        {
            return dataContext.MainCategoryMaster;
        }

        public MainCategoryMaster Delete(int id)
        {
            var obj = Get(id);
            if (obj != null)
            {
                dataContext.MainCategoryMaster.Remove(obj);
                Update();
            }
            return obj;
        }

        public MainCategoryMaster Add(MainCategoryMaster model)
        {
            dataContext.MainCategoryMaster.Add(model);
            Update();
            return model;
        }
    }
}
