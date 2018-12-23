<%@ Page Title="" Language="C#" MasterPageFile="~/Apps/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="EcommGroceryStore.Apps.Admin.ManageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">    
    <div class="innerContent">
        <table id="tblSenderId" class="table table-bordered table-hover" style="width: 100%;">
            <thead>
                <tr>
                    <th>User Name</th>
                    <th>Password</th>
                    <th>Status</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email Address</th>
                    <th>Mobile Number</th>
                    <th>Alt. Number</th>
                    <th>Date of Registration</th>
                    <th>Role</th>
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
        $(document).ready(function myfunction() {
            BindUserList();
        });

        function BindUserList() {
            var oTbl = $("#tblSenderId").dataTable({
                bProcessing: true,
                bServerSide: true,
                bSort: true,
                "bJQueryUI": false,
                "bScrollCollapse": true,
                "sPaginationType": "full_numbers",
                "aaSorting": [[0, 'asc']],
                sAjaxSource: '<%= ResolveClientUrl("~/Apps/Admin/Handlers/GetUserListHandler.ashx")%>',
                sServerMethod: 'POST',
                fnServerParams: function (aoData) {
                    aoData.push({ name: '___UserList___', value: 'get' });
                },
                fnDrawCallback: function (oSettings) {
                    $('.inactive-customer').bind('click', function () {
                        var $this = $(this);
                        var oldSrc = $(this).attr('src');
                        var id_ = $(this).attr('data');
                        if (confirm("Do you really want to Inactive this user?")) {
                            //$(this).attr({ src: '/Images/website/progress.gif' });
                            $.post('<%= ResolveClientUrl("~/Apps/Admin/Handlers/GetUserListHandler.ashx")%>', { id: id_, '___UserList___': 'inactive' }, function (data, status) {
                                $this.attr({ src: oldSrc });
                                if (status == 'success') {
                                    alert(data.text);
                                    oTbl.fnDraw();
                                }
                            });
                        }
                    });

                    $('.active-customer').bind('click', function () {
                        var $this = $(this);
                        var oldSrc = $(this).attr('src');
                        var id_ = $(this).attr('data');
                        if (confirm("Do you want to active this user?")) {
                            //$(this).attr({ src: '/Images/website/progress.gif' });
                            $.post('<%= ResolveClientUrl("~/Apps/Admin/Handlers/GetUserListHandler.ashx")%>', { id: id_, '___UserList___': 'active' }, function (data, status) {
                                $this.attr({ src: oldSrc });
                                if (status == 'success') {
                                    alert(data.text);
                                    oTbl.fnDraw();
                                }
                            });
                        }
                    });

                    $('.delete-customer').bind('click', function () {
                        var $this = $(this);
                        var oldSrc = $(this).attr('src');
                        var id_ = $(this).attr('data');
                        if (confirm("Do you really want to delete this user?")) {
                            //$(this).attr({ src: '/Images/website/progress.gif' });
                            $.post('<%= ResolveClientUrl("~/Apps/Admin/Handlers/GetUserListHandler.ashx")%>', { id: id_, '___UserList___': 'delete' }, function (data, status) {
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
                    { sType: 'string', mData: 'UserName', bSortable: false, bSearchable: false },
                    { sType: 'string', mData: 'Password', bsortable: false, bSearchable: false, },
                    {
                        sType: 'bool', mData: 'Status', bsortable: false, "width": "10%", bSearchable: false, mRender: function (data, type, row) {
                            if (data)
                                return "Active &nbsp;&nbsp;<a style=\"font-size: 16px;\" data=\"" + row["UserId"] + "\" class=\"site-table-icon inactive-customer\" href=\"javascript:void(0)\" title=\"Make InActive\" ><i class=\"fa fa-times\" aria-hidden=\"true\"></i></a>";
                            else
                                return "InActive &nbsp;&nbsp;<a style=\"font-size: 16px;\" data=\"" + row["UserId"] + "\" class=\"site-table-icon active-customer\" href=\"javascript:void(0)\" title=\"Make Active\" ><i class=\"fa fa-check\" aria-hidden=\"true\"></i></a>";
                        }
                    },
                    { sType: 'string', mData: 'FirstName', bsortable: false, bSearchable: false },
                    { sType: 'string', mData: 'LastName', bsortable: false, bSearchable: false },
                    { sType: 'string', mData: 'EmailId', bsortable: false, bSearchable: false },
                    { sType: 'string', mData: 'MobileNumber', bsortable: false, bSearchable: false },
                    { sType: 'string', mData: 'AlternateNumber', bsortable: false, bSearchable: false },
                    { sType: 'string', mData: 'RegistrationDate', bsortable: false, bSearchable: false },
                    { sType: 'string', mData: 'RoleName', bsortable: false, bSearchable: false },
                    {
                        mData: "UserId",
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

                var actionsTemplate = '<a style="font-size: 16px;" href="javascript:void(0)" class="site-table-icon delete-customer" data="{{data}}" title="Delete"><i class="fa fa-trash-o"></i></a>';
                //underscore template function is used to precompile this template so that we can easily and efficiently
                //use it wherever we need later
                var compiledTemplate = _.template(actionsTemplate);

    </script>
</asp:Content>
