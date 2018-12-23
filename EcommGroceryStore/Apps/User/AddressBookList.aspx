<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSabji.Master" AutoEventWireup="true" CodeBehind="AddressBookList.aspx.cs" Inherits="EcommGroceryStore.Apps.User.AddressBookList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .card-block {
            border: 0 none;
            border-radius: 2px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.23), 0 3px 10px rgba(0, 0, 0, 0.16);
            margin-bottom: 20px;
        }

            .card-block .top-title {
                background-color: #f9f9f9;
                box-shadow: 0 3px 5px rgba(0, 0, 0, 0.23), 0 3px 5px rgba(0, 0, 0, 0.16);
                color: #000;
                font-weight: 700;
                padding: 10px;
                text-align: center;
            }

            .card-block .info {
                padding: 10px;
            }
    </style>
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
                    <h1>Address Book List</h1>
                </div>
                <div class="col2-set">
                    <div class="content">
                        <asp:Repeater runat="server" ID="rptAddress">
                            <ItemTemplate>
                                <div class="col-sm-3 col-xs-12">
                                    <div class="card-block bg-white">
                                        <div class="top-title">
                                            <%#Eval("AddressType") %>
                                        </div>
                                        <div class="info">
                                            <p><strong><%#Eval("FullName") %></strong></p>
                                            <div>
                                                <%#Eval("Address") %>,                                              
                                            </div>
                                            <div>
                                                <%#Eval("Landmark") %>
                                            </div>
                                            <div>
                                                <%#Eval("Direction") %>
                                            </div>
                                            <div>
                                                <%#Eval("AreaName") %> - <%#Eval("Pincode") %>
                                            </div>
                                            <div>
                                                <%#Eval("CityName") %> Gujarat <%#Eval("CountryName") %>
                                            </div>
                                            <br />
                                            <div class="buttons">
                                                <a href="AddAddress.aspx?id=<%#Eval("AddressId") %>">Edit
                                                </a>
                                                &nbsp;&nbsp;&nbsp;
                                              <asp:LinkButton Text="Delete" ID="lnkDelete" OnClick="lnkDelete_Click" CommandArgument='<%#Eval("AddressId") %>' runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

            </div>
        </div>
        <div class="col2-set">
            <div class="col-1 new-users">
                <div class="buttons-set">
                    <button type="submit" class="button" title="Create a new address" name="Add Address"
                        runat="server" onserverclick="LogIn_ServerClick" id="LogIn">
                        <span><span>Add New Address</span></span></button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
