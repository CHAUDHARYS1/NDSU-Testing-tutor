<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ManageGroup.aspx.cs" Inherits="ManageGroup" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<style>
    .deleteIcon{
        font-size: 22px;
    }
    .deleteForever{
        font-size: 50px;
    }

    .tableHead th {
        color: #414141;
    }
    .groupName {
        color: #2F8051;
    }
    .icons {
        font-size: 18px;
    }
    .tableTitle {
        font-weight: 800;
        font-style: normal;
        font-family: 'Roboto Mono', monospace;

    }
</style>

    <style>
    .deleteBtn
    {
        background: transparent;
        color: red;
        cursor: pointer;
        border: none;
    }

    .deleteBtn:hover
    {
        opacity: .5;
    }

</style>

<!DOCTYPE html>

<div class="container mt-5 mb-5">
    <div class="text-center">
        <h3><asp:Label runat="server" id="lblUserName">FirstName</asp:Label></h3>
        <p>Here is a list of the groups you have joined.</p>
    </div>
    <form runat="server">
    <table class="table table-borderless text-center">
        <thead>
            <tr class="tableHead">
                <th scope="col" class="tableTitle">GROUP CODE:</th>
                <th scope="col" class="tableTitle">INSTRUCTOR EMAIL:</th>
                <th scope="col" class="tableTitle">GROUP NAME:</th>
                <th scope="col" class="tableTitle">DATE CREATED:</th>
                <th scope="col" class="tableTitle">GROUP COUNT:</th>
                <th scope="col" class="tableTitle">LEAVE GROUP:</th>

            </tr>
        </thead>
        <tbody class="border rounded">
           
            <asp:PlaceHolder ID="TablePlaceHolder" runat="server">
                    </asp:PlaceHolder>
        </tbody>
    </table>

    <!-- Modal -->
                    <div class="modal fade" id="deleteGroup" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Leave group?</h5>
                                 
                                </div>
                                <div class="modal-body">
                                    <i class="material-icons deleteForever">
                                        delete_forever
                                    </i>
                                     <label id="deleteModalMessage" runat="server">Are you sure you want to leave this group?</label>

                                </div>
                                <div class="modal-footer">
                                     <asp:button type="button" name="btnSave" id="btnSave" text="Cancel" class="btn btn-secondary" runat="server" OnClick="closeSave_Click"></asp:button>
                                    <asp:button type="button" name="btnDelete" id="btnDelete" text="Leave Group" class="btn btn-primary" runat="server" OnClick="deleteSave_Click"></asp:button>
                                </div>
                            </div>
                        </div>                       
                    </div>   
    </form>
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

    <script type="text/javascript"> 
        $(document).ready(function ShowPopup() {
            if ('<%= Session["groupManageStudentTempRow"] %>' != "")
            {
               $("#deleteGroup").modal('show');
            }
        });
     </script>
 </asp:Content>

