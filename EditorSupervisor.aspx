<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditorSupervisor.aspx.cs" Inherits="Editor" %>

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
                    $('#lblMessage').show();
                    $('#progressbar').hide();
                }
            });

    </script>

    <div class="ml-5 backToDashboard">
                    <a href="indexSupervisor.aspx"><i class="material-icons icons">chevron_left</i>Go back to <span><u>myDashboard</u></span></a>
</div>


 <form runat="server"  enctype="multipart/form-data">
    <div class="container mt-5" id="test">
    <h2>Testing Station!</h2>
    <p>You have arrived at the <u>central hub</u>. Test code can be submitted two different ways. You can open the editor by <a data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">clicking here</a> or by pressing the button below. You can also browse your local hard drive and submit an existing file. </p>
    <p>To learn more about our accepted file extensions, visit our <a href="#">FAQ page.</a></p>
        <br>
         <div class="border p-2">
             <p><i class="material-icons icons">insert_drive_file</i>Test File: <asp:DropDownList ID="codeSamplesDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="codeSamplesDropDownList_Change">
                </asp:DropDownList></p>
                <!-- THE CODE INSIDE THE FILE WILL SHOW HERE -->
                <p class="codeTxt" id="codeSampleData" runat="server">
                    import mysql.connector

                    mydb = mysql.connector.connect(
                    host="localhost",
                    user="yourusername",
                    passwd="yourpassword",
                    database="mydatabase"
                    )

                    mycursor = mydb.cursor()

                    sql = "DELETE FROM customers WHERE address = 'Mountain 21'"

                    mycursor.execute(sql)

                    mydb.commit()

                    print(mycursor.rowcount, "record(s) deleted")
                </p>
            </div>
   
       <div class="mt-5 mb-5">
        <button class="btn border" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
            Open Editor </button>
        <div class="collapse" id="collapseExample">
            <div class="card card-body">
                <p><i class="material-icons icons">insert_drive_file</i>Name Your Test Case Code Submission: <asp:TextBox ID="testCaseName" runat="server"></asp:TextBox></p>                            
                <asp:textbox id="codeTextBox" runat="server" name="code">Begin to write your code here</asp:textbox>
                 <p>You can copy and paste your code directly to this editor. To copy and paste in Mac, use COMMAND + C to copy and COMMAND + V to paste. If you are in Windows, use CONTROL + C to copy and CONTROL + V to paste.</p>
                <asp:Button class="pl-5 pr-5 mt-3 mb-1 btnGold" ID="btnSubmit" runat="server" Text="Submit" OnClick="codeEditorSubmit_click" />              
            </div>
        </div>
    </div>
    <div class="input-group">

        
        <div class="custom-file">
            <input type="file" name="inputGroupFile02" runat="server" class="custom-file-input" id="inputGroupFile02" onchange="updateFileName(this)"/>
            <asp:Label id="fileNameLabel" runat="server" Text="Choose File" class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02"></asp:Label>
        </div>
        <div class="input-group-append">
            <span class="input-group-text" id="inputGroupFileAddon02">
            <asp:Button ID="Button2" Text="Submit" runat="server" OnClick="existingFileSubmit_click" />
            </span>
            
        </div>
    
    </div>
           
    <div id="results" class="mt-5 border">
        <h3 class="pt-2">RESULTS:</h3>
        <div id="progressbar">
        <div class="progress-label">Analyzing . . .</div>
    </div>
        <p>
      <asp:Label ID = "lblMessage" Text="Results for the files you upload will show here." runat="server" ForeColor="Green" Visible="true" />   
        </p>
    </div>

    <div id="shortHistory" class="mt-5 border">
        <h3 class="pt-2">RECENT HISTORY:</h3>
        <div class="text-center container mt-5">
           <div class="table-responsive table-borderless">
        <table class="table table-bordered table-hover">
             <thead>
                    <tr>
                        <th>Test ID:</th>
                        <th>Code Sample:</th>
                        <th>Test Case:</th>
                        <th>Date:</th>
                        <th>Statement Coverage:</th>
                        <th>Condition Coverage:</th>
                        <th>Branch Coverage:</th>
                    </tr>
                </thead>
                <tbody class="text-monospace">

           <asp:PlaceHolder ID="TablePlaceHolder" runat="server">
                    </asp:PlaceHolder>

        </table>
    </div>
        </div>
        <a href="HistorySupervisor.aspx">Click here to see all your history.</a>
     </div>
        <asp:HiddenField id="submitFileNameHiddenField" runat="server" value=""/>
</div>
    </form> 

<script src="codemirror/lib/codemirror.js"></script>

<script src="codemirror/mode/javascript/javascript.js"></script>

<script>
    var textArea = document.getElementById( '<%= codeTextBox.ClientID %>');
    var editor = CodeMirror.fromTextArea(textArea, {
        theme: "monokai",

    });

</script>
<script type="text/javascript">
    function updateFileName() {
        document.getElementById('<%=fileNameLabel.ClientID%>').innerText = document.getElementById('<%=inputGroupFile02.ClientID%>').files[0].name;
    }
</script>


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
