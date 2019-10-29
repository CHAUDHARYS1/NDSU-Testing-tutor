<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 

<div class="container">
    <div class="wholeTitle">
        <div class="mainTitle">
            <h2>SO, WE SEE YOU WANT TO LEARN MORE <br>ABOUT TESTING TUTOR.</h2>
        </div>
        <div class="secondTitle">
            <h2>SO, WE SEE YOU WANT TO LEARN <br>MORE ABOUT TESTING TUTOR.</h2>
        </div>
    </div>
    <div>
        <h5>FAQ's Frequently Asked Questions -</h5>
        <hr>
    </div>
    <div class="row mb-5">
        <div class="col-md-4">
            <p class="question">What is Testing Tutor?<i class="material-icons icons">
                    arrow_drop_down
                </i></p>
            <p>Testing Tutor is a web application
                intended to improve software testing
                skills of computer science students.
                Software developers who are new to
                the workforce and anyone who wishes
                to become a more effective software tester.</p>
        </div>
        <div class="col-md-4">
            <p class="question">Why use Testing Tutor?<i class="material-icons icons">
                    arrow_drop_down
                </i></p>
            <p>We know fixing a code that was
                developed by someone else can be
                hard and sometimes a waste of time.
                We are here to save your time and
                give you feedback instantly so you
                can move on to being more productive
                and more efficient.</p>
        </div>
        <div class="col-md-4">
            <p class="question">Who created Testing Tutor?<i class="material-icons icons">
                    arrow_drop_down
                </i></p>
            <p>Testing Tutor is created and developed by
                a group of students working together. Each
                student with their unique skills helped
                build this platform.</p>
        </div>
    </div>


    <div class="row">
        <div class="col-md-3">Ask us a question:</div>
        <div class="col-md-7"><input type="text" class="askQuestion"></div>
        <div class="col-md-2"><button class="btnGold" type="button">Submit</button>
        </div>
    </div>


    <!-- Picture Time -->

    <div class="mt-5">
        <h3>Testing Tutor Team</h3>
    </div>

    <div class="row mt-5">
        <div class="col-sm">
            <img src="assets/img/placeholder.gif" style="width:100%;">
        </div>
        <div class="col-sm">
            <img src="assets/img/placeholder.gif" style="width:100%;">
        </div>
        <div class="col-sm">
            <img src="assets/img/placeholder.gif" style="width:100%;">
        </div>
        <div class="col-sm">
            <img src="assets/img/placeholder.gif" style="width:100%;">
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-sm">
            <img src="assets/img/placeholder.gif" style="width:100%;">
        </div>
        <div class="col-sm">
            <img src="assets/img/placeholder.gif" style="width:100%;">
        </div>
        <div class="col-sm">
            <img src="assets/img/placeholder.gif" style="width:100%;">
        </div>
        <div class="col-sm bg-light">
            <p class="p-3">"We have a great team of web designers
                and developers and they worked very well.
                Overall a very hard working team!"<br>
                - Michael Henson</p>
        </div>
    </div>

</div>
    <footer id="footer">
        <p style="color: rgb(147,147,147);">© 2019 Testing Tutor. All rights reserved.</p>
    </footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/@bootstrapstudio/bootstrap-better-nav/dist/bootstrap-better-nav.min.js"></script>
    <script src="assets/js/myjs.js"></script>
    </body>

    </html>


</asp:Content>
