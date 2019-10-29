<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchSupervisor.aspx.cs" Inherits="SearchSupervisor" %>

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

<div class="container text-center border mt-5 mb-5">
    <div class="mt-5 quickSearch">
        <h3>Quick Search</h3>
        <p>You can search up anything. From students name to group names to forum questions.</p>
        <button class="search_btn"><i class="material-icons icons search_icons pt-2">search</i></button><input type="search" name="search" class="search" value="" placeholder="Ex. Awesome Possum">
    </div>

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
