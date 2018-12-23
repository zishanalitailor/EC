<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSabji.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="EcommGroceryStore.Apps.User.ResetPassword" %>

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
                    <h1>Change Password</h1>
                </div>
                <div class="col2-set">
                    <div class="col-1 new-users">
                        <div class="content">
                            <ul class="form-list">
                                <li>
                                    <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ValidationGroup="pass"
                                            CssClass="text-danger" ErrorMessage="The password field is required." />
                                    </div>
                                </li>
                                <li>
                                    <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword" ValidationGroup="pass"
                                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" ValidationGroup="pass"
                                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col2-set">
                    <div class="col-1 new-users">
                        <div class="buttons-set">
                            <button type="submit" validationgroup="pass" class="button" title="Save" name="Save"
                                runat="server" onserverclick="btnReset_Click" id="Save">
                                <span><span>Save</span></span></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
