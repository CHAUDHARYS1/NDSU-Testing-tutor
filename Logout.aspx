<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">

<!DOCTYPE html>
<html>

<body>
<style>
    body{
        background-image: url(assets/img/funky-lines.png);
    }
</style>
<div class="container text-center" id="welcome">
    <div>
        <i class="material-icons icons" style="font-size: 100px;">
            sentiment_very_dissatisfied
        </i>
        <p>We are sad to see you go<br> You have been successfully logged out.</p>
        <a href="Login.aspx" class="btn btnGold ">Login</a>

        <a href="Register.aspx" class="btn btnGold ">Register</a>
    </div>
</div>
 <footer id="footer">
        <p style="color: rgb(147,147,147);">© 2019 Testing Tutor. All rights reserved.</p>
    </footer>
    <!--
    <script src="assets/js/jquery.min.js"></script>
    -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-animation.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
    <script src="https://unpkg.com/@bootstrapstudio/bootstrap-better-nav/dist/bootstrap-better-nav.min.js"></script>
    <script src="assets/js/myjs.js"></script>
</body>

</html>
</asp:Content>
