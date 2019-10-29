<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="History" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <form id="form1" runat="server">
 
                  <div class="text-center container mt-5"><asp:label ID="lblUserName" runat="server" style="letter-spacing: 4px;">–Name of User–</asp:label>
    <h2 class="p-2">YOUR RECENT ACTIVITY:</h2>
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
                        <th>View Feedback:</th>
                    </tr>
                </thead>
                <tbody class="text-monospace">

           <asp:PlaceHolder ID="TablePlaceHolder" runat="server">
                    </asp:PlaceHolder>

                    </tbody>
        </table>
    </div>
    <p>Just so you know, you can see your individual file feedback by clicking this icon <i class="material-icons icons newTab">open_in_new</i></p>
</div>
    <footer id="footer">
        <p style="color: rgb(147,147,147);">© 2019 Testing Tutor. All rights reserved.</p>
    </footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/@bootstrapstudio/bootstrap-better-nav/dist/bootstrap-better-nav.min.js"></script>
    <script src="assets/js/myjs.js"></script>

    </form>

</asp:Content>


