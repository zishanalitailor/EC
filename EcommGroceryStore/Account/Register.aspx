<%@ Page Title="Register" Language="C#" MasterPageFile="~/MasterSabji.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EcommGroceryStore.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="col-lg-12 col-md-12">
        <div class="col-1-wrapper">
            <div class="account-create">
                <div class="page-title">
                    <h1>Create an Account</h1>
                </div>
                <div class="row">
                    <div class="fieldset col-lg-6 col-md-6">
                        <h2 class="legend">Your Personal Details</h2>
                        <ul class="form-list">
                            <li class="fields">
                                <div class="customer-name row">
                                    <div class="field name-firstname col-md-6 col-sm-6 col-xs-6">
                                        <label for="firstname" class="required"><em>*</em>First Name</label>
                                        <div class="input-box">
                                            <input type="text" runat="server" id="txtfirstname" name="firstname" value="" title="First Name" maxlength="255" class="input-text required-entry" />
                                            <br />
                                            <asp:RequiredFieldValidator ValidationGroup="register" ErrorMessage="First Name can not be blank."
                                                Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtfirstname" runat="server" />
                                        </div>
                                    </div>
                                    <div class="field name-lastname col-md-6 col-sm-6 col-xs-6">
                                        <label for="lastname" class="required"><em>*</em>Last Name</label>
                                        <div class="input-box">
                                            <input type="text" runat="server" id="txtlastname" name="lastname" value="" title="Last Name" maxlength="255" class="input-text required-entry" />
                                            <br />
                                            <asp:RequiredFieldValidator ValidationGroup="register" ErrorMessage="Last Name can not be blank."
                                                Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtlastname" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="fields">
                                <div class="customer-name row">
                                    <div class="field name-email col-md-6 col-sm-6 col-xs-6">
                                        <label for="email_address" class="required"><em>*</em>Email Address</label>
                                        <div class="input-box">
                                            <input type="text" name="email" runat="server" id="txtemailaddress" value="" title="Email Address" class="input-text required-entry" />
                                            <br />
                                            <asp:RequiredFieldValidator ValidationGroup="register" ErrorMessage="Email Address can not be blank."
                                                Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtemailaddress" runat="server" />
                                            <asp:RegularExpressionValidator ErrorMessage="Please enter valid email address." ControlToValidate="txtemailaddress" runat="server"
                                                Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                        </div>
                                    </div>
                                    <div class="field name-mobile col-md-6 col-sm-6 col-xs-6">
                                        <label for="Mobile_Number" class="required"><em>*</em>Mobie Number</label>
                                        <div class="input-box">
                                            <input type="text" name="mobile" runat="server" id="txtMobileNumber" value="" title="Mobile Number" class="input-text required-entry" />
                                            <br />
                                            <asp:RequiredFieldValidator ValidationGroup="register" ErrorMessage="Mobile Number can not be blank."
                                                Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtMobileNumber" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="fields">
                                <div class="customer-name row">
                                    <div class="field name-altername col-md-6 col-sm-6 col-xs-6">
                                        <label for="Alternative_Contact_Number">Alternative Contact Number</label>
                                        <div class="input-box">
                                            <input type="text" name="alnumber" runat="server" id="txtalNumber" value="" title="Alternative Contact Number" class="input-text required-entry" />
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="fieldset col-lg-6 col-md-6">
                        <h2 class="legend">Your Password</h2>
                        <ul class="form-list">
                            <li class="fields">
                                <div class="field" style="margin-bottom: 5px;">
                                    <label for="username" class="required"><em>*</em>User Name</label>
                                    <div class="input-box">
                                        <input type="text" runat="server" name="username" id="txtUserName" title="username" class="input-text required-entry" />
                                        <br />
                                        <asp:RequiredFieldValidator ValidationGroup="register" ErrorMessage="Password can not be blank."
                                            Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtUserName" runat="server" />
                                    </div>
                                </div>
                                <div class="field" style="margin-bottom: 5px;">
                                    <label for="password" class="required"><em>*</em>Password</label>
                                    <div class="input-box">
                                        <input type="password" runat="server" name="password" id="txtpassword" title="Password" class="input-text required-entry" />
                                        <br />
                                        <asp:RequiredFieldValidator ValidationGroup="register" ErrorMessage="Password can not be blank."
                                            Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtpassword" runat="server" />
                                    </div>
                                </div>
                                <div class="field">
                                    <label for="confirmation" class="required"><em>*</em>Confirm Password</label>
                                    <div class="input-box">
                                        <input type="password" runat="server" name="confirmation" title="Confirm Password" id="txtconfirmation" class="input-text required-entry" />
                                        <br />
                                        <asp:RequiredFieldValidator ValidationGroup="register" ErrorMessage="Confirm Password can not be blank."
                                            Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtconfirmation" runat="server" />
                                        <asp:CompareValidator ValidationGroup="register" ErrorMessage="Password and Confirm Password must be same." Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic"
                                            ControlToValidate="txtpassword" ControlToCompare="txtconfirmation" runat="server" />
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="fieldset col-lg-6 col-md-6 hidden">
                        <h2 class="legend">Follow Up
                            <asp:CheckBox Text="" ID="chkFollowUp" runat="server" onClick="ShowHideDiv('divFllowUp')" /></h2>
                        <div id="divFllowUp" style="display: none">
                        </div>
                    </div>
                    <div class="fieldset col-lg-6 col-md-6">
                        <h2 class="legend">Your Address
                            <asp:CheckBox Text="" ID="chkAddress" runat="server" onClick="ShowHideDiv('divAddress')" /></h2>
                        <div id="divAddress" style="display: none">
                            <ul class="form-list">
                                <li class="fields">
                                    <div class="customer-name row">
                                        <div class="field name-Address col-md-6 col-sm-6 col-xs-6">
                                            <label for="Address" class="required"><em>*</em>Address</label>
                                            <div class="input-box">
                                                <input type="text" runat="server" id="txtAddress" name="Address" value="" title="Address" maxlength="255" class="input-text required-entry" />
                                                <br />
                                                <asp:RequiredFieldValidator ID="rAddress" ValidationGroup="register" Enabled="false" ErrorMessage="Address can not be blank."
                                                    Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtAddress" runat="server" />
                                            </div>
                                        </div>
                                        <div class="field name-lastname col-md-6 col-sm-6 col-xs-6">
                                            <label for="Landmark" class="required"><em>*</em>Landmark</label>
                                            <div class="input-box">
                                                <input type="text" runat="server" id="txtLandmark" name="Landmark" value="" title="Landmark" maxlength="255" class="input-text required-entry" />
                                                <br />
                                                <asp:RequiredFieldValidator ID="rLandmark" ValidationGroup="register" Enabled="false" ErrorMessage="Landmark can not be blank."
                                                    Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtLandmark" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="fields">
                                    <div class="customer-name row">
                                        <div class="field name-email col-md-6 col-sm-6 col-xs-6">
                                            <label for="Direction" class="required"><em>*</em>Direction</label>
                                            <div class="input-box">
                                                <input type="text" name="Direction" runat="server" id="txtDirection" value="" title="Direction" class="input-text required-entry" />
                                                <br />
                                                <asp:RequiredFieldValidator ID="rDirection" ValidationGroup="register" Enabled="false" ErrorMessage="Direction can not be blank."
                                                    Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtDirection" runat="server" />
                                            </div>
                                        </div>
                                        <div class="field name-mobile col-md-6 col-sm-6 col-xs-6">
                                            <label for="City" class="required"><em>*</em>City</label>
                                            <div class="input-box">
                                                <asp:DropDownList runat="server" ID="ddlCity" Enabled="false">
                                                </asp:DropDownList>
                                                <br />
                                                <asp:RequiredFieldValidator ValidationGroup="register" Enabled="false" ErrorMessage="Please select city."
                                                    Font-Size="Smaller" Font-Bold="true" InitialValue="0" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlCity" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="fields">
                                    <div class="customer-name row">
                                        <div class="field name-altername col-md-6 col-sm-6 col-xs-6">
                                            <label for="Area" class="required"><em>*</em>Area</label>
                                            <div class="input-box">
                                                <asp:DropDownList runat="server" ID="ddlArea">
                                                </asp:DropDownList>
                                                <br />
                                                <asp:RequiredFieldValidator ID="rArea" ValidationGroup="register" Enabled="false" ErrorMessage="Please select Area."
                                                    Font-Size="Smaller" Font-Bold="true" InitialValue="0" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlArea" runat="server" />
                                            </div>
                                        </div>
                                        <div class="field name-email col-md-6 col-sm-6 col-xs-6">
                                            <label for="Pincode" class="required"><em>*</em>Pincode</label>
                                            <div class="input-box">
                                                <input type="text" name="Pincode" runat="server" id="txtPincode" value="" title="Pincode" class="input-text required-entry" />
                                                <br />
                                                <asp:RequiredFieldValidator ID="rPincode" ValidationGroup="register" Enabled="false" ErrorMessage="Pincode can not be blank."
                                                    Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPincode" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="fields">
                                    <div class="customer-name row">
                                        <div class="field name-email col-md-6 col-sm-6 col-xs-6">
                                            <label for="Country" class="required">Country</label>
                                            <div class="input-box">
                                                <asp:DropDownList runat="server" ID="ddlCountry" Enabled="false">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="fields">
                                    <div class="customer-name row">
                                        <div class="field name-Addresstype col-md-12 col-sm-12 col-xs-12">
                                            <label for="AddressType" class="required">Address type</label>
                                            <div class="input-box">
                                                <br />
                                                <asp:RadioButton ID="rbtHome" Text="Home" onClick="ShowHideOther(0)" GroupName="addresstype" Checked="true" runat="server" /><br />
                                                <asp:RadioButton ID="rbtOffice" Text="Office" onClick="ShowHideOther(1)" GroupName="addresstype" runat="server" /><br />
                                                <asp:RadioButton ID="rbtOther" Text="Other" onClick="ShowHideOther(1)" GroupName="addresstype" runat="server" /><br />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="fields" id="liOther" style="display: none;">
                                    <div class="customer-name row">
                                        <div class="field name-email col-md-12 col-sm-12 col-xs-12">
                                            <label for="Country" class="required">Other</label>
                                            <div class="input-box">
                                                <input type="text" name="Other" runat="server" id="txtOther" value="" title="Other" class="input-text required-entry" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="buttons-set">
                    <p class="back-link"><a href="Login.aspx" class="back-link"><small>&laquo; </small>Back</a></p>
                    <button type="submit" runat="server" id="txtSubmit" onserverclick="txtSubmit_ServerClick" validationgroup="register"
                        title="Submit" class="button">
                        <span><span>Submit</span></span></button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function ShowHideDiv(obj) {
            var rAddress = document.getElementById("<%=rAddress.ClientID%>");
            var rLandmark = document.getElementById("<%=rLandmark.ClientID%>");
            var rDirection = document.getElementById("<%=rDirection.ClientID%>");
            var rArea = document.getElementById("<%=rArea.ClientID%>");
            var rPincode = document.getElementById("<%=rPincode.ClientID%>");
            if ($("#" + obj).css('display') == 'none') {
                $("#" + obj).show();
                // enable validator
                ValidatorEnable(rAddress, true);
                ValidatorEnable(rLandmark, true);
                ValidatorEnable(rDirection, true);
                ValidatorEnable(rArea, true);
                ValidatorEnable(rPincode, true);
            }
            else {
                $("#" + obj).hide();
                // disable validator
                ValidatorEnable(rAddress, false);
                ValidatorEnable(rLandmark, false);
                ValidatorEnable(rDirection, false);
                ValidatorEnable(rArea, false);
                ValidatorEnable(rPincode, false);
            }
        }

        function ShowHideOther(val) {
            $("#liOther").hide();
            if (parseInt(val) == 1)
                $("#liOther").show();
        }
    </script>
</asp:Content>
