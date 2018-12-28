using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using EcommGroceryStore.Models;
using Unique.EcommGroceryStore.Core.Repository;
using Unique.EcommGroceryStore.DAL.EntityModel;
using System.Collections;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using NotificationHelper;
using Unique.EcommGroceryStore.Core.Common;
using Unique.EcommGroceryStore.Core.Notification;

namespace EcommGroceryStore.Account
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropdownList();
            }
        }

        protected void txtSubmit_ServerClick(object sender, EventArgs e)
        {
            try
            {
                using (UserRepository repository = new UserRepository())
                {
                    if (!repository.CheckUserisExistOrNot(txtUserName.Value.Trim()))
                    {
                        if (!repository.IsEmailIsExists(txtUserName.Value.Trim()))
                        {
                            string activationCode = Guid.NewGuid().ToString();
                            Users newUsers = new Users
                            {
                                AlternateNumber = txtalNumber.Value.Trim(),
                                EmailId = txtAddress.Value.Trim(),
                                FirstName = txtfirstname.Value.Trim(),
                                IsFollowUp = chkFollowUp.Checked,
                                LastName = txtlastname.Value.Trim(),
                                MobileNumber = txtMobileNumber.Value.Trim(),
                                Password = txtpassword.Value.Trim(),
                                RegistrationDate = System.DateTime.Now,
                                RoleId = (int)EnumAccountType.User,
                                Status = false,
                                UserName = txtUserName.Value.Trim(),
                                ActivationCode = activationCode
                            };
                            newUsers = repository.Add(newUsers);
                            if (chkAddress.Checked)
                            {
                                int type = rbtHome.Checked ? 1 : rbtOffice.Checked ? 2 : 3;
                                EnumAddressType addressType = (EnumAddressType)type;

                                AddressDetails newAddress = new AddressDetails();
                                newAddress.UserId = newUsers.UserId;
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
                                newAddress.IsDefault = true;
                                using (AddressRepository addressRepository = new AddressRepository())
                                    addressRepository.Add(newAddress);
                            }

                            // Send varification email for registration.
                            string url = string.Empty;
                            url = Request.Url.AbsoluteUri.Replace("Register", "VerifyEmailAddress.aspx?ActivationCode=" + activationCode.ToString());
                            if (Request.Url.AbsoluteUri.Contains(".aspx"))
                                Request.Url.AbsoluteUri.Replace("Register.aspx", "VerifyEmailAddress.aspx?ActivationCode=" + activationCode.ToString());
                            string sBody = string.Empty;
                            sBody = "Hello " + newUsers.UserName.Trim() + ",";
                            sBody += "<br /><br />Please click the following link to activate your account";
                            sBody += "<br /><a href = '" + url + "'>Click here to activate your account.</a>";
                            sBody += "<br /><br />Thanks";
                            EmailHelper.SendMail("", newUsers.EmailId, "Account Activation", sBody);
                            this.ShowSuccessfulNotification("Your registration successful. Activation email has been sent to your register email address.");
                        }
                        else { this.ShowErrorNotification("Email address is already exists, Please register with another email address."); }
                    }
                    else
                    { this.ShowErrorNotification("Username is already exists, Please select another username."); }
                }
            }
            catch (Exception ex)
            {
                this.ShowErrorNotification("Error in txtSubmit_ServerClick : " + ex.Message.ToString());
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
    }
}