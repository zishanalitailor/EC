using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Unique.EcommGroceryStore.Core.Repository;

namespace EcommGroceryStore.Apps.Admin
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             
        }

        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            UserRepository.Logout();
        }
    }
}