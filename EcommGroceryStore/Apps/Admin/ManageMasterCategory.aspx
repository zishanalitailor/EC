<%@ Page Title="" Language="C#" MasterPageFile="~/Apps/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageMasterCategory.aspx.cs" Inherits="EcommGroceryStore.Apps.Admin.ManageMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="innerContent">
        <asp:GridView ID="gvMainCategory" runat="server" AutoGenerateColumns="false" class="table table-bordered table-hover" Width="100%"
            AllowPaging="true" ShowFooter="true"
            OnPageIndexChanging="gvMainCategory_PageIndexChanging"
            OnRowEditing="gvMainCategory_RowEditing"
            OnRowUpdating="gvMainCategory_RowUpdating"
            OnRowCancelingEdit="gvMainCategory_RowCancelingEdit"
            PageSize="10">
            <Columns>
                <asp:TemplateField HeaderText="Main CategoryId">
                    <ItemTemplate>
                        <asp:Label ID="lblCategoryId" runat="server" Text='<%# Eval("MainCategoryId")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Main Category">
                    <ItemTemplate>
                        <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("Name")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCategory" runat="server" Text='<%# Eval("Name")%>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddCategory" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="Main Category name can not be blank." ForeColor="Red" Font-Size="Small" ControlToValidate="txtAddCategory" ValidationGroup="insert" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkRemove" runat="server" CommandArgument='<%# Eval("MainCategoryId")%>' OnClientClick="return confirm('Do you want to delete?')" Text="Delete" OnClick="lnkRemove_Click"></asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="btnAddMainCategory" ValidationGroup="insert" runat="server" Text="Add Category" OnClick="btnAddMainCategory_Click" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
