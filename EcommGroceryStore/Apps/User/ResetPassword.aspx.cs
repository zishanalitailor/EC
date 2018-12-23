using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Unique.EcommGroceryStore.Core.Repository;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace EcommGroceryStore.Apps.User
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            using (UserRepository repository = new UserRepository())
            {
                int userId = UserRepository.GetUserId();
                if (userId > 0)
                {
                    Users users = repository.Get(userId);
                    if (users != null)
                    {
                        users.Password = Password.Text.Trim();
                        repository.Update();
                        SuccessMessage.Visible = true;
                        SuccessMessage.Text = "Password updated successfully !!";
                    }
                }
                else
                {
                    ErrorMessage.Visible = true;
                    ErrorMessage.Text = "User not found !!";

                }

            }
        }
    }
}