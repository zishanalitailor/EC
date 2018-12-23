<%@ Page Title="" Language="C#" MasterPageFile="~/Apps/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EcommGroceryStore.Apps.Admin.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .listnone {
            list-style: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="innerContent">
        <ul>
            <li class="listnone"><strong>User Management</strong></li>
            <li>
                <asp:HyperLink Text="Manage User" NavigateUrl="~/Apps/Admin/ManageUser.aspx" ToolTip="Manage User" runat="server" /></li>
        </ul>
        <ul>
            <li class="listnone"><strong>Categoty Management</strong></li>
            <li>
                <asp:HyperLink NavigateUrl="~/Apps/Admin/ManageMasterCategory.aspx" Text="Manage Master-Category" ToolTip="Manage Master-Category" runat="server" /></li>
            <li>
                <asp:HyperLink NavigateUrl="~/Apps/Admin/ManageSubCategory.aspx" Text="Manage Sub-Category" ToolTip="Manage Sub-Category" runat="server" /></li>
        </ul>
        <ul>
            <li class="listnone"><strong>Product Management</strong></li>
            <li>
                <asp:HyperLink NavigateUrl="~/Apps/Admin/ManageProducts.aspx" Text="Manage Products" ToolTip="Manage Products" runat="server" /></li>
            <li>
                <asp:HyperLink NavigateUrl="~/Apps/Admin/ManageProductImages.aspx" Text="Manage Product Images" ToolTip="Manage Product Images" runat="server" /></li>
            <li>
                <asp:HyperLink NavigateUrl="~/Apps/Admin/ManageProductList.aspx" Text="Manage Product List" ToolTip="Manage Product List" runat="server" /></li>
        </ul>
        <ul>
            <li class="listnone"><strong>Transaction Management</strong></li>
            <li>
                <asp:HyperLink NavigateUrl="~/Apps/Admin/ManageTransaction.aspx" Text="Manage Transaction" ToolTip="Manage Transaction" runat="server" /></li>

        </ul>
    </div>
</asp:Content>
