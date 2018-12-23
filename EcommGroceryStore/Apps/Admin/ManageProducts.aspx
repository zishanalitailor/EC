<%@ Page Title="" Language="C#" MasterPageFile="~/Apps/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="EcommGroceryStore.Apps.Admin.ManageProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="innerContent">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div style="text-align: center; margin: 5px;">
                    <asp:Label Text="" ID="lblMsg" Font-Size="Medium" runat="server" Visible="false" />
                </div>
                <table cellspacing="8" cellpadding="8">
                    <tr>
                        <td>Main Category</td>
                        <td>:</td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlMain" AutoPostBack="true" OnSelectedIndexChanged="ddlMain_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ErrorMessage="Please select main category." Display="Dynamic" ForeColor="Red" Font-Size="Small" ValidationGroup="upload" ControlToValidate="ddlMain" runat="server" InitialValue="0" />
                        </td>
                    </tr>
                    <tr>
                        <td>Sub Category</td>
                        <td>:</td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlSub">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ErrorMessage="Please select sub category." Display="Dynamic" ForeColor="Red" Font-Size="Small" ValidationGroup="upload" ControlToValidate="ddlSub" runat="server" InitialValue="0" />
                        </td>
                    </tr>
                    <tr>
                        <td>File type</td>
                        <td>:</td>
                        <td>
                            <asp:RadioButtonList runat="server" ID="rbtTypeList" RepeatDirection="Horizontal" CellPadding="3">
                                <asp:ListItem Text="&nbsp;Excel" Value="1" Selected="True" />
                                <asp:ListItem Text="&nbsp;CSV" Value="2" />
                                <asp:ListItem Text="&nbsp;TEXT" Value="3" style="display: none;" />
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>Upload File</td>
                        <td>:</td>
                        <td>
                            <asp:FileUpload runat="server" ID="fupFileProduct" />
                            <asp:RequiredFieldValidator ErrorMessage="File is required." ControlToValidate="fupFileProduct" Display="Dynamic" runat="server" ForeColor="Red" Font-Size="Small" ValidationGroup="upload" />
                            <asp:RegularExpressionValidator ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.xls|.xlsx|.csv|.txt)$" Display="Dynamic" ControlToValidate="fupFileProduct" runat="server" ForeColor="Red" Font-Size="Small" ValidationGroup="upload" ErrorMessage="Please select a valid file (only Excel, CSV, TEXT)." />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Button Text="Upload" ID="btnUpload" OnClick="btnUpload_Click" runat="server" ValidationGroup="upload" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnUpload" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>
