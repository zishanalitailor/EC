using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Unique.EcommGroceryStore.Core.Repository;

namespace EcommGroceryStore
{
    public partial class MasterSabji : MasterPage
    {  
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            UserRepository.Logout();
        } 

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(HttpContext.Current.User.Identity.Name))
            //if (HttpContext.Current.User.Identity.Name != null && HttpContext.Current.User.Identity.Name != "")
            {
                Response.Redirect("~/Checkout");
            }
            else {

                Response.Redirect("~/Account/Login");
            }
        } 
    }
     
}