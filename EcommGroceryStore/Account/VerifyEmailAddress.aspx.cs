using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace EcommGroceryStore.Account
{
    public partial class VerifyPhoneNumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string activationCode = !string.IsNullOrEmpty(Request.QueryString["ActivationCode"]) ? Request.QueryString["ActivationCode"] : Guid.Empty.ToString();
                using (EcommGroceryDataContext dataContext = new EcommGroceryDataContext())
                {
                    var users = (from c in dataContext.Users
                                 where c.ActivationCode == activationCode
                                 select c).FirstOrDefault();

                    if (users != null)
                    {
                        users.Status = true;
                        dataContext.SaveChanges();
                        Response.Redirect("Login.aspx?st=1");
                    }
                    else
                    {
                        Response.Redirect("Login.aspx?st=0");
                    }
                }
            }
        }

        protected void Code_Click(object sender, EventArgs e)
        {

        }
    }
}