<%@ Page Title="" Language="C#" MasterPageFile="~/Apps/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageProductList.aspx.cs" Inherits="EcommGroceryStore.Apps.Admin.ManageProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="innerContent">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div>
                    <table>
                        <tr>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlMain" AutoPostBack="true" OnSelectedIndexChanged="ddlMain_SelectedIndexChanged" onChange="MainCall('m')">
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlSub" onChange="MainCall('s')">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <table id="tblSenderId" class="table table-bordered table-hover" style="width: 100%;">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Main Category</th>
                    <th>Sub Category</th>
                    <th>Quantity</th>
                    <th>Description</th>
                    <th>Price Per Unit</th>
                    <th>Unit</th>
                    <th>Status</th>
                    <th>ImageURL</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <link rel="stylesheet" type="text/css" href="../../Content/DataTables/responsive.dataTables.min.css?1=1" />
    <link href="../../Content/DataTables/dataTables.bootstrap.css?1=1" rel="stylesheet" />
    <script type="text/javascript" src="../../Content/DataTables/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../../Content/DataTables/dataTables.bootstrap.min.js"> </script>
    <script type="text/javascript" src="../../Content/DataTables/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="../../Content/DataTables/underscore.js"></script>
    <script type="text/javascript">

        var mCatId = 0;
        var sCatId = 0;
        function MainCall(dropdowncall) {
            var me = document.getElementById("<%= ddlMain.ClientID %>");
            mCatId = me.options[me.selectedIndex].value;

            var se = document.getElementById("<%= ddlSub.ClientID %>");
            sCatId = se.options[se.selectedIndex].value;

            if (dropdowncall == 'm') {
                sCatId = 0;
            }

            var table = $("#tblSenderId").dataTable();
            table.fnClearTable(this);
            $.post('<%= ResolveClientUrl("~/Apps/Admin/Handlers/GetProductListHandler.ashx")%>', { name: '___ProductList___', value: 'get' }, { name: 'mCatId', value: mCatId }, { name: 'sCatId', value: sCatId }, function (data, status) {
                table.fnDraw();
            });
        }

        $(document).ready(function myfunction() {
            BindProductList();
        });

        function BindProductList() {
            var oTbl = $("#tblSenderId").dataTable({
                bProcessing: true,
                bServerSide: true,
                bSort: true,
                "bJQueryUI": false,
                "bScrollCollapse": true,
                "sPaginationType": "full_numbers",
                "aaSorting": [[0, 'asc']],
                "iDisplayStart": 0,
                sAjaxSource: '<%= ResolveClientUrl("~/Apps/Admin/Handlers/GetProductListHandler.ashx")%>',
                sServerMethod: 'POST',
                fnServerParams: function (aoData) {
                    aoData.push({ name: '___ProductList___', value: 'get' }, { name: 'mCatId', value: mCatId }, { name: 'sCatId', value: sCatId });
                },
                fnDrawCallback: function (oSettings) {
                    $('.inactive-product').bind('click', function () {
                        var $this = $(this);
                        var oldSrc = $(this).attr('src');
                        var id_ = $(this).attr('data');
                        if (confirm("Do you really want to inactive this product?")) {
                            //$(this).attr({ src: '/Images/website/progress.gif' });
                            $.post('<%= ResolveClientUrl("~/Apps/Admin/Handlers/GetProductListHandler.ashx")%>', { id: id_, '___ProductList___': 'inactive' }, function (data, status) {
                                $this.attr({ src: oldSrc });
                                if (status == 'success') {
                                    alert(data.text);
                                    oTbl.fnDraw();
                                }
                            });
                        }
                    });

                    $('.active-product').bind('click', function () {
                        var $this = $(this);
                        var oldSrc = $(this).attr('src');
                        var id_ = $(this).attr('data');
                        if (confirm("Do you want to active this product?")) {
                            //$(this).attr({ src: '/Images/website/progress.gif' });
                            $.post('<%= ResolveClientUrl("~/Apps/Admin/Handlers/GetProductListHandler.ashx")%>', { id: id_, '___ProductList___': 'active' }, function (data, status) {
                                $this.attr({ src: oldSrc });
                                if (status == 'success') {
                                    alert(data.text);
                                    oTbl.fnDraw();
                                }
                            });
                        }
                    });

                    $('.delete-product').bind('click', function () {
                        var $this = $(this);
                        var oldSrc = $(this).attr('src');
                        var id_ = $(this).attr('data');
                        if (confirm("Do you really want to delete this product?")) {
                            //$(this).attr({ src: '/Images/website/progress.gif' });
                            $.post('<%= ResolveClientUrl("~/Apps/Admin/Handlers/GetProductListHandler.ashx")%>', { id: id_, '___ProductList___': 'delete' }, function (data, status) {
                                $this.attr({ src: oldSrc });
                                if (status == 'success') {
                                    alert(data.text);
                                    oTbl.fnDraw();
                                }
                            });
                        }
                    });
                },
                aoColumns: [
                    { sType: 'string', mData: 'ProductName', bSortable: false, bSearchable: false },
                    { sType: 'string', mData: 'MainCategoryName', bsortable: false, bSearchable: false, },
                    { sType: 'string', mData: 'SubCategoryName', bsortable: false, bSearchable: false },
                    { sType: 'string', mData: 'Quantity', bsortable: false, bSearchable: false },
                    { sType: 'string', mData: 'Description', bsortable: false, bSearchable: false },
                    { sType: 'string', mData: 'PricePerUnit', bsortable: false, bSearchable: false },
                    { sType: 'string', mData: 'Unit', bsortable: false, bSearchable: false },
                    {
                        sType: 'bool', mData: 'Status', bsortable: false, "width": "10%", bSearchable: false, mRender: function (data, type, row) {
                            if (data)
                                return "Active &nbsp;&nbsp;<a style=\"font-size: 16px;\" data=\"" + row["ProductId"] + "\" class=\"site-table-icon inactive-product\" href=\"javascript:void(0)\" title=\"Make InActive\" ><i class=\"fa fa-times\" aria-hidden=\"true\"></i></a>";
                            else
                                return "InActive &nbsp;&nbsp;<a style=\"font-size: 16px;\" data=\"" + row["ProductId"] + "\" class=\"site-table-icon active-product\" href=\"javascript:void(0)\" title=\"Make Active\" ><i class=\"fa fa-check\" aria-hidden=\"true\"></i></a>";
                        }
                    },
                    {
                        sType: 'string', mData: 'ImageURL', bsortable: false, bSearchable: false, mRender: function (data, type, row) {
                            var path = "http://" + location.host + "/" + data;
                            return "<img src=\"" + path + "\" title=\"" + row["Description"] + "\" width=\"50\" height=\"50\" />";

                        }
                    },
                    {
                        mData: "ProductId",
                        bSortable: false,
                        width: '100px',
                        mRender: function (data, type, row) {
                            return compiledTemplate({ data: data, path: '<%= ResolveClientUrl("~/Images/website") %>', row: row });
                        }
                    }
                ]
            });
                }

                //i usually like mushtache like template syntax so change the interpolate regex 
                //if you want some other flavour
                _.templateSettings = {
                    interpolate: /\{\{(.+?)\}\}/g
                };

                ////define custom template to show actions (Edit|Delete Icons)
                ////you can load this template from external source too
                //var actionsTemplate = "<a style=\"font-size: 18px;\" href=\"javascript:void(0)\" onClick=\"SetSenderIdDetails({{row[\"SenderUserId\"]}},'{{row[\"SenderId\"]}}','{{row[\"Purpose\"]}}',{{row[\"SenderIdType\"]}});\" class=\"site-table-icon edit-customer\" data=\"{{data}}\" title=\"Edit\"><i class=\"fa fa-pencil-square-o\"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;"
                //                    + '<a style="font-size: 18px;" href="javascript:void(0)" class="site-table-icon delete-customer" data="{{data}}" title="Delete"><i class="fa fa-trash-o"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;';

                var actionsTemplate = '<a style="font-size: 16px;" href="javascript:void(0)" class="site-table-icon delete-product" data="{{data}}" title="Delete"><i class="fa fa-trash-o"></i></a>';
                //underscore template function is used to precompile this template so that we can easily and efficiently
                //use it wherever we need later
                var compiledTemplate = _.template(actionsTemplate);

    </script>
</asp:Content>
