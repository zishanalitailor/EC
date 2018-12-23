<%@ Page Title="Log in" Language="C#" MasterPageFile="~/MasterSabji.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EcommGroceryStore.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="col-lg-12 col-md-12">
        <div class="col-1-wrapper">
            <div class="account-login">
                <div class="page-title">
                    <h1>Login or Create an Account</h1>
                </div>
                <div class="col2-set">
                    <div class="col-1 new-users">
                        <div class="content">
                            <h2>New Customers</h2>
                            <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
                        </div>
                    </div>
                    <div class="col-2 registered-users">
                        <div class="content">
                            <h2>Registered Customers</h2>
                            <p>If you have an account with us, please log in.</p>
                            <ul class="form-list">
                                <li>
                                    <label for="username" class="required"><em>*</em>User Name</label>
                                    <div class="input-box">
                                        <input type="text" name="username" value="" id="txtUserName" runat="server" class="input-text" title="User Name" />
                                        <br />
                                        <asp:RequiredFieldValidator ValidationGroup="login" ErrorMessage="User name can not be blank." Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtUserName" runat="server" />
                                    </div>
                                </li>
                                <li>
                                    <label for="pass" class="required"><em>*</em>Password</label>
                                    <div class="input-box">
                                        <input type="password" name="password" runat="server" class="input-text" id="txtPassword" title="Password" />
                                        <br />
                                        <asp:RequiredFieldValidator ValidationGroup="login" ErrorMessage="Password can not be blank." Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPassword" runat="server" />
                                    </div>
                                </li>
                            </ul>
                            <p class="required">* Required Fields</p>
                        </div>
                    </div>
                </div>
                <div class="col2-set">
                    <div class="col-1 new-users">
                        <div class="buttons-set">
                            <button type="button" title="Create an Account" class="button" onclick="window.location='Register.aspx';"><span><span>Create an Account</span></span></button>
                        </div>
                    </div>
                    <div class="col-2 registered-users">
                        <div class="buttons-set">
                            <a href="Forgot.aspx" class="f-left">Forgot Your Password?</a>
                            <button type="submit" class="button" validationgroup="login" title="Login" name="LogIn" runat="server" onserverclick="LogIn_ServerClick" id="LogIn"><span><span>Login</span></span></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
