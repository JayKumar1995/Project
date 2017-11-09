<%@ Page Title="" Language="C#" MasterPageFile="~/ComplianceMaster.Master" AutoEventWireup="true" CodeBehind="ListLecturer.aspx.cs" Inherits="OnlineBidding.ListLecturer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ListView ID="lstLecturers" runat="server" ItemPlaceholderID="groupPlaceHolder1" OnItemDeleting="lstStudents_ItemDeleting" OnItemCommand="lstStudents_ItemCommand" OnPagePropertiesChanging="lstStudents_PagePropertiesChanging" >
        <LayoutTemplate>
            <section class="content">
                <div class="row">
                    <div class="col-xs-12" style="width:84%">
                        <div class="box" style="margin-left:220px;">
                            <div class="box-header">
                                <h3 class="box-title">Lecturer</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <table id="example2" class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Username</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Address</th>
                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                            <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                        
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="6">
                                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lstLecturers" PageSize="10">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                                            ShowNextPageButton="false" />
                                                        <asp:NumericPagerField ButtonType="Link" />
                                                        <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>

                            </div>
                            <!-- /.box-body -->
                        </div>
                    </div>
                </div>
            </section>
        </LayoutTemplate>

        <ItemTemplate>
            <tr>
            <td><%# Eval("Username") %></td>
            <td><%# Eval("Name") %></td>
            <td><%# Eval("Email") %></td>
            <td><%# Eval("Address") %></td>
                </tr>
        </ItemTemplate>


    </asp:ListView>
</asp:Content>
