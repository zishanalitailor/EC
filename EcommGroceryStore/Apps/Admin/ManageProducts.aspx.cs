using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Unique.EcommGroceryStore.Core.Repository;
using Unique.EcommGroceryStore.Core.Utility;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace EcommGroceryStore.Apps.Admin
{
    public partial class ManageProducts : System.Web.UI.Page
    {
        public int mainCatId { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMainCategories();
                lblMsg.Visible = false;
                lblMsg.Text = "";
            }
        }

        private void BindMainCategories()
        {
            List<MainCategoryMaster> mainList;
            using (MasterCategoryRepository mainRepo = new MasterCategoryRepository())
                mainList = mainRepo.GetList(0).ToList();

            if (mainList.Count > 0)
            {
                ddlMain.DataSource = mainList;
                ddlMain.DataTextField = "Name";
                ddlMain.DataValueField = "MainCategoryId";
                mainCatId = mainList.Select(r => r.MainCategoryId).First();
                BindSubCategories();
            }

            ddlMain.DataBind();
            ddlMain.Items.Insert(0, new ListItem("Select Main Category", "0"));
        }

        private void BindSubCategories()
        {
            int mainId = 0;
            if (mainCatId > 0)
                mainId = mainCatId;
            else
                mainId = String.IsNullOrEmpty(ddlMain.SelectedValue) ? mainCatId : Convert.ToInt32(ddlMain.SelectedValue);

            List<SubCategoryMaster> subList;
            using (SubCategoryMasterRepository subRepo = new SubCategoryMasterRepository())
                subList = subRepo.GetList(mainId).ToList();

            if (subList.Count > 0)
            {
                ddlSub.DataSource = subList;
                ddlSub.DataTextField = "Name";
                ddlSub.DataValueField = "SubCategoryId";
            }

            ddlSub.DataBind();
            ddlSub.Items.Insert(0, new ListItem("Select Sub Category", "0"));
        }

        protected void ddlMain_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ddlMain.SelectedValue) > 0)
            {
                BindSubCategories();
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            int selection = Convert.ToInt32(rbtTypeList.SelectedValue);
            switch (selection)
            {
                case 1:
                    UploadFromExcel();
                    break;
                case 2:
                    UploadFromCSV();
                    break;
                case 3:
                    UploadFromTEXT();
                    break;
            }
        }

        private void UploadFromExcel()
        {
            try
            {
                int subId = Convert.ToInt32(ddlSub.SelectedValue.Trim());
                List<ProductDetails> productList = GetContactsDetailsFromExcelFile(fupFileProduct, subId);
                var bulkUpload = new BulkUploadRepository(productList);
                bulkUpload.UploadProduct();

                lblMsg.Text = "Product details has been uploaded.";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Visible = true;
                ClearFields();

            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message.ToString();
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Visible = true;
            }
        }

        private void ClearFields()
        {
            ddlMain.SelectedValue = "0";
            ddlSub.SelectedValue = "0";
            rbtTypeList.SelectedValue = "0";
        }

        private void UploadFromCSV()
        {
            try
            {
                int subId = Convert.ToInt32(ddlSub.SelectedValue.Trim());
                List<ProductDetails> productList = GetContactsDetailsFromFlatFile(fupFileProduct, subId);
                var bulkUpload = new BulkUploadRepository(productList);
                bulkUpload.UploadProduct();

                lblMsg.Text = "Product details has been uploaded.";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Visible = true;
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message.ToString();
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Visible = true;
            }
        }

        private void UploadFromTEXT()
        {


        }

        public List<ProductDetails> GetContactsDetailsFromFlatFile(FileUpload fup, int subCategoryId)
        {
            List<ProductDetails> products;
            string fileName = fup.PostedFile.FileName;
            DataTable dtExcelData = Utilities.FlatFileToDataTable(fup.FileContent, false);
            Utilities.GetContactListFromDataTable(dtExcelData, subCategoryId, out products);
            return products;
        }

        public List<ProductDetails> GetContactsDetailsFromExcelFile(FileUpload fup, int subCategoryId)
        {
            List<ProductDetails> products;
            string fileName = fup.PostedFile.FileName;
            DataTable dtExcelData = Utilities.ExcelToDataTable(fup.FileContent, fileName, true);
            Utilities.GetContactListFromDataTable(dtExcelData, subCategoryId, out products);
            return products;
        }
    }
}