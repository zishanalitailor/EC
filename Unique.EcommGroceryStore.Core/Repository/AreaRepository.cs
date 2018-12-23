using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Unique.EcommGroceryStore.Core.Interfaces;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace Unique.EcommGroceryStore.Core.Repository
{
    public class AreaRepository : IDisposable, ICustomInterface<AreaMaster>
    {
        #region
        private EcommGroceryDataContext dataContext = null;
        #endregion

        #region Constructor
        public AreaRepository()
        {
            dataContext = new EcommGroceryDataContext();
        }
        #endregion

        public AreaMaster Add(AreaMaster model)
        {
            throw new NotImplementedException();
        }

        public AreaMaster Delete(int id)
        {
            throw new NotImplementedException();
        }

        public AreaMaster Get(string value)
        {
            throw new NotImplementedException();
        }

        public AreaMaster Get(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<AreaMaster> GetList(int id)
        {
            return dataContext.AreaMaster;
        }

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
    }
}
