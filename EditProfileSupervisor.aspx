<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditProfileSupervisor.aspx.cs" Inherits="EditProfileSupervisor" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>testingtutor</title>
    <link rel="icon" type="image/png" sizes="66x65" href="../assets/img/favicon.png">
    <link rel="icon" type="image/png" sizes="66x65" href="../assets/img/favicon.png">
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/fonts/material-icons.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=PT+Mono&amp;subset=latin-ext">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono:500,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
    <link rel="stylesheet" href="https://unpkg.com/@bootstrapstudio/bootstrap-better-nav/dist/bootstrap-better-nav.min.css">
    <link rel="stylesheet" href="../assets/css/styles.css">
    <link rel="stylesheet" href="../assets/css/supervisor.css">
    <link rel="stylesheet" href="../codemirror/lib/codemirror.css">
    <link rel="stylesheet" href="../codemirror/theme/monokai.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

    <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>-->
    <script src="../assets/js/jquery.min.js"></script>

    <script>
        $(function () {
            var progressbar = $("#progressbar"),
                progressLabel = $(".progress-label");

            progressbar.progressbar({
                value: false,
                change: function () {
                    progressLabel.text(progressbar.progressbar("value") + "%");
                },
                complete: function () {
                    progressLabel.text("Complete!");
                }
            });

            function progress() {
                var val = progressbar.progressbar("value") || 0;

                progressbar.progressbar("value", val + 2);

                if (val < 99) {
                    setTimeout(progress, 60);
                }
            }

            setTimeout(progress, 2000);

            $("#progressbar").progressbar({
                complete: function () {
                    $('#feedbackScores').show();
                    $('#progressbar').hide();
                }
            });

        $(document).ready(function () {

            $('[data-toggle="tooltip"]').tooltip()
            $('.fillers, .password').focus(function () {
                $(this).css({
                    "background": "white",
                    "border-left": "2px solid grey",
                    "box-shadow": "0 0 11px rgba(33,33,33,.2)"
                });
            });
            $('.fillers, .password').blur(function () {
                $(this).css({
                    "background": "#e7e9eb",
                    "border-left": "none",
                    "box-shadow": "none"
                });
            });
            $('.fillers').change(function () {
                $("#btnSaveProfile").removeClass("greyBtn").addClass("btnGold");
            });
            $('.password').change(function () {
                $("#btnPasswordChange").removeClass("greyBtn").addClass('btnGold');
            });
        });
        $(window).on("load", function () {
            $('.newsFlash').fadeIn();

            $('#gotIt').click(function () {
                $('.newsFlash').fadeOut();
            });
        });

    </script>

</head>

<body>
    <nav class="navbar navbar-light navbar-expand-lg clean-navbar">
        <div class="container-fluid"><a class="navbar-brand logo" href="Home.aspx"><img class="img-fluid" id="logoTagline" style="height: 33px;" src="../assets/img/logo_tagline.png"><img src="../assets/img/logo.png" height="33" id="logo"></a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" style="color: #F0B65F;" href="IndexSupervisor.aspx">myDashboard</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" style="color: #414141;" data-toggle="modal" data-target="#signout" href="#">Signout<i class="material-icons icons">arrow_forward</i>

                            <div class="modal fade" role="dialog" tabindex="-1" id="signout">
                                <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-body text-center disabled">
                                            <p style="margin-top: 34px;">Are you sure you want to signout?</p>
                                        </div>
                                        <div class="modal-footer d-xl-flex justify-content-xl-end"><a class="btn btn-light btn-sm" role="button" data-dismiss="modal" area-label="Close">No</a>
                                            <a class="btn btn-success btn-sm" role="button" href="Logout.aspx">Yes</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>

                    </li>
                </ul>
            </div>
        </div>
    </nav><hr>

<div class="ml-5 backToDashboard">
                <a href="indexSupervisor.aspx"><i class="material-icons icons">chevron_left</i>Go back to <span><u>myDashboard</u></span></a>
</div>
    <div class="newsFlash">
    <div class="">
        <div class="toast-header bg-warning">
            <strong class="mr-auto">Important <i class="material-icons icons">announcement</i></strong>
            <small>Just now</small>
            <button type="button" class="ml-2 mb-1 close" id="gotIt" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="toast-body bg-white">
            <p>Remember to save your Changes!</p>
        </div>
    </div>
</div>
<div class="container border p-5 mt-5 mb-5">
    <div>
        <h3>Edit Profile</h3>
        <p>Want to change your profile information? Just click the texture to edit and press “save”</p>
    </div>
    <form class="text-left profileEdit" id="profileEdit" runat="server">
        <div class="row personalize">
            <div class="col-md-4">
                <label>First Name</label> <br>

                <asp:Textbox id="firstNameBox"  runat="server" class="fillers" type="text" placeholder=""/>
            </div>
            <div class="col-md-4">
                <label>Last Name</label> <br>

                <asp:Textbox id="lastNameBox" runat="server" class="fillers" type="text" placeholder=""/>
            </div>
            <div class="col-md-4">
                <label>Email</label> <br>

                <asp:Textbox id="emailBox" runat="server" class="fillers" type="text" placeholder=""/>
            </div>
        </div>
        <div class="row personalize mt-4">
            <div class="col-md-4">
                <label>Street address</label> <br>

                <asp:Textbox id="streetAddressBox" runat="server" class="fillers" type="text" placeholder=""/>
            </div>
            <div class="col-md-4">
                <label>City</label> <br>

                <asp:Textbox id="cityBox" runat="server" class="fillers" type="text" placeholder=""/>
            </div>
            <div class="col-md-4">
                <label>State</label> <br>

                <asp:Textbox id="stateBox" runat="server" class="fillers" type="text" placeholder=""/>
            </div>
        </div>
        <div class="row personalize mt-4">
            <div class="col-md-4">
                <label>Zipcode</label> <br>

                <asp:Textbox id="zipcodeBox" runat="server" class="fillers" type="text" placeholder=""/>
            </div>
            <div class="col-md-4">
                <label>Phone Number</label> <br>

                <asp:Textbox id="phoneNumberBox" runat="server" class="fillers" type="text" placeholder=""/>
            </div>
        </div>
        <br>
        <asp:Label ID="profileLabel" runat="server" class="mt-4">NOTE: IF YOU DO NOT PRESS SAVE AFTER CHANGING YOUR INFORMATION, IT WILL NOT SAVE.</asp:Label>
        <br>
        <asp:Button id="btnSaveProfile" runat="server" type="submit" Text="SAVE" OnClick="btnSaveProfile_Click" class="greyBtn" />
    <br>
    <br>
        <div class="row personalize mt-4">
            <div class="col-md-4">
                <label>Current Password</label> <br>

                <asp:Textbox id="currentPasswordBox" TextMode="Password" runat="server" class="password" type="text" placeholder=""/>
            </div>
            <div class="col-md-4">
                <label>New Password</label> <br>

                <asp:Textbox id="newPasswordBox" TextMode="Password" runat="server" class="password" type="text" placeholder=""/>
            </div>
            <div class="col-md-4">
                <label>Retype New Password</label> <br>

                <asp:Textbox id="retypeNewPasswordBox" TextMode="Password" runat="server" class="password" type="text" placeholder=""/>
            </div>
        </div>
        <br>
        <asp:Label ID="passwordLabel" runat="server" class="mt-4">NOTE: NEW PASSWORDS MUST MATCH, OR IT WILL NOT SAVE.</asp:Label>
        <br>
        <asp:Button id="btnPasswordChange" runat="server" type="submit" Text="CHANGE PASSWORD" OnClick="btnPasswordChange_Click" class="greyBtn" />
    </form>

</div>


<footer id="footer">
        <p style="color: rgb(147,147,147);">© 2019 Testing Tutor. All rights reserved.</p>
    </footer>


    <!--<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>-->
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/js/bs-animation.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
    <script src="https://unpkg.com/@bootstrapstudio/bootstrap-better-nav/dist/bootstrap-better-nav.min.js"></script>
    <script src="../assets/js/myjs.js"></script>

    </body>

    </html>

