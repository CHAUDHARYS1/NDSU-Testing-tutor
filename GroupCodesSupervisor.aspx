<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GroupCodesSupervisor.aspx.cs" Inherits="GroupCodesSupervisor" %>

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


<style>
    .horizontalLine {
        height: 200px;
        width: 2px;
        background: #f1f1f1;
    }

</style>
<div class="ml-5 backToDashboard">
                    <a href="indexSupervisor.aspx"><i class="material-icons icons">chevron_left</i>Go back to <span><u>myDashboard</u></span></a>
</div>
<div class="container border rounded mb-5 mt-5">
    <div id="instructorHeading">
        <h3>Create Group</h3>
        <p>Each group has a unique code that is generated and used for others to join the group.</p>
        <p class="notes">NOTE: Public groups will be posted on the forum, private groups you handle the distribution of the group code.</p>
        <a href="#" class="secondnotes mt-5"><u>Click here to learn more about how this works</u></a>

    </div>
    <form runat="server">
    <div id="instructorInputs" class="row mb-4 ">

        <div class="col">
            
                <label class="font-weight-bolder">Group Name:</label>
                <br>
                <asp:Textbox type="text" ID="groupName" name="groupName" runat="server" class="p-1 bg-white border-0 rounded"></asp:Textbox><br>
                <asp:Label Text="Enter a group name here" ID="lblMessage" runat="server"></asp:Label><br>
                <br>
                <asp:RadioButtonList id="RadioButtonList1" runat="server">
                    <asp:ListItem value="Public" Selected="True"></asp:ListItem>
                    <asp:ListItem value="Private"></asp:ListItem>
                </asp:RadioButtonList> 
                    <asp:Button Text="Create Group" ID="btnCreateGroup" class="btnGold mt-3" runat="server" onclick="btnCreateGroup_Click" />

        </div>
        <div class="horizontalLine"></div>
        <div class="col-9">
                    <label class="font-weight-bolder">Group Code:</label>
                    <br />
                    <asp:Textbox ID="groupCode" class="p-1 bg-white border-0 rounded" runat="server" readonly="True"></asp:Textbox>
        </div>  
        </div>
        <br>
    </form>
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