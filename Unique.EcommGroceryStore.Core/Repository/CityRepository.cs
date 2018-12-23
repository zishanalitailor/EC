using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Unique.EcommGroceryStore.Core.Interfaces;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace Unique.EcommGroceryStore.Core.Repository
{
    public class CityRepository : IDisposable, ICustomInterface<CityMaster>
    {
        #region
        private EcommGroceryDataContext dataContext = null;
        #endregion

        #region Constructor
        public CityRepository()
        {
            dataContext = new EcommGroceryDataContext();
        }
        #endregion

        public CityMaster Add(CityMaster model)
        {
            throw new NotImplementedException();
        }

        public CityMaster Delete(int id)
        {
            throw new NotImplementedException();
        }
 
        public CityMaster Get(string value)
        {
            throw new NotImplementedException();
        }

        public CityMaster Get(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<CityMaster> GetList(int id)
        {
            return dataContext.CityMaster;
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
