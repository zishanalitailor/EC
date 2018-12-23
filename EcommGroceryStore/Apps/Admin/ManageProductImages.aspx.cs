using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ionic.Zip;
using Unique.EcommGroceryStore.DAL.EntityModel;
using Unique.EcommGroceryStore.Core.Repository;
using System.Drawing;
using Unique.EcommGroceryStore.Core.Utility;

namespace EcommGroceryStore.Apps.Admin
{
    public partial class ManageProductImages : System.Web.UI.Page
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
            if (fupImage.HasFile)
            {
                string[] validFileTypes = { "zip" };
                string ext = Path.GetExtension(fupImage.PostedFile.FileName);
                bool isValidFile = false;
                for (int i = 0; i < validFileTypes.Length; i++)
                {
                    if (ext == "." + validFileTypes[i])
                    {
                        isValidFile = true;
                        break;
                    }
                }
                if (!isValidFile)
                {
                    lblMsg.ForeColor = Color.Red;
                    lblMsg.Text = "Invalid File. Please upload a File with extension " +
                                   string.Join(",", validFileTypes);
                }
                else
                {
                    string uploadedFile = Utilities.FormateFileName(Path.GetFileNameWithoutExtension(fupImage.PostedFile.FileName)) + Path.GetExtension(fupImage.PostedFile.FileName);
                    string location = Server.MapPath("~/ZipFiles/" + uploadedFile);
                    fupImage.SaveAs(location);

                    ZipFile fileToExtract = ZipFile.Read(location);

                    // Check subcategory folder is exist or not. If not then create folder and extract image there.
                    // After that create thumb image from regular image.
                    var extractImagePath = Server.MapPath("~/Images/" + ddlSub.SelectedValue.Trim() + "/");
                    if (!Directory.Exists(extractImagePath))
                    {
                        Directory.CreateDirectory(extractImagePath);
                        Directory.CreateDirectory(extractImagePath + "/Thumb/");
                    }
                    fileToExtract.ExtractAll(extractImagePath, ExtractExistingFileAction.DoNotOverwrite);

                    foreach (var item in fileToExtract)
                    {
                        // Load image.
                        System.Drawing.Image image = System.Drawing.Image.FromFile(extractImagePath + item.FileName);

                        // Compute thumbnail size.
                        Size thumbnailSize = Utilities.GetThumbnailSize(image);

                        // Get thumbnail.
                        System.Drawing.Image thumbnail = image.GetThumbnailImage(thumbnailSize.Width, thumbnailSize.Height, null, IntPtr.Zero);

                        // Save thumbnail.
                        thumbnail.Save(extractImagePath + "/Thumb/" + item.FileName);
                    }

                    lblMsg.ForeColor = Color.Green;
                    lblMsg.Text = "Image(s) uploaded successfully.";
                }
            }
        }
    }
}