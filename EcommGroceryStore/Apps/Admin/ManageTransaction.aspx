<%@ Page Title="" Language="C#" MasterPageFile="~/Apps/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageTransaction.aspx.cs" Inherits="EcommGroceryStore.Apps.Admin.ManageTransaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="innerContent">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div style="text-align: center; margin: 5px;">
                    <asp:Label Text="" ID="lblMsg" Font-Size="Medium" runat="server" Visible="false" />
                </div>
                <br />
                <table>
                    <tr>
                        <td>Filter by Status : 
                            <asp:DropDownList runat="server" ID="ddlStatus" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                <asp:ListItem Text="All" Value="-1" />
                                <asp:ListItem Text="Pending" Value="0" Selected="True" />
                                <asp:ListItem Text="Confirmed" Value="1" />
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="gvTransactionDetails" runat="server" AutoGenerateColumns="false" DataKeyNames="CartId" OnRowDataBound="gvTransactionDetails_RowDataBound"
                    class="table table-bordered" Width="100%" PageSize="25" AllowPaging="true" OnPageIndexChanging="gvTransactionDetails_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <img title="Click to customer's order" alt="Click to customer's order" style="cursor: pointer; width: 20px;" src="../../Images/plus.png" />
                                <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                                    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" class="table table-bordered table-hover" Width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                                            <asp:BoundField DataField="Description" HeaderText="Description" />
                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                            <asp:BoundField DataField="PricePerUnit" HeaderText="Price PerUnit" />
                                            <asp:BoundField DataField="Unit" HeaderText="Unit" />
                                            <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                            <asp:BoundField DataField="Discount" HeaderText="Discount" />
                                            <asp:BoundField DataField="NetAmount" HeaderText="Net Amount" />
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="FullName" HeaderText="Customer Name" />
                        <asp:BoundField DataField="EmailId" HeaderText="Email Address" />
                        <asp:BoundField DataField="MobileNumber" HeaderText="Mobile Number" />
                        <asp:BoundField DataField="AlternateNumber" HeaderText="Alternate Number" />
                        <asp:BoundField DataField="TransactionDate" HeaderText="Transaction Date" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="ConfirmationDate" HeaderText="Confirmation Date" HtmlEncode="false" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:TemplateField HeaderText="Is Order Confirm">
                            <ItemTemplate>
                                <asp:Label Font-Size="Medium" runat="server" Text='<%# Convert.ToBoolean(Eval("IsConfirm")) == false ? "<font color=red>No</font>" : "<font color=green>Yes</font>" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Net Total" />
                        <asp:TemplateField HeaderText="Is Order Confirm">
                            <ItemTemplate>
                                <asp:Button ID="btnConfirm" Text="Confirm" Visible='<%# Convert.ToBoolean(Eval("IsConfirm")) == false ? true : false %>' ToolTip="To confirm the order" runat="server" CommandArgument='<%# Eval("TransactionId") %>' CommandName="Confirm" OnClick="btnConfirm_Click" />
                                &nbsp;&nbsp;
                                <asp:Button ID="btnReject" Text="Reject" ToolTip="To reject the order" runat="server" CommandArgument='<%# Eval("TransactionId") %>' CommandName="Reject" OnClick="btnConfirm_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "../../Images/minus.png");
        });
        $("[src*=minus]").live("click", function () {
            $(this).attr("src", "../../Images/plus.png");
            $(this).closest("tr").next().remove();
        });
    </script>
</asp:Content>
