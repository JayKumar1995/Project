<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineBidding.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <title>Online Examination Registration</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <!--<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css" /> -->
</head>
<body class="hold-transition skin-blue sidebar-mini" >
    <div>
        <form id="form1" runat="server">
            <div class="content-wrapper" style="margin-left:0px;">
                <section class="content">
                    <div class="row" style="margin-top:50px;">
                        <div class="col-lg-6 col-lg-offset-3 ">
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Online Examination Registration</h3>
                                </div>
                                <!-- /.box-header -->

                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="txtName" class="col-lg-2 control-label">Name</label>

                                        <div class="col-lg-10 form-group">
                                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Name" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-lg-2 control-label">Username</label>

                                        <div class="col-lg-10 form-group">
                                            <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" placeholder="Username" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-lg-2 control-label">Email</label>

                                        <div class="col-lg-10 form-group">
                                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="Email" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPhone" class="col-lg-2 control-label">Phone</label>

                                        <div class="col-lg-10 form-group">
                                            <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control" placeholder="Phone" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPhone" class="col-lg-2 control-label">Address</label>

                                        <div class="col-lg-10 form-group">
                                            <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" placeholder="Address" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-lg-2 control-label">Password</label>

                                        <div class="col-lg-10 form-group">
                                            <asp:TextBox runat="server" TextMode="Password" ID="txtPassword" pattern=".{8,}" required title="(8 chars minimum)" CssClass="form-control" placeholder="Password"></asp:TextBox>
                                        </div>
                                    </div>
                                   
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-lg-2 control-label">Confirm Password</label>

                                            <div class="col-lg-10 form-group">
                                                <asp:TextBox runat="server"  TextMode="Password" pattern=".{8,}" required title="(8 chars minimum)" ID="txtConfirmPassword" CssClass="form-control" placeholder="Repeat Password"></asp:TextBox>
                                            </div>
                                        </div>
                                   
                                    <div class="form-group">
                                        <label for="ddlUserType" class="col-lg-2 control-label">UserType</label>

                                        <div class="col-lg-10">
                                            <asp:DropDownList runat="server" ID="ddlUserType" CssClass="form-control">
                                                <asp:ListItem>Admin</asp:ListItem>
                                                <asp:ListItem>Lecturer</asp:ListItem>
                                                <asp:ListItem>Student</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <!-- /.box-body -->
                                <div class="box-footer">
                                    <a href="Login.aspx">Sign In</a>
                                    <asp:Button Visible="false" runat="server" ID="btnSignin" CssClass="btn btn-default" Text="Sign In" OnClick="btnSignin_Click" />
                                    <asp:Button runat="server" ID="btnSignUp" CssClass="btn btn-info pull-right" Text="Sign Up" OnClick="btnSignUp_Click" />
                                </div>
                                <!-- /.box-footer -->
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </form>
    </div>
</body>
    <script type="text/javascript">
        $('input[type=text]').focus(function () {
            $('#btnSignUp').click();
        });

        var password = document.getElementById("txtPassword")
        var confirm_password = document.getElementById("txtConfirmPassword");

        function validatePassword() {
            if (password.value != confirm_password.value) {
                confirm_password.setCustomValidity("Passwords Don't Match");
            } else {
                confirm_password.setCustomValidity('');
            }
        }

        password.onchange = validatePassword;
        confirm_password.onkeyup = validatePassword;


</script>
</html>
