<%@ Page Title="" Language="C#" MasterPageFile="~/ComplianceMaster.Master" AutoEventWireup="true" CodeBehind="ExamResult.aspx.cs" Inherits="OnlineBidding.ExamResult" %>
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
                    <li class="active">Result</li>
                </ol>
            </section>

            <!-- General Info -->
            <section class="content">

                <!-- SELECT2 EXAMPLE -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Questionnaire Result</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i>
                                    <asp:Label runat="server" ID="lblQuestionSeq"></asp:Label></i></button>
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
                                        <label>You Scored</label><br />
                                        <asp:Label runat="server" ID="lblQuestionTitle"></asp:Label>
                                        <span class="pull-right">
                                            <asp:Label runat="server" ID="lblTime"></asp:Label>
                                        </span>
                                        <hr />
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group" style="text-align:center;">
                                        <label><asp:Label runat="server" ID="lblScore" style="font-size:xx-large;"></asp:Label><asp:Label runat="server" ID="lblTotal" style="font-size:-webkit-xxx-large;"></asp:Label> </label>
                                        
                                    </div>
                                </div>

                                <div class="col-md-4 ">
                                    <label>Correct Answers :</label>&nbsp;<asp:Label ID="lblCorrectAnswer" runat="server" Text="lblCorrectAnswer"></asp:Label>
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <label>Incorrect Answers : </label>&nbsp;<asp:Label ID="lblIncorrectAnswer" runat="server" Text="lblIncorrectAnswer"></asp:Label>
                                    <div class="form-group">

                                    </div>
                                </div>
                                <div class="col-md-4 pull-right">
                                    <label>Result Percentage : </label>&nbsp;<asp:Label ID="lblPercentage" runat="server" Text=""></asp:Label>
                                    <div class="form-group">
                                    </div>
                                </div>


                            </asp:Panel>

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
