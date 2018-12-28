using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace EcommGroceryStore.ViewModels
{
    public class vmProductDetails
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string MainCategoryName { get; set; }
        public string SubCategoryName { get; set; }
        public int Quantity { get; set; }
        public string Description { get; set; }
        public string ImageURL { get; set; }
        public int PricePerUnit { get; set; }
        public string Unit { get; set; }
        public bool Status { get; set; } 
    }
}


 