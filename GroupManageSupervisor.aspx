<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GroupManageSupervisor.aspx.cs" Inherits="GroupManageSupervisor" %>

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

    <script type="text/javascript"> 
        $(document).ready(function ShowPopup()
        {
            if ('<%= Session["groupManageSupervisorTempRow"] %>' != "")
            {
                $("#deleteGroup").modal('show');
            }

        });
        </script>

    <style>
    .deleteBtn {
        background: transparent;
        color: red;
        cursor: pointer;
        border: none;
    }

    .deleteBtn:hover {
        opacity: .5;
    }

</style>

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
<div class="container mt-5 mb-5">
    <div class="text-center">
        <h3><asp:Label runat="server" id="lblUserName">FirstName</asp:Label></h3>
        <p>Here is a list of your groups.</p>
    </div>
    <div class="text-right">
    </div>
    <br>
    <form runat="server">
    <table class="table table-borderless text-center">
        <thead>
            <tr class="tableHead">
                <th scope="col" class="tableTitle">GROUP CODE:</th>
                <th scope="col" class="tableTitle">GROUP NAME:</th>
                <th scope="col" class="tableTitle">DATE CREATED:</th>
                <th scope="col" class="tableTitle">VISIBILITY:</th>
                <th scope="col" class="tableTitle">GROUP COUNT:</th>
                <th scope="col" class="tableTitle">VIEW STUDENTS:</th>
                <th scope="col" class="tableTitle">DELETE:</th>
            </tr>
        </thead>
        
        <tbody class="border rounded">

            <asp:PlaceHolder ID="TablePlaceHolder" runat="server">
                    </asp:PlaceHolder> 
        </tbody>     
    </table>
       
        <!-- Modal -->
                    <div class="modal fade" id="deleteGroup" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Delete group?</h5>
                                </div>
                                <div class="modal-body">
                                    <i class="material-icons deleteForever">
                                        delete_forever
                                    </i>
                                    <label id="deleteModalMessage" runat="server">Are you sure you want to delete this group?</label>

                                </div>
                                <div class="modal-footer">
                                    <asp:button type="button" name="btnCancel" id="btnCancel" text="Cancel" class="btn btn-secondary" runat="server" OnClick="cancelSave_Click"></asp:button>
                                    <asp:button type="button" name="btnDelete" id="btnDelete" text="Delete Group" class="btn btn-primary" runat="server" OnClick="deleteSave_Click"></asp:button>
                                </div>
                            </div>
                        </div>
                </div>
        </form>

     <div class="float-right">
        <a href="GroupCodesSupervisor.aspx" class="btnGold">Create New Group +</a>
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