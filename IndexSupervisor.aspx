<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IndexSupervisor.aspx.cs" Inherits="IndexSupervisor" %>

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

<div class="container mt-5 pt-5 mb-5">
    <div class="text-center">
        <h3>Hi <asp:Label ID="lblUserName" runat="server"></asp:Label>,</h3>
        <p>Welcome back to Testing Tutor, we hope you are enjoying our services.</p>
    </div>
    <div class="myDashboard mt-4">
        <p>myDashboard</p>
    </div>

    <div class="row" id="dashboard">
        <div class="col box-one"> <a href="SupervisorStudentList.aspx">
                <div class="pt-4 pb-3 pl-1 pr-1 text-center" data-toggle="tooltip" data-placement="bottom" title="See your students and the files they’ve tested">
                    <h5>Students</h5>
                    <img class="dashboardIcons mt-2 mb-3" src="../assets/icons/student-icon.png">
                </div>
            </a>
        </div>
        <div class="col box-one">
            <a href="GroupManageSupervisor.aspx">
                <div class="pt-4 pb-3 pl-1 pr-1 text-center" data-toggle="tooltip" data-placement="bottom" title="See your groups accomplishments">
                    <h5>Manage Groups</h5>
                    <img class="dashboardIcons mt-2 mb-3" src="../assets/icons/manage%20groups.png">
                </div>
            </a>
        </div>
        <div class="col box-one">
            <a href="GroupCodesSupervisor.aspx">
                <div class="pt-4 pb-3 pl-1 pr-1 mb-4 text-center" data-toggle="tooltip" data-placement="bottom" title="Add new students to the group">
                    <h5>Create group</h5>
                    <img class="dashboardIcons mt-2 mb-3" src="../assets/icons/create-class.png">
                </div>
            </a>
        </div>
        <div class="col box-one">
            <a href="EditorSupervisor.aspx">
                <div class="pt-4 pb-3 pl-1 pr-1 text-center" data-toggle="tooltip" data-placement="bottom" title="View our new online code editor">
                    <h5>Code Editor</h5>
                    <img class="dashboardIcons mt-2 mb-3" src="../assets/icons/code-editor.png">
                </div>
            </a>
        </div>
        <div class="col box-one">
            <a href="EditProfileSupervisor.aspx">
                <div class="pt-4 pb-3 pl-1 pr-1 text-center" data-toggle="tooltip" data-placement="bottom" title="Personalize your profile to your liking">
                    <h5>Edit Profile</h5>
                    <img class="dashboardIcons mt-2 mb-3" src="../assets/icons/profile-edit.png">
                </div>
            </a>
        </div>
    </div>
    <!--
    <div class="row mt-4" id="dashboard">
        <div class="col-lg-3 box-one">
            <div class="pt-4 pb-3 pl-1 pr-1 text-center">
                <a href="#">
                    <h5>Got a question?</h5>
                    <img class="dashboardIcons mt-2 mb-3" src="../assets/icons/account-question.png">
                    <p>Ask us any questions you have</p>
                </a> 
            </div>
        </div>
        <div class="col-lg-3 box-one">
            <div class="pt-4 pb-3 pl-1 pr-1 text-center">
                <a href="#">
                    <h5>Our Community</h5>
                    <img class="dashboardIcons mt-2 mb-3" src="../assets/icons/forum.png">
                    <p>The Testing Tutor Community is here!</p>
                </a> 
        </div>
        </div>
        <div class="col-lg-3 box-one">
            <div class="pt-4 pb-3 pl-1 pr-1 text-center">

                <a href="#">
                    <h5>Quick Search</h5>
                    <img class="dashboardIcons mt-2 mb-3" src="../assets/icons/account-search.png">
                    <p>Lookup a student of your choice</p>
                </a>
            </div>
        </div>
    </div>
</div>

-->


</div>

    <footer id="footer">
        <p style="color: rgb(147,147,147);">© 2019 Testing Tutor. All rights reserved.</p>
    </footer>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/js/bs-animation.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
    <script src="https://unpkg.com/@bootstrapstudio/bootstrap-better-nav/dist/bootstrap-better-nav.min.js"></script>
    <script src="../assets/js/myjs.js"></script>
</body>

</html>
