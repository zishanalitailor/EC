using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcommGroceryStore.ViewModels
{
    public class vmProductDetailsSummary
    {
        public int TotalRecords { get; set; }
        public int MinimumPrice { get; set; }
        public int MaximumPrice { get; set; }         
    }
}