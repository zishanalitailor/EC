using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Unique.EcommGroceryStore.Core.Repository;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace EcommGroceryStore.Apps.Admin
{
    public partial class ManageMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMasterCategory();
            }
        }

        private void BindMasterCategory()
        {
            using (MasterCategoryRepository repository = new MasterCategoryRepository())
            {
                List<MainCategoryMaster> mainCategory;
                mainCategory = repository.GetList(0).ToList();
                if (mainCategory.Count() > 0)
                {
                    gvMainCategory.DataSource = mainCategory;
                }
                gvMainCategory.DataBind();
            }
        }

        protected void btnAddMainCategory_Click(object sender, EventArgs e)
        {
            string name = ((TextBox)gvMainCategory.FooterRow.FindControl("txtAddCategory")).Text;
            using (MasterCategoryRepository repository = new MasterCategoryRepository())
            {
                MainCategoryMaster newMaster = new MainCategoryMaster
                {
                    Name = name,
                };

                repository.Add(newMaster);
            }
            BindMasterCategory();
        }

        protected void lnkRemove_Click(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            int Id = Convert.ToInt32(lnkRemove.CommandArgument);
            using (MasterCategoryRepository repository = new MasterCategoryRepository())
            {
                repository.Delete(Id);
            }
            BindMasterCategory();
        }

        protected void gvMainCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BindMasterCategory();
            gvMainCategory.PageIndex = e.NewPageIndex;
            gvMainCategory.DataBind();
        }

        protected void gvMainCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMainCategory.EditIndex = e.NewEditIndex;
            BindMasterCategory();
        }

        protected void gvMainCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int mainCategoryId = Convert.ToInt32(((Label)gvMainCategory.Rows[e.RowIndex].FindControl("lblCategoryId")).Text);
            string name = ((TextBox)gvMainCategory.Rows[e.RowIndex].FindControl("txtCategory")).Text;
            using (MasterCategoryRepository repository = new MasterCategoryRepository())
            {
                var main = repository.Get(mainCategoryId);
                if (main != null)
                {
                    main.Name = name;
                    repository.Update();
                }
            }
            gvMainCategory.EditIndex = -1;
            BindMasterCategory();
        }

        protected void gvMainCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMainCategory.EditIndex = -1;
            BindMasterCategory();
        }
    }
}