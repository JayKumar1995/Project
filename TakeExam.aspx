<%@ Page Title="" Language="C#" MasterPageFile="~/ComplianceMaster.Master" AutoEventWireup="true" CodeBehind="TakeExam.aspx.cs" Inherits="OnlineBidding.TakeExam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>Questionnaire Management
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i>Dashboard</a></li>
                    <li><a href="#">Exam</a></li>
                    <li class="active">Take Exam</li>
                </ol>
            </section>

            <!-- General Info -->
            <section class="content">

                <!-- SELECT2 EXAMPLE -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">General Info</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div>
                    </div>
                    <div class="box-header with-border">
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-6" style="width: 100%;">
                                <asp:ListView ID="lstQuestionnaire" runat="server" ItemPlaceholderID="groupPlaceHolder1" OnItemCommand="lstQuestionnaire_ItemCommand" OnPagePropertiesChanging="lstQuestionnaire_PagePropertiesChanging">
                                    <LayoutTemplate>
                                        <section class="content">
                                            <div class="row">
                                                <div class="col-xs-12">
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
                                                                        <th>Questions</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>

                                                                </tbody>
                                                                <tfoot>
                                                                    <tr>
                                                                        <td colspan="6">
                                                                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lstQuestionnaire" PageSize="10">
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
                                            <td><%# Eval("QuestionnaireID") %></td>
                                            <td><%# Eval("Name") %></td>
                                            <td><%# Eval("Subject") %></td>
                                            <td><%# Eval("CreatedBy") %></td>
                                            <td><%# Eval("CreatedOn") %></td>
                                            <td>
                                                <asp:LinkButton runat="server" ID="lnkView" CssClass="fa fa-plus-circle" CommandArgument='<%# Eval("QuestionnaireID") %>' ToolTip="View Exam" CommandName="View"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>


                                </asp:ListView>
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.box-body -->

                </div>
                <!-- /.box -->


            </section>
            <!-- /.content -->
            <!-- General Info -->

            <!-- /.content -->
        </div>

    </div>
</asp:Content>
