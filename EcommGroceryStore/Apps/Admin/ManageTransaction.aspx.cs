using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Unique.EcommGroceryStore.Core.Utility;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace EcommGroceryStore.Apps.Admin
{
    public partial class ManageTransaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTransacionList(0, Convert.ToInt32(ddlStatus.SelectedValue.Trim()), gvTransactionDetails);
            }
        }

        protected void gvTransactionDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int cartId = 0;
                int.TryParse(gvTransactionDetails.DataKeys[e.Row.RowIndex].Value.ToString(), out cartId);
                GridView gvOrders = e.Row.FindControl("gvOrders") as GridView;
                BindTransacionList(cartId, Convert.ToInt32(ddlStatus.SelectedValue.Trim()), gvOrders);
                decimal total = 0;
                foreach (GridViewRow row in gvOrders.Rows)
                {
                    total += Convert.ToDecimal(row.Cells[7].Text);
                }
                e.Row.Cells[8].Text = total.ToString();
            }
        }

        private void BindTransacionList(int cartId, int search, GridView gv)
        {
            SqlParameter p1 = DataAccessLayer.CreateSqlParameter("CartId", DbType.Int32, cartId);
            SqlParameter p2 = DataAccessLayer.CreateSqlParameter("Search", DbType.Int32, search);
            SqlParameter[] ps = new SqlParameter[] { p1, p2 };
            DataTable dt = DataAccessLayer.LoadTabularDataInDataTable("Sp_GetTransactionList", CommandType.StoredProcedure, ps);
            if (dt != null && dt.Rows.Count > 0)
                gv.DataSource = dt;
            gv.DataBind();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                if (btn != null)
                {
                    int transactionId = Convert.ToInt32(btn.CommandArgument);
                    using (EcommGroceryDataContext dbContext = new EcommGroceryDataContext())
                    {
                        TransactionDetails transactionDetails = dbContext.TransactionDetails.Where(r => r.TransactionId == transactionId).FirstOrDefault();
                        if (btn.CommandName.Equals("Confirm"))
                        {
                            transactionDetails.ConfirmationDate = DateTime.Now;
                            transactionDetails.IsConfirm = true;
                        }
                        else
                        {
                            transactionDetails.ConfirmationDate = DateTime.Now;
                            transactionDetails.IsConfirm = false;
                        }

                        dbContext.SaveChanges();
                    }

                    lblMsg.Visible = true;
                    if (btn.CommandName.Equals("Confirm"))
                    {
                        lblMsg.ForeColor = Color.Green;
                        lblMsg.Text = "Order of customer is confirmed.";
                    }
                    else
                    {
                        lblMsg.ForeColor = Color.Red;
                        lblMsg.Text = "Order of customer is rejected.";
                    }
                }

                BindTransacionList(0, Convert.ToInt32(ddlStatus.SelectedValue.Trim()), gvTransactionDetails);
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = ex.Message.ToString();
            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindTransacionList(0, Convert.ToInt32(ddlStatus.SelectedValue.Trim()), gvTransactionDetails);
        }

        protected void gvTransactionDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTransactionDetails.PageIndex = e.NewPageIndex;
            BindTransacionList(0, Convert.ToInt32(ddlStatus.SelectedValue.Trim()), gvTransactionDetails);
        }
    }
}