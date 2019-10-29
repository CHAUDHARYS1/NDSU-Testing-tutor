<%@ Page Title="" Language="C#" AutoEventWireup="true"  MasterPageFile="~/MasterPage3.master" CodeFile="Login.aspx.cs" Inherits="Login" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">

<!DOCTYPE html>
<html>
 
    <div class="body-two">
        <div class="body-three">
            <div class="logo">
                <a href="Home.aspx">
                    <img src="assets/img/logo.png" /></a>
            </div>
            <form runat="server" class="loginform">
                <h2 class="ml-0">MEMBER LOGIN</h2>
                <br />
                <svg style="width:22px;height:22px;" viewBox="0 0 24 24">
                    <path fill="#000000" d="M12,4A4,4 0 0,1 16,8A4,4 0 0,1 12,12A4,4 0 0,1 8,8A4,4 0 0,1 12,4M12,6A2,2 0 0,0 10,8A2,2 0 0,0 12,10A2,2 0 0,0 14,8A2,2 0 0,0 12,6M12,13C14.67,13 20,14.33 20,17V20H4V17C4,14.33 9.33,13 12,13M12,14.9C9.03,14.9 5.9,16.36 5.9,17V18.1H18.1V17C18.1,16.36 14.97,14.9 12,14.9Z" />
                </svg>
                <asp:Label class="formlabel" ID="lblUsername" runat="server" Text="Username:"></asp:Label>
                <br />
                <asp:TextBox ID="txtUsername" runat="server" TextMode="Email"></asp:TextBox>
                <br />
                <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                    <path fill="#000000" d="M12,17C10.89,17 10,16.1 10,15C10,13.89 10.89,13 12,13A2,2 0 0,1 14,15A2,2 0 0,1 12,17M18,20V10H6V20H18M18,8A2,2 0 0,1 20,10V20A2,2 0 0,1 18,22H6C4.89,22 4,21.1 4,20V10C4,8.89 4.89,8 6,8H7V6A5,5 0 0,1 12,1A5,5 0 0,1 17,6V8H18M12,3A3,3 0 0,0 9,6V8H15V6A3,3 0 0,0 12,3Z" />
                </svg>
                <asp:Label class="formlabel" ID="lblPassword" runat="server" Text="Password:"></asp:Label>

                <asp:TextBox ID="txtPassword" runat="server" class="formfields" TextMode="Password"></asp:TextBox>
                <br /><br />
                <asp:Button ID="btnLogin" class="submitbtn" runat="server" Font-Bold="True" Font-Italic="False" Text="Login" OnClick="btnLogin_Click" />
                <asp:Button ID="btnCreateAccount" class="lowbtn" runat="server" Font-Bold="True" Text="Forgot password" PostBackUrl="~/register.aspx" OnClick="btnCreateAccount_Click" />

                <asp:Button ID="Button1" class="lowbtn" runat="server" Font-Bold="True" Text="Create an Account" PostBackUrl="~/register.aspx" OnClick="btnCreateAccount_Click" />

                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </form>
        </div>
        <br />
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


</html>
</asp:Content>