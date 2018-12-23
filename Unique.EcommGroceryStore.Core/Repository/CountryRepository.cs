using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Unique.EcommGroceryStore.Core.Interfaces;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace Unique.EcommGroceryStore.Core.Repository
{
    public class CountryRepository : IDisposable, ICustomInterface<CountryMaster>
    {
        #region
        private EcommGroceryDataContext dataContext = null;
        #endregion

        #region Constructor
        public CountryRepository()
        {
            dataContext = new EcommGroceryDataContext();
        }
        #endregion

        public CountryMaster Add(CountryMaster model)
        {
            throw new NotImplementedException();
        }

        public CountryMaster Delete(int id)
        {
            throw new NotImplementedException();
        }

        public CountryMaster Get(string value)
        {
            throw new NotImplementedException();
        }

        public CountryMaster Get(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<CountryMaster> GetList(int id)
        {
            return dataContext.CountryMaster;
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
