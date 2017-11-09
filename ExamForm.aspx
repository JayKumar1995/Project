<%@ Page Title="" Language="C#" MasterPageFile="~/ComplianceMaster.Master" AutoEventWireup="true" CodeBehind="ExamForm.aspx.cs" Inherits="OnlineBidding.ExamForm" %>

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
                        <h3 class="box-title">Questions</h3>

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
                                        <label>Question*</label><br />
                                        <asp:Label runat="server" ID="lblQuestionTitle"></asp:Label>
                                        <span class="pull-right">
                                            <asp:Label runat="server" ID="lblTime"></asp:Label>
                                        </span>
                                        <hr />
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label></label>
                                        <asp:RadioButton runat="server" ID="radAnswer1" GroupName="questiongrp" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label></label>
                                        <asp:RadioButton runat="server" ID="radAnswer2" GroupName="questiongrp" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label></label>
                                        <asp:RadioButton runat="server" ID="radAnswer3" GroupName="questiongrp" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label></label>
                                        <asp:RadioButton runat="server" ID="radAnswer4" GroupName="questiongrp" />
                                        <hr />
                                    </div>
                                </div>
                                <!-- /.col -->

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Reward Points</label><br />
                                        <asp:Label runat="server" ID="lblRewardPoint"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-4 pull-right">
                                    <label></label>
                                    <div class="form-group">
                                        <asp:Button runat="server" ID="btnFinishExam" Text="Finish Exam" CssClass="btn btn-block btn-success" Visible="false" OnClick="btnFinishExam_Click" />
                                    </div>
                                </div>
                                <div class="col-md-4 pull-right">
                                    <label></label>
                                    <div class="form-group">

                                        <asp:Button runat="server" ID="btnNext" Text="Next" CssClass="btn btn-block btn-danger" OnClick="btnNext_Click" />
                                    </div>
                                </div>
                                <div class="col-md-4 pull-right">
                                    <label></label>
                                    <div class="form-group">
                                        <asp:Button runat="server" ID="btnPrevious" Text="Previous" CssClass="btn btn-block btn-success" OnClick="btnPrevious_Click" />
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
    <div class="modal" id="myModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Exam Time Up</h5>
                    
                </div>
                <div class="modal-body">
                    <p>Your session for the exam is over.Click below button to check the results.</p>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" ID="btnCheckResults" Text="Check Results" CssClass="btn btn-primary" OnClick="btnCheckResults_Click" />
                    
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="hidTimeValue" />
    <asp:HiddenField runat="server" ID="hidSelectedAnswer" />
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            
            $("input[type='radio']").change(function () {
                var selectedVal = $("input[type='radio']:checked").attr('value');
                document.getElementById('ctl00_ContentPlaceHolder1_hidSelectedAnswer').value = selectedVal;
            });
        });

        // Set the date we're counting down to
        var countDownDate = new Date(+document.getElementById('ctl00_ContentPlaceHolder1_hidTimeValue').value);

        // Update the count down every 1 second
        var x = setInterval(function () {

            // Get todays date and time
            var now = new Date().getTime();

            // Find the distance between now an the count down date
            var distance = countDownDate - now;

            // Time calculations for days, hours, minutes and seconds
            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);

            // Output the result in an element with id="demo"
            document.getElementById("ctl00_ContentPlaceHolder1_lblTime").innerHTML = minutes + "m " + seconds + "s ";

            // If the count down is over, write some text 
            if (distance < 0) {
                clearInterval(x);
                document.getElementById("ctl00_ContentPlaceHolder1_lblTime").innerHTML = "Time Up";
                $('#myModal').modal({
                    backdrop: 'static'
                });
            }
        }, 1000);
    </script>
</asp:Content>
