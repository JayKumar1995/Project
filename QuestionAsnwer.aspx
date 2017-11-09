<%@ Page Title="" Language="C#" MasterPageFile="~/ComplianceMaster.Master" AutoEventWireup="true" CodeBehind="QuestionAsnwer.aspx.cs" Inherits="OnlineBidding.QuestionAsnwer" %>
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
                    <li class="active">Add Question</li>
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
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Question*</label>
                                        <asp:TextBox runat="server" ID="txtQuestionTitle" CssClass="form-control" placeholder="Add Questionnaire" required></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Answer 1*</label>
                                        <asp:TextBox runat="server" ID="txtAnswer1" CssClass="form-control" placeholder="Add Questionnaire" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Answer 2*</label>
                                        <asp:TextBox runat="server" ID="txtAnswer2" CssClass="form-control" placeholder="Add Questionnaire" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Answer 3*</label>
                                        <asp:TextBox runat="server" ID="txtAnswer3" CssClass="form-control" placeholder="Add Questionnaire" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Answer 4</label>
                                        <asp:TextBox runat="server" ID="txtAnswer4" CssClass="form-control" placeholder="Add Questionnaire" required></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Choose correct answer*</label>
                                        <asp:DropDownList runat="server" ID="ddlCorrectAnswer" CssClass="form-control">
                                            <asp:ListItem>Answer 1</asp:ListItem>
                                            <asp:ListItem>Answer 2</asp:ListItem>
                                            <asp:ListItem>Answer 3</asp:ListItem>
                                            <asp:ListItem>Answer 4</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                </div>
                                <!-- /.col -->

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Reward Points</label>
                                        <asp:TextBox runat="server" ID="txtRewardPoint" CssClass="form-control" placeholder="Add Questionnaire" required></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label></label>
                                    <div class="form-group">
                                        <asp:Button runat="server" ID="btnAddQA" Text="Add QA" CssClass="btn btn-block btn-success" OnClick="btnAddQA_Click" />
                                    </div>
                                </div>
                            </asp:Panel>
                            <div class="col-md-6" style="width: 100%;">
                                <asp:ListView ID="lstQuestionnaire" runat="server" ItemPlaceholderID="groupPlaceHolder1" OnItemEditing="lstQuestionnaire_ItemEditing" OnItemCommand="lstQuestionnaire_ItemCommand" OnPagePropertiesChanging="lstQuestionnaire_PagePropertiesChanging" >
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
                                                                        <th>Question</th>
                                                                        <th>Answer 1</th>
                                                                        <th>Answer 2</th>
                                                                        <th>Answer 3</th>
                                                                        <th>Answer 4</th>
                                                                        <th>Reward Points</th>
                                                                        <th>Action</th>
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
                                            <td><%# Eval("Question1") %></td>
                                            <td><%# Eval("AnswerOne") %></td>
                                            <td><%# Eval("AnswerTwo") %></td>
                                            <td><%# Eval("AnswerThree") %></td>
                                            <td><%# Eval("AnswerFour") %></td>
                                            <td><%# Eval("Reward") %></td>
                                            <td>
                                                <asp:LinkButton runat="server" ID="lnkEdit" CssClass="fa fa-plus-circle" CommandArgument='<%# Eval("QuestionID") %>' ToolTip="Edit" CommandName="Edit"></asp:LinkButton>
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
