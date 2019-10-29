<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FeedbackSupervisor.aspx.cs" Inherits="FeedbackSupervisor" %>

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


    <script src="assets/js/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function() {
            var progressbar = $("#progressbar"),
                progressLabel = $(".progress-label");

            progressbar.progressbar({
                value: false,
                change: function() {
                    progressLabel.text(progressbar.progressbar("value") + "%");
                },
                complete: function() {
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
                complete: function() {
                    $('#feedbackScores').show();
                    $('#progressbar').hide();
                }
            });


            $('.fillers, .password').focus(function() {
                $(this).css({
                    "background": "white",
                    "border-left": "2px solid grey",
                    "box-shadow": "0 0 11px rgba(33,33,33,.2)"
                });
            });
            $('.fillers, .password').blur(function() {
                $(this).css({
                    "background": "#e7e9eb",
                    "border-left": "none",
                    "box-shadow": "none"
                });
            });
            $('.fillers').change(function() {
                $("#submit").removeClass("greyBtn").addClass("btnGold");
            });
            $('.password').change(function() {
                $("#savePassword").removeClass("greyBtn").addClass('btnGold');
            });
            $('#statementCoverage,#conditionalCoverage, #brandCoverage').each(function() {
                var el = $(this);
                var value = parseFloat(el.text());
                if (value > 90) {
                    el.css("color", "green");
                } else if (value <= 90) {
                    el.css("color", "orange");
                };
                if (value <= 70) {
                    el.css("color", "red");
                }
            });
        });
        $(window).on("load", function() {
            $('.newsFlash').fadeIn();

            $('#gotIt').click(function() {
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

   <style>
    .score {
        padding: 10px;
        line-height: 5px;
        text-align: center;
        background: #f2f2f2;
        margin: 10px;
    }

</style>
<div class="newsFlash">
    <div class="">
        <div class="toast-header bg-warning">
            <strong class="mr-auto">Important <i class="material-icons icons">announcement</i></strong>
            <small>Just now</small>
            <button type="button" class="ml-2 mb-1 close" id="gotIt" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="toast-body bg-light">
            <p>How we grade your test:</p>
            <div class="ml-5 m-0 p-0">
                <p><i class="material-icons icons text-success">crop_square</i>Above 90% = Excellent</p>
                <p><i class="material-icons icons text-warning">crop_square</i>Above 80% = Good</p>
                <p><i class="material-icons icons text-danger">crop_square</i>Below 80% = Revision Required</p>
            </div>
            <a href="#">Learn more about our grading system.</a>
        </div>
    </div>
</div>

<div class="container mt-5 mb-5">
    <div class="text-center">
        <h3>Feedback<i class="material-icons icons">playlist_add_check</i></h3>
        <label runat="server" id="testResultTitle">You can see the scores of your submission here.</label>
    </div>


    <div>
        <div>
            <div class="border p-2">
                <!-- THE CODE INSIDE THE FILE WILL SHOW HERE -->
                <p><i class="material-icons icons">insert_drive_file</i>Code Sample: <label runat="server" id="codeSampleName"><u>Test1.Java</u></label></p>
                <p class="codeTxt" runat="server" id="codeSampleData">
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
            <!--- FROM THE DATABASE --->
            <div class="border p-2 mt-3">
                <!-- THE CODE INSIDE THE FILE WILL SHOW HERE -->
                <p><i class="material-icons icons">insert_drive_file</i>Test Case: <label runat="server" id="testCaseName"><u>StudentSubmit1.Java</u></label></p>
                <p class="codeTxt" runat="server" id="testCaseData">
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
        </div>
        <div class="mt-3">
            <p><i class="material-icons icons">warning</i>Problems: <label class="text-warning">Uh you got a problem there sir. Need to improve. See me after school. Bad boy.</label></p>
        </div>
        <div class="mt-3">
            <p><i class="material-icons icons">stars</i>Scores: Scores are graded in three catagories. <a href="#">Statement, Conditional and Branch coverage. <i class="material-icons icons">open_in_new</i></a></p>
        </div>
        <div class="mt-3 ml-0 mr-0 row">
            <div class="score col">
                <p class="scoreName">Statement Coverage:</p>
                <label runat="server" id="statementCoverageLabel" class="default-num">40%</label>
            </div>
            <div class="score col">
                <p class="scoreName">Conditional Coverage:</p>
                <label runat="server" id="conditionalCoverageLabel" class="default-num">95%</label>
            </div>
            <div class="score col">
                <p class="scoreName">Branch Coverage:</p>
                <label runat="server" id="branchCoverageLabel" class="default-num">90%</label>
            </div>
        </div>

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

