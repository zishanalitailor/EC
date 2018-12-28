using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcommGroceryStore.ViewModels
{
    public class vmSubCategoryDetails
    {
        public int SubCategoryId { get; set; }
        public int MainCategoryId { get; set; }
        public string Name { get; set; }
        public string ImageURL { get; set; }
    }
}