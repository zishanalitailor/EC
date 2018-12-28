using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Unique.EcommGroceryStore.Core.Model;
using Unique.EcommGroceryStore.Core.Repository;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace EcommGroceryStore.Apps.Admin
{
    public partial class ManageSubCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSubCategory();
            }
        }

        private void BindSubCategory()
        {
            List<SubCategoryMasterModel> subCategory;
            using (SubCategoryMasterRepository repository = new SubCategoryMasterRepository())
            {
                subCategory = repository.GetList().OrderBy(r => r.MainCategoryName).ToList();
                if (subCategory.Count > 0)
                {
                    gvSubCategory.DataSource = subCategory;
                }
                gvSubCategory.DataBind();
            }
        }

        protected void gvSubCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BindSubCategory();
            gvSubCategory.PageIndex = e.NewPageIndex;
            gvSubCategory.DataBind();
        }

        protected void gvSubCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvSubCategory.EditIndex = e.NewEditIndex;
            BindSubCategory();
        }

        protected void gvSubCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int subCategoryId = Convert.ToInt32(((Label)gvSubCategory.Rows[e.RowIndex].FindControl("lblCategoryId")).Text);
            int mainCategoryId = Convert.ToInt32(((DropDownList)gvSubCategory.Rows[e.RowIndex].FindControl("ddlMainCategoryinner")).SelectedValue);
            string name = ((TextBox)gvSubCategory.Rows[e.RowIndex].FindControl("txtCategory")).Text;
            using (SubCategoryMasterRepository repository = new SubCategoryMasterRepository())
            {
                var main = repository.Get(subCategoryId);
                if (main != null)
                {
                    main.MainCategoryId = mainCategoryId;
                    main.Name = name;
                    repository.Update();
                }
            }
            gvSubCategory.EditIndex = -1;
            BindSubCategory();
        }

        protected void gvSubCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSubCategory.EditIndex = -1;
            BindSubCategory();
        }

        protected void btnAddSubCategory_Click(object sender, EventArgs e)
        {
            string name = ((TextBox)gvSubCategory.FooterRow.FindControl("txtAddCategory")).Text;
            int mainCategoryId = Convert.ToInt32(((DropDownList)gvSubCategory.FooterRow.FindControl("ddlMainCategory")).SelectedValue);
            using (SubCategoryMasterRepository repository = new SubCategoryMasterRepository())
            {
                SubCategoryMaster newSubMaster = new SubCategoryMaster
                {
                    MainCategoryId = mainCategoryId,
                    Name = name,
                };
                repository.Add(newSubMaster);
            }
            BindSubCategory();
        }

        protected void gvSubCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DropDownList ddl = null;
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                ddl = e.Row.FindControl("ddlMainCategory") as DropDownList;
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ddl = e.Row.FindControl("ddlMainCategoryinner") as DropDownList;
            }
            if (ddl != null)
            {
                using (MasterCategoryRepository repository = new MasterCategoryRepository())
                {
                    var mainCategory = repository.GetList(0).OrderBy(r => r.Name).ToList();
                    if (mainCategory != null)
                    {
                        ddl.DataSource = mainCategory;
                        ddl.DataTextField = "Name";
                        ddl.DataValueField = "MainCategoryId";
                        ddl.DataBind();
                        ddl.Items.Insert(0, new ListItem("-- Select Category --", "0"));
                    }
                }
            }
        }

        protected void gvSubCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int subCategoryId = Convert.ToInt32(((Label)gvSubCategory.Rows[e.RowIndex].FindControl("lblCategoryId")).Text);
            using (SubCategoryMasterRepository repository = new SubCategoryMasterRepository())
            {
                repository.Delete(subCategoryId);
            }
            BindSubCategory();
        }
    }
}