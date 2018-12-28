<%@ Page Title="" Language="C#" MasterPageFile="~/Apps/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageSubCategory.aspx.cs" Inherits="EcommGroceryStore.Apps.Admin.ManageSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="innerContent">
        <asp:GridView ID="gvSubCategory" runat="server" AutoGenerateColumns="false" class="table table-bordered table-hover" Width="100%"
            AllowPaging="true" ShowFooter="true"
            OnPageIndexChanging="gvSubCategory_PageIndexChanging"
            OnRowEditing="gvSubCategory_RowEditing"
            OnRowUpdating="gvSubCategory_RowUpdating"
            OnRowCancelingEdit="gvSubCategory_RowCancelingEdit"
            OnRowDataBound="gvSubCategory_RowDataBound"
            OnRowDeleting="gvSubCategory_RowDeleting"
            PageSize="50">
            <Columns>
                <asp:TemplateField Visible="false" HeaderText="Sub CategoryId">
                    <ItemTemplate>
                        <asp:Label ID="lblCategoryId" runat="server" Text='<%# Eval("SubCategoryId")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Main Category">
                    <ItemTemplate>
                        <asp:Label ID="lblMainCategory" runat="server" Text='<%# Eval("MainCategoryName")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlMainCategoryinner" runat="server">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList runat="server" ID="ddlMainCategory">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ErrorMessage="Please select Main Category." ForeColor="Red" Font-Size="Small" InitialValue="0" ValidationGroup="insert" ControlToValidate="ddlMainCategory" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sub Category">
                    <ItemTemplate>
                        <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("SubCategoryName")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCategory" runat="server" Text='<%# Eval("SubCategoryName")%>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddCategory" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="Sub Category name can not be blank." ForeColor="Red" Font-Size="Small" ControlToValidate="txtAddCategory" ValidationGroup="insert" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="Action" ShowEditButton="True" ShowDeleteButton="true" />
                <asp:TemplateField HeaderStyle-Width="120px">
                    <FooterTemplate>
                        <asp:Button ID="btnAddSubCategory" ValidationGroup="insert" runat="server" Text="Add Category" OnClick="btnAddSubCategory_Click" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
