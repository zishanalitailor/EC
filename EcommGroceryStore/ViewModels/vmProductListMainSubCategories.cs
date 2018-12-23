using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace EcommGroceryStore.ViewModels
{
    public class vmProductListMainSubCategories
    {
       // public List<ProductDetails> prd { get; set; }
        public List<MainCategoryMaster> listMain { get; set; }
        public List<SubCategoryMaster> listSub { get; set; }
    }
}