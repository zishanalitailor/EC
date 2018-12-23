using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcommGroceryStore.ViewModels
{
    public class vmProductDetailsWithSummary
    {
        public vmProductDetailsSummary vmProductDetailsSummary { get; set; }
        public IEnumerable<vmProductDetails> vmProductDetails { get; set; }
    }  
}