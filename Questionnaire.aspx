<%@ Page Title="" Language="C#" MasterPageFile="~/ComplianceMaster.Master" AutoEventWireup="true" CodeBehind="Questionnaire.aspx.cs" Inherits="OnlineBidding.Questionnaire" %>

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
                    <li><a href="#">Questionnaire</a></li>
                    <li class="active">Manage Questionnaire</li>
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
                            <asp:Panel ID="Panel1" runat="server">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Select Subject*</label>
                                        <asp:DropDownList runat="server" ID="ddlSubjects" CssClass="form-control">
                                            <asp:ListItem>Physics</asp:ListItem>
                                            <asp:ListItem>Chemistry</asp:ListItem>
                                            <asp:ListItem>Biology</asp:ListItem>
                                            <asp:ListItem>Science</asp:ListItem>
                                            <asp:ListItem>History</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                </div>
                                <!-- /.col -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Questionnaire Title*</label>
                                        <asp:TextBox runat="server" ID="txtQuestionnaireTitle" CssClass="form-control" placeholder="Add Questionnaire" required></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.col -->



                                <div class="col-md-6">
                                    <label></label>
                                    <div class="form-group">
                                        <asp:Button runat="server" ID="btnAddQuestionnaire" Text="Add Questionnaire" CssClass="btn btn-block btn-success" OnClick="btnAddQuestionnaire_Click" />
                                    </div>
                                </div>
                            </asp:Panel>
                            <div class="col-md-6" style="width: 100%;">
                                <asp:ListView ID="lstQuestionnaire" runat="server" OnItemDeleting="lstQuestionnaire_ItemDeleting" ItemPlaceholderID="groupPlaceHolder1" OnItemCommand="lstQuestionnaire_ItemCommand" OnPagePropertiesChanging="lstQuestionnaire_PagePropertiesChanging">
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
                                                <asp:LinkButton runat="server" ID="lnkView" CssClass="fa fa-plus-circle" CommandArgument='<%# Eval("QuestionnaireID") %>' ToolTip="Add Question Answers" CommandName="Add"></asp:LinkButton>
                                                <asp:LinkButton runat="server" ID="lnkDelete" CssClass="fa fa-times" OnClientClick="javascript:return confirm('Are you sure you want to delete this Questionnaire ?');" CommandArgument='<%# Eval("QuestionnaireID") %>' ToolTip="Delete Questionnaire" CommandName="Delete"></asp:LinkButton>
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
