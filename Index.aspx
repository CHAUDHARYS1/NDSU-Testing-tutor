<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <div class="container mt-5">
        <div class="row justify-content-md-center">
            <div class="col-md-5" style="margin-top: 50px;">
                <asp:Label ID="lblUserName" runat="server" class="m-0" style="font-weight: bold;font-size: 20px;"><strong>Name of user,</strong></asp:Label>
                <h1 class="m-0" style="font-weight: 900;font-size: 4em;">WELCOME BACK.</h1>
                <p class="disc">On behalf of everyone at Testing Tutor, Thank you for choosing our code tester for your needs. Our code tester includes the following excellent:software tester.</p>
                <ul class="mt-2 font-weight-bold">
                    <li>Immediate code feedback<i class="material-icons" style="color: #f0b65f;">check</i><br></li>
                    <li>Easy to use service<i class="material-icons" style="color: #f0b65f;">check</i><br></li>
                    <li>100% completely free<i class="material-icons" style="color: #f0b65f;">check</i></li>
                </ul>
                <p class="disc">We are committed to providing you with the highest level of Customer satisfaction possible. If for any reason you have questions or comments, we are delighted to hear from you. Visit our about page to learn more about how you can reach
                    us. &nbsp;</p><a class="btnGold" href="Test.aspx">TEST CODE</a></div>
            <div class="col-md-7"><img style="height: 559px;" src="assets/img/laptop.png"></div>
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

