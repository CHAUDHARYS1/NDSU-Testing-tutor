<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
   
     <div class="container-fluid" id="welcome">
        <div class="row">
            <div class="col-md-5" id="welcomeHead">
                <div>
                    <h3 class="m-0"><strong>TESTERS,</strong></h3>
                    <h1>WELCOME!</h1>
                    <p><strong>Testing Tutor</strong> is a <span style="text-decoration: underline;">web application</span> intended to Improve software testing skills of <span style="text-decoration: underline;">computer science students, software developers</span> who are new to the workforce, and anyone who wishes to become a more <span class="greenHighlight">effective software tester</span>.</p>
                    <a class="btn btnGold scroll" href="#moreAbout">LEARN MORE</a>
                    <div id="testYourSoftware">
                        <p class="m-0" style="font-weight: bold;font-family: 'Open Sans Condensed', sans-serif;font-size: 29px;">TEST YOUR SOFTWARE!</p><a class="text-dark" href="Register.aspx"><span style="text-decoration: underline;">Become a member, its free!</span></a><a class="text-dark" style="margin-left: 21px;" href="Login.aspx"><span style="text-decoration: underline;">Already a memeber?</span></a>
                    </div>
                </div>
            </div>
            <div id="laptop" class="col-md-7">
                <img class="img" id="one" src="assets/img/laptop.png">
                <img id="two" src="assets/img/laptop2.png">
            </div>
        </div>
    </div>
    
    <hr>
    <div class="text-left container" id="moreAbout">
        <div>
            <h2>ABOUT TESTING TUTOR.</h2>
            <h6 style="text-transform: initial;">We see that you wanted to learn more about the features that Testing Tutor offers.</h6>
        </div>
        <div class="row mt-5 pb-5 pt-5">
            <div class="text-center col-md-6"><img class="img-fluid" data-aos="fade-up" data-aos-duration="1000" data-aos-once="true" src="assets/img/efficencyIcon.png" style="height: 341px;"></div>
            <div class="col-md-6 pr-5" style="margin-top: 30px;">
                <h2 data-aos="fade-up" data-aos-duration="1000" data-aos-once="true" class="aboutHeading">BE EFFECTIVE IN YOUR CODE<i class="material-icons">check</i></h2>
                <hr>
                <p  data-aos="fade-up" data-aos-duration="1000" data-aos-once="true" class="aboutParagraph">Learn from the mistakes. Why not? Submit your codes and learn where things went wrong so the newt time, you know what you did wrong. <strong>Be effective.</strong></p><a class="btnGold" href="Register.aspx">SIGN UP</a>
            </div>
        </div>
        <div class="row mt-5 pt-5 pb-5">
            <div class="col-md-6 text-left pl-5" style="margin-top: 30px;">
                <h2  data-aos="fade-up" data-aos-duration="1000" data-aos-once="true" class="aboutHeading"><strong>FIXING THE ERROR</strong><i class="material-icons">check</i></h2>
                <hr>
                <p data-aos="fade-up" data-aos-duration="1000" data-aos-once="true" class="aboutParagraph">We know writing codes can be a difficult task. Especially when the likely chance of making an error is above 50%. <strong>At Testing Tutor,&nbsp;we point out your mistakes so you can focus in building and less on fixing.</strong><br></p>
            </div>
            <div class="col-md-6 text-center"><img class="img-fluid" data-aos="fade-up" data-aos-duration="2300" data-aos-once="true" src="assets/img/errorIcon.png" style="height: 341px;"></div>
        </div>
        <div class="row mt-5 pt-5 pb-5">
            <div class="text-center col-md-6"><img class="img-fluid" data-aos="fade-up" data-aos-duration="1000" data-aos-once="true" src="assets/img/immediateIcon.png" style="height: 341px;"></div>
            <div class="col-md-6 pr-5" style="margin-top: 30px;">
                <h2  data-aos="fade-up" data-aos-duration="1000" data-aos-once="true" class="aboutHeading"><strong>IMMEDIATE CODE FEEDBACK</strong><i class="material-icons">check</i></h2>
                <hr>
                <p  data-aos="fade-up" data-aos-duration="1000" data-aos-once="true" class="aboutParagraph">Time is valuable, especially yours. At Testing Tutor, <strong>we use machine learning algorithms to find your mistakes and send you the feedback in a matter of seconds.</strong><br></p>
            </div>
        </div>
        <div class="row mt-5 pt-5 pb-5">
            <div class="col-md-6 pl-5" style="margin-top: 30px;">
                <h2  data-aos="fade-up" data-aos-duration="1000" data-aos-once="true" class="aboutHeading"><strong>ITS 100% FREE!!!</strong><i class="material-icons">check</i></h2>
                <hr>
                <p  data-aos="fade-up" data-aos-duration="1000" data-aos-once="true" class="aboutParagraph">If we haven’t convinced you yet, you are in for a treat. At Testing Tutor, all of services and features are <strong>100% FREE</strong>. That means, you do not have to pay a dime. Simply signup for an account and get coding!<br></p><a class="btnGold" href="Register.aspx">SIGN UP</a>
            </div>
            <div class="col-md-6 text-center"><img class="img-fluid"  data-aos="fade-up" data-aos-duration="1000" data-aos-once="true" src="assets/img/freeIcon.png" style="height: 341px;"></div>
        </div>
        <div class="text-center scrolltotop p-1">
            <a class="scroll p-1" href="#top">
                <p>CLICK HERE TO SCROLL TO TOP</p>
            </a>
        </div>
        <footer id="footer">
        <p style="color: rgb(147,147,147);">© 2019 Testing Tutor. All rights reserved.</p>
    </footer>
    </div>
    
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-animation.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
    <script src="https://unpkg.com/@bootstrapstudio/bootstrap-better-nav/dist/bootstrap-better-nav.min.js"></script>
    <script src="assets/js/myjs.js"></script>

</asp:Content>
<%--  --%>
