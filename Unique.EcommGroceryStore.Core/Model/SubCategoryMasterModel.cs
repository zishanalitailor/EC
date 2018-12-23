using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Unique.EcommGroceryStore.Core.Model
{
    public class SubCategoryMasterModel
    {
        public int SubCategoryId { get; set; }
        public int MainCategoryId { get; set; }
        public string MainCategoryName { get; set; }
        public string SubCategoryName { get; set; }
    }
}
