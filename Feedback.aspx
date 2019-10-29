<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="_feedback" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<!DOCTYPE html>

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
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-animation.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
    <script src="https://unpkg.com/@bootstrapstudio/bootstrap-better-nav/dist/bootstrap-better-nav.min.js"></script>
    <script src="assets/js/myjs.js"></script>

</asp:Content>
