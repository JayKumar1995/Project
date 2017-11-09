<%@ Page Title="" Language="C#" MasterPageFile="~/ComplianceMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OnlineBidding.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ListView ID="lstQuestionnaire" runat="server" ItemPlaceholderID="groupPlaceHolder1" OnItemCommand="lstQuestionnaire_ItemCommand">
                                    <LayoutTemplate>
                                        <section class="content">
                                            <div class="row">
                                                <div class="col-xs-10" style="margin-left:232px;">
                                                    <div class="box">
                                                        <div class="box-header">
                                                            <h3 class="box-title">Questionnaire</h3>
                                                        </div>
                                                        <!-- /.box-header -->
                                                        <div class="box-body">
                                                            <table id="example2" class="table table-bordered table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Questionnaire ID</th>
                                                                        <th>Title</th>
                                                                        <th>Subject</th>
                                                                        <th>Created By</th>
                                                                        <th>Created Date</th>
                                                                        
                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>

                                                                </tbody>
                                                                <tfoot>
                                                                    <tr>
                                                                        <td colspan="6">
                                                                            <asp:LinkButton runat="server" ID="viewAllBtn" Text="View All" PostBackUrl="~/Questionnaire.aspx"></asp:LinkButton>
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
                                            <td><%# Eval("QuestionnaireID") %></td>
                                            <td><%# Eval("Name") %></td>
                                            <td><%# Eval("Subject") %></td>
                                            <td><%# Eval("CreatedBy") %></td>
                                            <td><%# Eval("CreatedOn") %></td>
                                            <%--<td>
                                                <asp:LinkButton runat="server" ID="lnkView" CssClass="fa fa-plus-circle" CommandArgument='<%# Eval("QuestionnaireID") %>' ToolTip="View Exam" CommandName="View"></asp:LinkButton>
                                            </td>--%>
                                        </tr>
                                    </ItemTemplate>


                                </asp:ListView>
</asp:Content>
