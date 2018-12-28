using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using EcommGroceryStore.Models;
using Unique.EcommGroceryStore.Core.Provider;
using System.Web.Security;
using NotificationHelper;
using Unique.EcommGroceryStore.Core.Repository;
using Unique.EcommGroceryStore.Core.Model;

namespace EcommGroceryStore.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                    Response.Redirect("~/indexchild.aspx");

                string st = !string.IsNullOrEmpty(Request.QueryString["st"]) ? Request.QueryString["st"] : "0";
                if (st.Equals("0"))
                    this.ShowErrorNotification("Please contact your administrator. Your account is not active.");
                else
                    this.ShowSuccessfulNotification("Your account has been activated successfully. Please try to login now.");
            }
        }

        protected void LogIn_ServerClick(object sender, EventArgs e)
        {
            string ErrMsg = string.Empty;
            if (Validate(out ErrMsg))
            {
                if (Membership.ValidateUser(txtUserName.Value.Trim(), txtPassword.Value.Trim()))
                {
                    using (UserRepository userRepository = new UserRepository(txtUserName.Value.Trim()))
                    {
                        if (userRepository.User.IsAccountLocked)
                        { 
                            FormsAuthentication.RedirectFromLoginPage(txtUserName.Value.Trim(), true);
                            FormsAuthentication.SetAuthCookie(txtUserName.Value.Trim(), true);
                            string returnUrl = Request.QueryString["ReturnUrl"] ?? "~/indexchild.aspx";
                            Response.Redirect(returnUrl, false);
                        }
                        else
                        {
                            //user account is locked
                            this.ShowErrorNotification("Your account is locked. Please contact your account administration to unlock your account.");
                        }
                    }
                }
                else
                {
                    //Invalid username or password
                    this.ShowErrorNotification("Invalid username or password.");
                }
            }
        }

        public bool Validate(out string errMsg)
        {
            errMsg = string.Empty;
            if (String.IsNullOrEmpty(txtUserName.Value.Trim()))
            {
                errMsg = "User Name can not be blank.";
                return false;

            }
            if (String.IsNullOrEmpty(txtPassword.Value.Trim()))
            {
                errMsg = "Password can not be blank.";
                return false;
            }
            return true;
        }
        
    }
}