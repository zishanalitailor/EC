using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Unique.EcommGroceryStore.Core.Interfaces;
using Unique.EcommGroceryStore.Core.Model;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace Unique.EcommGroceryStore.Core.Repository
{
    public class SubCategoryMasterRepository : IDisposable, ICustomInterface<SubCategoryMaster>
    {
        #region
        private EcommGroceryDataContext dataContext = null;
        #endregion

        #region Constructor
        public SubCategoryMasterRepository()
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

        public SubCategoryMaster Get(int id)
        {
            return dataContext.SubCategoryMaster.Where(r => r.SubCategoryId == id).FirstOrDefault();
        }

        public SubCategoryMaster Get(string value)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<SubCategoryMaster> GetList(int id)
        {
            return dataContext.SubCategoryMaster.Where(r => r.MainCategoryId == id);
        }

        public IEnumerable<SubCategoryMasterModel> GetList()
        {
            return (from sub in dataContext.SubCategoryMaster
                    select new SubCategoryMasterModel
                    {
                        MainCategoryId = sub.MainCategoryId,
                        MainCategoryName = sub.MainCategoryMaster.Name,
                        SubCategoryId = sub.SubCategoryId,
                        SubCategoryName = sub.Name
                    });
        }


        public SubCategoryMaster Delete(int id)
        {
            var obj = Get(id);
            if (obj != null)
            {
                dataContext.SubCategoryMaster.Remove(obj);
                Update();
            }
            return obj;
        }

        public SubCategoryMaster Add(SubCategoryMaster model)
        {
            dataContext.SubCategoryMaster.Add(model);
            Update();
            return model;
        }
    }
}
