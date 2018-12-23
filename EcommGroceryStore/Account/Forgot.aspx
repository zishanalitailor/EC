<%@ Page Title="Forgot password" Language="C#" MasterPageFile="~/MasterSabji.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="EcommGroceryStore.Account.ForgotPassword" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="col-lg-12 col-md-12">
        <div class="col-1-wrapper">
            <div class="page-title">
                <h1>Forgot Your Password?</h1>
            </div>
            <div class="fieldset">
                <h2 class="legend">Retrieve your password here</h2>
                <p>Please enter your email address below. You will receive a link to reset your password.</p>
                <ul class="form-list">
                    <li>
                        <label for="email_address" class="required"><em>*</em>Email Address</label>
                        <div class="input-box">
                            <input type="text" runat="server" name="email" alt="email" id="txtemailaddress" class="input-text required-entry validate-email" value="" />
                            <br />
                            <asp:RequiredFieldValidator ValidationGroup="register" ErrorMessage="Email Address can not be blank."
                                Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="txtemailaddress" runat="server" /><br />
                            <asp:RegularExpressionValidator ErrorMessage="Please enter valid email address." ControlToValidate="txtemailaddress" runat="server"
                                Font-Size="Smaller" Font-Bold="true" ForeColor="Red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                        </div>
                    </li>
                </ul>
            </div>
            <div class="buttons-set">
                <p class="back-link"><a href="Login.aspx"><small>&laquo; </small>Back to Login</a></p>
                <button type="submit" runat="server" id="btnSubmit" onserverclick="btnSubmit_ServerClick" validationgroup="register" title="Submit" class="button"><span><span>Submit</span></span></button>
            </div>
        </div>
    </div>
</asp:Content>
