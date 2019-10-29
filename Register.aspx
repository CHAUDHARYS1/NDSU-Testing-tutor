<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master"AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="_register" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <!DOCTYPE html>
    <html>

        <head>
            <title>
                Registration
                <link href="styles/style.css" rel="stylesheet" />
            </title>
        </head>
        <style>

            form{
                height:inherit;
            }
        </style>

     <body>
         <div class="secondbody">

           <div class="logo">
             <a href="Home.aspx"><img src="Images/logo.png" /></a>
           </div>


                 <form id="form1" runat="server">
                   <h2>MEMBER SIGNUP</h2>
                    <p class="ml-1">Members have exclusive access to testing out their code and recieve feedback instantly.</p>
               
          
        
                <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                    <path fill="#000000" d="M20,12A8,8 0 0,0 12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20A8,8 0 0,0 20,12M22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2A10,10 0 0,1 22,12M10,9.5C10,10.3 9.3,11 8.5,11C7.7,11 7,10.3 7,9.5C7,8.7 7.7,8 8.5,8C9.3,8 10,8.7 10,9.5M17,9.5C17,10.3 16.3,11 15.5,11C14.7,11 14,10.3 14,9.5C14,8.7 14.7,8 15.5,8C16.3,8 17,8.7 17,9.5M12,17.23C10.25,17.23 8.71,16.5 7.81,15.42L9.23,14C9.68,14.72 10.75,15.23 12,15.23C13.25,15.23 14.32,14.72 14.77,14L16.19,15.42C15.29,16.5 13.75,17.23 12,17.23Z" />
                </svg>
                 <asp:Label class="formlabel" ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
                <br />
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                <br />

                <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                    <path fill="#000000" d="M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M10,9.5C10,10.3 9.3,11 8.5,11C7.7,11 7,10.3 7,9.5C7,8.7 7.7,8 8.5,8C9.3,8 10,8.7 10,9.5M12,17.23C10.25,17.23 8.71,16.5 7.81,15.42L9.23,14C9.68,14.72 10.75,15.23 12,15.23C13.25,15.23 14.32,14.72 14.77,14L16.19,15.42C15.29,16.5 13.75,17.23 12,17.23M17,10H13V9H17V10Z" />
                </svg>
                <asp:Label class="formlabel" ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
                <br />
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                <br />


                <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                    <path fill="#000000" d="M4,4H20A2,2 0 0,1 22,6V18A2,2 0 0,1 20,20H4C2.89,20 2,19.1 2,18V6C2,4.89 2.89,4 4,4M12,11L20,6H4L12,11M4,18H20V8.37L12,13.36L4,8.37V18Z" />
                </svg>
                <asp:Label class="formlabel" ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                <br />
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                <br />

                <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                    <path fill="#000000" d="M12,11.5A2.5,2.5 0 0,1 9.5,9A2.5,2.5 0 0,1 12,6.5A2.5,2.5 0 0,1 14.5,9A2.5,2.5 0 0,1 12,11.5M12,2A7,7 0 0,0 5,9C5,14.25 12,22 12,22C12,22 19,14.25 19,9A7,7 0 0,0 12,2Z" />
                </svg>
                <asp:Label class="formlabel" ID="lblSteetAddress" runat="server" Text="Street Address:"></asp:Label>
                <br />
                <asp:TextBox ID="txtStreetAddress" runat="server"></asp:TextBox>
                <br />

                <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                    <path fill="#000000" d="M18,15H16V17H18M18,11H16V13H18M20,19H12V17H14V15H12V13H14V11H12V9H20M10,7H8V5H10M10,11H8V9H10M10,15H8V13H10M10,19H8V17H10M6,7H4V5H6M6,11H4V9H6M6,15H4V13H6M6,19H4V17H6M12,7V3H2V21H22V7H12Z" />
                </svg>
                <asp:Label class="formlabel" ID="lblCity" runat="server" Text="City:"></asp:Label>
                <br />
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                <br />

                <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                    <path fill="#000000" d="M15,19L9,16.89V5L15,7.11M20.5,3C20.44,3 20.39,3 20.34,3L15,5.1L9,3L3.36,4.9C3.15,4.97 3,5.15 3,5.38V20.5A0.5,0.5 0 0,0 3.5,21C3.55,21 3.61,21 3.66,20.97L9,18.9L15,21L20.64,19.1C20.85,19 21,18.85 21,18.62V3.5A0.5,0.5 0 0,0 20.5,3Z" />
                </svg>
                <asp:Label class="formlabel" ID="lblState" runat="server" Text="State:"></asp:Label>
                <br />
                <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                <br />
                
                <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                    <path fill="#000000" d="M12,8A4,4 0 0,1 16,12A4,4 0 0,1 12,16A4,4 0 0,1 8,12A4,4 0 0,1 12,8M3.05,13H1V11H3.05C3.5,6.83 6.83,3.5 11,3.05V1H13V3.05C17.17,3.5 20.5,6.83 20.95,11H23V13H20.95C20.5,17.17 17.17,20.5 13,20.95V23H11V20.95C6.83,20.5 3.5,17.17 3.05,13M12,5A7,7 0 0,0 5,12A7,7 0 0,0 12,19A7,7 0 0,0 19,12A7,7 0 0,0 12,5Z" />
                </svg>
                <asp:Label class="formlabel" ID="lblZipcode" runat="server" Text="Zipcode:"></asp:Label>
                <br />
                <asp:TextBox ID="txtZipcode" runat="server"></asp:TextBox>
                <br />

                <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                    <path fill="#000000" d="M19.1,8.7C20.9,10.5 20.9,13.3 19.1,15.2L20.1,16.2C22.6,13.9 22.6,10.1 20.1,7.7L19.1,8.7M18,9.8L17,10.8C17.5,11.5 17.5,12.4 17,13.1L18,14.1C19.2,12.9 19.2,11.1 18,9.8M14,1H4A2,2 0 0,0 2,3V21A2,2 0 0,0 4,23H14A2,2 0 0,0 16,21V3A2,2 0 0,0 14,1M14,20H4V4H14V20Z" />
                </svg>
                <asp:Label class="formlabel" ID="lblPhoneNum" runat="server" Text="Phone Number:"></asp:Label>
                <br />
                <asp:TextBox ID="txtPhoneNum" runat="server"></asp:TextBox>
                <br />

                <svg style="width:22px;height:22px;" viewBox="0 0 24 24">
                    <path fill="#000000" d="M12,4A4,4 0 0,1 16,8A4,4 0 0,1 12,12A4,4 0 0,1 8,8A4,4 0 0,1 12,4M12,6A2,2 0 0,0 10,8A2,2 0 0,0 12,10A2,2 0 0,0 14,8A2,2 0 0,0 12,6M12,13C14.67,13 20,14.33 20,17V20H4V17C4,14.33 9.33,13 12,13M12,14.9C9.03,14.9 5.9,16.36 5.9,17V18.1H18.1V17C18.1,16.36 14.97,14.9 12,14.9Z" />
                </svg>
                <asp:Label class="formlabel" ID="lblOrganization" runat="server" Text="Organization:"></asp:Label>
                <br />
                <asp:TextBox ID="txtOrganization" runat="server"></asp:TextBox>
                <br />

                <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                    <path fill="#000000" d="M12,17C10.89,17 10,16.1 10,15C10,13.89 10.89,13 12,13A2,2 0 0,1 14,15A2,2 0 0,1 12,17M18,20V10H6V20H18M18,8A2,2 0 0,1 20,10V20A2,2 0 0,1 18,22H6C4.89,22 4,21.1 4,20V10C4,8.89 4.89,8 6,8H7V6A5,5 0 0,1 12,1A5,5 0 0,1 17,6V8H18M12,3A3,3 0 0,0 9,6V8H15V6A3,3 0 0,0 12,3Z" />
                </svg>
                <asp:Label class="formlabel" ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                <br />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                    <path fill="#000000" d="M12,17C10.89,17 10,16.1 10,15C10,13.89 10.89,13 12,13A2,2 0 0,1 14,15A2,2 0 0,1 12,17M18,20V10H6V20H18M18,8A2,2 0 0,1 20,10V20A2,2 0 0,1 18,22H6C4.89,22 4,21.1 4,20V10C4,8.89 4.89,8 6,8H7V6A5,5 0 0,1 12,1A5,5 0 0,1 17,6V8H18M12,3A3,3 0 0,0 9,6V8H15V6A3,3 0 0,0 12,3Z" />
                </svg>
                <asp:Label class="formlabel" ID="lblPasswordVerify" runat="server" Text="Confirm Password:"></asp:Label>
                <br />
                <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <br />

                     
                <asp:Label class="formlabel" ID="roleLabel" runat="server" Text="Choose One:"></asp:Label>
                <br />
    
                 <asp:DropDownList ID="roleDropDownList" runat="server">
                    <asp:ListItem>Student</asp:ListItem>
                    <asp:ListItem>Supervisor</asp:ListItem>
                </asp:DropDownList>  <br />
                     <br />
    
              

                <p class="ml-1">Members have access to use wide variety of features at <u>Testing Tutor</u>.</p>

                <asp:Button ID="btnRegister" class="submitbtn" runat="server" Text="Submit" OnClick="btnRegister_Click" />
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                 <br />
                <asp:Button ID="btnLoginPage" class="lowbtn" runat="server" Font-Bold="True" Text="Login Page      " PostBackUrl="~/login.aspx" />
                <br />
                <asp:Button ID="btnForgotPassword" class="lowbtn" runat="server" Font-Bold="True" Text="Forgot Password?" PostBackUrl="~/login.aspx" />

                </form>
             </div>
         <!--
                                     <footer id="footer">
        <p style="color: rgb(147,147,147);">© 2019 Testing Tutor. All rights reserved.</p>
    </footer>
         
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


