<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSabji.Master" AutoEventWireup="true" CodeBehind="AddAddress.aspx.cs" Inherits="EcommGroceryStore.Apps.User.AddAddress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <p class="text-success">
        <asp:Literal runat="server" ID="SuccessMessage" />
    </p>
    <div class="col-lg-12 col-md-12">
        <div class="col-1-wrapper">
            <div class="account-login">
                <div class="page-title">
                    <h1>Address Book</h1>
                </div>
                <div class="col2-set">
                    <div class="col-1 new-users">
                        <div class="content">
                            <ul class="form-list">
                                <li class="fields">
                                    <div class="customer-name row">
                                        <div class="field name-Address col-md-6 col-sm-6 col-xs-6">
                                            <label for="Address" class="required"><em>*</em>Address</label>
                                            <div class="input-box">
                                                <input type="text" runat="server" id="txtAddress" name="Address" value="" title="Address" maxlength="255" class="input-text required-entry" />
                                                <br />
                                                <asp:RequiredFieldValidator ID="rAddress" ValidationGroup="register" ErrorMessage="Address can not be blank."
                                                    Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtAddress" runat="server" />
                                            </div>
                                        </div>
                                        <div class="field name-lastname col-md-6 col-sm-6 col-xs-6">
                                            <label for="Landmark" class="required"><em>*</em>Landmark</label>
                                            <div class="input-box">
                                                <input type="text" runat="server" id="txtLandmark" name="Landmark" value="" title="Landmark" maxlength="255" class="input-text required-entry" />
                                                <br />
                                                <asp:RequiredFieldValidator ID="rLandmark" ValidationGroup="register" ErrorMessage="Landmark can not be blank."
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
                                                <asp:RequiredFieldValidator ID="rDirection" ValidationGroup="register" ErrorMessage="Direction can not be blank."
                                                    Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtDirection" runat="server" />
                                            </div>
                                        </div>
                                        <div class="field name-mobile col-md-6 col-sm-6 col-xs-6">
                                            <label for="City" class="required"><em>*</em>City</label>
                                            <div class="input-box">
                                                <asp:DropDownList runat="server" ID="ddlCity" Enabled="false">
                                                </asp:DropDownList>
                                                <br />
                                                <asp:RequiredFieldValidator ValidationGroup="register" ErrorMessage="Please select city."
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
                                                <asp:RequiredFieldValidator ID="rArea" ValidationGroup="register" ErrorMessage="Please select Area."
                                                    Font-Size="Smaller" Font-Bold="true" InitialValue="0" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlArea" runat="server" />
                                            </div>
                                        </div>
                                        <div class="field name-email col-md-6 col-sm-6 col-xs-6">
                                            <label for="Pincode" class="required"><em>*</em>Pincode</label>
                                            <div class="input-box">
                                                <input type="text" name="Pincode" runat="server" id="txtPincode" value="" title="Pincode" class="input-text required-entry" />
                                                <br />
                                                <asp:RequiredFieldValidator ID="rPincode" ValidationGroup="register" ErrorMessage="Pincode can not be blank."
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
                                    <br />
                                    <div class="customer-name row">
                                        <div class="field name-Addresstype col-md-6 col-sm-6 col-xs-6">
                                            <label for="AddressType" class="required">Address type</label>
                                            <div class="input-box">

                                                <asp:RadioButton ID="rbtHome" Text="Home" onClick="ShowHideOther(0)" GroupName="addresstype" Checked="true" runat="server" /><br />
                                                <asp:RadioButton ID="rbtOffice" Text="Office" onClick="ShowHideOther(1)" GroupName="addresstype" runat="server" /><br />
                                                <asp:RadioButton ID="rbtOther" Text="Other" onClick="ShowHideOther(1)" GroupName="addresstype" runat="server" /><br />
                                            </div>
                                        </div>
                                        <div class="field name-Addresstype col-md-6 col-sm-6 col-xs-6">
                                            <label for="AddressType" class="required">Default</label>
                                            <div class="input-box">
                                                <asp:RadioButton ID="rbtYes" Text="Yes" GroupName="isdefault" runat="server" /><br />
                                                <asp:RadioButton ID="rbtNo" Text="No" GroupName="isdefault" Checked="true" runat="server" /><br />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="fields" id="liOther" runat="server">
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
                <div class="col2-set">
                    <div class="col-1 new-users">
                        <div class="buttons-set">
                            <button type="submit" class="button" validationgroup="register" title="Create a new address" name="Add Address"
                                runat="server" onserverclick="LogIn_ServerClick" id="LogIn">
                                <span><span>Add Address</span></span></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function ShowHideOther(val) {
            $("#<%= liOther.ClientID %>").hide();
            if (parseInt(val) == 1)
                $("#<%= liOther.ClientID %>").show();
        }
    </script>
</asp:Content>
