using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcommGroceryStore.ViewModels
{
    public class vmCartDetailSummary
    {
        public int TotalItems { get; set; }
        public decimal TotalAmount { get; set; }
    }

    public class vmCartDetail
    {
        public int CartDetailId { get; set; }
        public Nullable<int> CartId { get; set; }        
        public Nullable<int> ProductId { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public Nullable<decimal> Discount { get; set; }
        public Nullable<decimal> NetAmount { get; set; }
        public System.DateTime Timestamp { get; set; }
        public bool IsActive { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<int> PricePerUnit { get; set; }
        public string Unit { get; set; } 
        public vmProductDetails productDetail { get; set; }
    }

    public class vmCartDetailsAll {
        public List<vmCartDetail> objvmCartDetails { get; set; }
        public vmCartDetailSummary objvmCartDetailSummary { get; set; } 
    }
}