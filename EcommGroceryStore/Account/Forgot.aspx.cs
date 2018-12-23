using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using EcommGroceryStore.Models;
using Unique.EcommGroceryStore.Core.Repository;
using Unique.EcommGroceryStore.DAL.EntityModel;
using NotificationHelper;
using Unique.EcommGroceryStore.Core.Notification;

namespace EcommGroceryStore.Account
{
    public partial class ForgotPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_ServerClick(object sender, EventArgs e)
        {
            using (UserRepository repository = new UserRepository())
            {
                if (repository.IsEmailIsExists(txtemailaddress.Value.Trim()))
                {
                    Users user = repository.GetUserByEmailId(txtemailaddress.Value.Trim());
                    if (user != null)
                    {
                        string sBody = "";
                        sBody = "Dear " + user.UserName.Trim() + ",";
                        sBody += "<br /><br />Please find the following your account details.";
                        sBody += "<br />User Name : " + user.UserName.Trim();
                        sBody += "<br />Password : " + user.Password.Trim();
                        sBody += "<br /><br />Please return to the site and log in using above login information.";
                        sBody += "<br /><br />Thanks";

                        EmailHelper.SendMail("", txtemailaddress.Value.Trim(), "Forgot Password", sBody);
                        this.ShowSuccessfulNotification("Your login details has been sent to your given email address.");
                    }
                    else
                    { this.ShowErrorNotification("The user is not exists/active in this system."); }

                }
                else { this.ShowErrorNotification("The email address is not exists."); }
            }
        }
    }
}