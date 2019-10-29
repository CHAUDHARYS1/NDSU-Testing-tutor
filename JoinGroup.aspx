<%@ Page Title="" Language="C#"  MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="JoinGroup.aspx.cs" Inherits="JoinGroup" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <div class="container mt-5">
    <div class="row">

        <div class="col-lg-5 text p-5">
            <h3>Join a Group</h3>
            <p>Ask your Instructor for a private group code, or join any public group!</p>
            <div id="instructorInputs">
                <form class="mb-4" runat="server">
                    <asp:TextBox ID="codeText" class="underlineInputs ml-0" runat="server"></asp:TextBox><br><br />
                    <asp:Label Text="Enter Group Code Here" ID="lblMessage" runat="server"></asp:Label><br>
                    <asp:Button Text="JOIN" ID="btnJoin" runat="server" class="btnGold mt-4" onclick="btnJoin_ServerClick" />
                </form>
                <a href="#" class="secondnotes mt-5"><u>Click here to learn more about how this works</u></a>
            </div>
        </div>
        <div class="col-lg-7 p-5 bg-light">
            <h3>Public Groups</h3>
            <p>Find public groups to join!</p>
            <table class="table table-borderless text-center">
                <thead>
                    <tr class="tableHead">
                        <th scope="col" class="tableTitle">GROUP NAME:</th>
                        <th scope="col" class="tableTitle">INSTRUCTOR NAME:</th>
                        <th scope="col" class="tableTitle">GROUP CODE:</th>
                    </tr>
                </thead>
                <tbody class="border">

                 <asp:PlaceHolder ID="TablePlaceHolder" runat="server">
                    </asp:PlaceHolder>

                </tbody>

            </table>
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

