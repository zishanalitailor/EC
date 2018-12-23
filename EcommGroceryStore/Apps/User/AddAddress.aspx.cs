using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Unique.EcommGroceryStore.Core.Common;
using Unique.EcommGroceryStore.Core.Notification;
using Unique.EcommGroceryStore.Core.Repository;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace EcommGroceryStore.Apps.User
{
    public partial class AddAddress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                liOther.Style["display"] = "none";
                BindDropdownList();
                if (Request.QueryString["id"] != null)
                {
                    _AddressId = Convert.ToInt32(Request.QueryString["id"]);
                    if (_AddressId > 0)
                        BindAddressDetails();
                }
            }
        }

        protected void LogIn_ServerClick(object sender, EventArgs e)
        {
            try
            {
                int type = rbtHome.Checked ? 1 : rbtOffice.Checked ? 2 : 3;
                EnumAddressType addressType = (EnumAddressType)type;
                int userId = UserRepository.GetUserId();
                bool isDefault = rbtYes.Checked ? true : false;
                using (AddressRepository addressRepository = new AddressRepository())
                {
                    if (_AddressId > 0) // Edit mode
                    {
                        AddressDetails address = addressRepository.Get(_AddressId);
                        if (address != null)
                        {
                            address.UserId = userId;
                            address.Address = txtAddress.Value.Trim();
                            address.Landmark = txtLandmark.Value.Trim();
                            address.Direction = txtDirection.Value.Trim();
                            address.CityId = Convert.ToInt32(ddlCity.SelectedValue.Trim());
                            address.AreaId = Convert.ToInt32(ddlArea.SelectedValue.Trim());
                            address.CountryId = Convert.ToInt32(ddlCountry.SelectedValue.Trim());
                            address.Pincode = txtPincode.Value.Trim();
                            address.AddressTypeId = (int)addressType;
                            if (rbtOffice.Checked || rbtOther.Checked)
                                address.OtherAddress = txtOther.Value.Trim();
                            else
                                address.OtherAddress = "NA";

                            // if IsDefault is true then make other false.
                            if (isDefault)
                                addressRepository.MakeOtherfalse(userId);

                            address.IsDefault = isDefault;
                            addressRepository.Update();

                            Response.Redirect("~/Apps/User/AddressBookList.aspx?fg=2");
                            //SuccessMessage.Visible = true;
                            //SuccessMessage.Text = "Address has been updated successfully.";
                        }
                    }
                    else // Add mode
                    {
                        if (!addressRepository.GetAddressAlreadyExistsOrNot(userId, type))
                        {
                            AddressDetails newAddress = new AddressDetails();
                            newAddress.UserId = userId;
                            newAddress.Address = txtAddress.Value.Trim();
                            newAddress.Landmark = txtLandmark.Value.Trim();
                            newAddress.Direction = txtDirection.Value.Trim();
                            newAddress.CityId = Convert.ToInt32(ddlCity.SelectedValue.Trim());
                            newAddress.AreaId = Convert.ToInt32(ddlArea.SelectedValue.Trim());
                            newAddress.CountryId = Convert.ToInt32(ddlCountry.SelectedValue.Trim());
                            newAddress.Pincode = txtPincode.Value.Trim();
                            newAddress.AddressTypeId = (int)addressType;
                            if (rbtOffice.Checked || rbtOther.Checked)
                                newAddress.OtherAddress = txtOther.Value.Trim();
                            else
                                newAddress.OtherAddress = "NA";

                            // if IsDefault is true then make other false.
                            if (isDefault)
                                addressRepository.MakeOtherfalse(userId);

                            newAddress.IsDefault = isDefault;
                            addressRepository.Add(newAddress);

                            Response.Redirect("~/Apps/User/AddressBookList.aspx?fg=1");
                            //SuccessMessage.Visible = true;
                            //SuccessMessage.Text = "New address has been added successfully.";
                        }
                        else
                        {
                            ErrorMessage.Visible = true;
                            ErrorMessage.Text = "Address is already exists !!";
                        }
                    }

                }

            }
            catch (Exception ex)
            {
                ErrorMessage.Visible = true;
                ErrorMessage.Text = ex.Message.ToString();
            }
        }

        private void BindAddressDetails()
        {
            using (AddressRepository repository = new AddressRepository())
            {
                AddressDetails address = repository.Get(_AddressId);
                if (address != null)
                {
                    txtAddress.Value = address.Address;
                    txtDirection.Value = address.Direction;
                    txtLandmark.Value = address.Landmark;
                    txtPincode.Value = address.Pincode;
                    txtOther.Value = address.OtherAddress == "NA" ? string.Empty : address.OtherAddress;
                    ddlArea.SelectedValue = address.AreaId.ToString();
                    ddlCity.SelectedValue = address.CityId.ToString();
                    ddlCountry.SelectedValue = address.CountryId.ToString();

                    switch (address.AddressTypeId)
                    {
                        case (int)EnumAddressType.Home:
                            rbtHome.Checked = true;
                            rbtOffice.Checked = false;
                            rbtOther.Checked = false;
                            liOther.Style["display"] = "none";
                            break;
                        case (int)EnumAddressType.Office:
                            rbtHome.Checked = false;
                            rbtOffice.Checked = true;
                            rbtOther.Checked = false;
                            liOther.Style["display"] = "inline";
                            break;
                        case (int)EnumAddressType.Other:
                            rbtHome.Checked = false;
                            rbtOffice.Checked = false;
                            rbtOther.Checked = true;
                            liOther.Style["display"] = "inline";
                            break;
                    }

                    switch (address.IsDefault)
                    {
                        case true:
                            rbtYes.Checked = true;
                            rbtNo.Checked = false;
                            break;
                        case false:
                            rbtYes.Checked = false;
                            rbtNo.Checked = true;
                            break;
                    }
                }
            }
        }

        private void BindDropdownList()
        {
            List<CountryMaster> countryList;
            List<CityMaster> cityList;
            List<AreaMaster> areaList;
            using (CountryRepository crepository = new CountryRepository())
                countryList = crepository.GetList(0).ToList();
            using (CityRepository cityrepository = new CityRepository())
                cityList = cityrepository.GetList(0).ToList();
            using (AreaRepository arearepository = new AreaRepository())
                areaList = arearepository.GetList(0).ToList();

            if (countryList.Count > 0)
            {
                ddlCountry.DataSource = countryList;
                ddlCountry.DataTextField = "CountryName";
                ddlCountry.DataValueField = "CountryId";
            }
            ddlCountry.DataBind();
            //ddlCountry.Items.Insert(0, new ListItem("Select Country", "0"));

            if (cityList.Count > 0)
            {
                ddlCity.DataSource = cityList;
                ddlCity.DataTextField = "CityName";
                ddlCity.DataValueField = "CityId";
            }
            ddlCity.DataBind();
            //ddlCity.Items.Insert(0, new ListItem("Select City", "0"));

            if (areaList.Count > 0)
            {
                ddlArea.DataSource = areaList;
                ddlArea.DataTextField = "AreaName";
                ddlArea.DataValueField = "AreaId";
            }
            ddlArea.DataBind();
            ddlArea.Items.Insert(0, new ListItem("Select Area", "0"));

        }

        private int _AddressId
        {
            get
            {
                int result = 0;
                if (ViewState["AddressId"] != null)
                    result = (int)ViewState["AddressId"];
                return result;
            }
            set
            {
                ViewState["AddressId"] = value;
            }
        }
    }
}