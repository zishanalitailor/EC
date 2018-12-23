using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Unique.EcommGroceryStore.Core.Utility;
using System.Data.SqlClient;
using System.Data;
using Unique.EcommGroceryStore.Core.Repository;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace EcommGroceryStore.Apps.User
{
    public partial class AddressBookList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["fg"] != null)
                {
                    switch (Convert.ToInt32(Request.QueryString["fg"]))
                    {
                        case 1:
                            SuccessMessage.Text = "New address has been added successfully.";
                            break;
                        case 2:
                            SuccessMessage.Text = "Address has been updated successfully.";
                            break;
                    }

                }
                BindAddressBook();

            }
        }

        private void BindAddressBook()
        {
            try
            {
                SqlParameter p1 = DataAccessLayer.CreateSqlParameter("UserId", DbType.Int32, UserRepository.GetUserId());
                SqlParameter[] ps = new SqlParameter[] { p1 };
                DataTable dt = DataAccessLayer.LoadTabularDataInDataTable("Sp_GetUserAddressByUserId", CommandType.StoredProcedure, ps);
                if (dt != null && dt.Rows.Count > 0)
                {
                    rptAddress.DataSource = dt;
                }
                rptAddress.DataBind();

            }
            catch (Exception ex)
            {
            }
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            LinkButton button = (sender as LinkButton);
            int addressId = Convert.ToInt32(button.CommandArgument);
            using (AddressRepository repository = new AddressRepository())
            {
                var address = repository.Delete(addressId);
                if (address != null)
                {
                    SuccessMessage.Text = "Address has been deleted successfully !!";
                }
                else
                {
                    ErrorMessage.Text = "Some error occurred. Please contact your system administrator.";
                }
            }
            BindAddressBook();
        }

        protected void LogIn_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Apps/User/AddAddress.aspx");
        }
    }
}