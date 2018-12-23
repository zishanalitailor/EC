using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Unique.EcommGroceryStore.Core.Interfaces;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace Unique.EcommGroceryStore.Core.Repository
{
    public class AddressRepository : IDisposable, ICustomInterface<AddressDetails>
    {
        #region
        private EcommGroceryDataContext dataContext = null;
        #endregion

        #region Constructor
        public AddressRepository()
        {
            dataContext = new EcommGroceryDataContext();
        }
        #endregion

        public AddressDetails Delete(int id)
        {
            var address = Get(id);
            if (address != null)
            {
                dataContext.AddressDetails.Remove(address);
                Update();
            }
            return address;
        }

        public AddressDetails Add(AddressDetails model)
        {
            dataContext.AddressDetails.Add(model);
            Update();
            return model;
        }

        public AddressDetails Get(string value)
        {
            throw new NotImplementedException();
        }

        public AddressDetails Get(int id)
        {
            return dataContext.AddressDetails.Where(r => r.AddressId == id).FirstOrDefault();
        }

        public IEnumerable<AddressDetails> GetList(int id)
        {
            throw new NotImplementedException();
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

        public bool GetAddressAlreadyExistsOrNot(int userId, int type)
        {
            return dataContext.AddressDetails.Where(r => r.AddressTypeId == type && r.UserId == userId).Any();
        }

        public void MakeOtherfalse(int userId)
        {
            using (EcommGroceryDataContext db = new EcommGroceryDataContext())
            {
                var some = db.AddressDetails.Where(r => r.UserId == userId).ToList();
                some.ForEach(a => a.IsDefault = false);
                db.SaveChanges();
            }
        }
    }
}
