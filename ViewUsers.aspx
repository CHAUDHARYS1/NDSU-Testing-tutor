<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewUsers.aspx.cs" Inherits="ViewUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 350px;
            height: 304px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <img alt="" class="auto-style1" longdesc="http://localhost:56995/Images/image1.jpeg.png" src="Images/image1.jpeg.png" /><asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            View Users<asp:GridView ID="grdViewUsers" runat="server" OnSelectedIndexChanged="grdUsers_SelectedIndexChanged">
            </asp:GridView>
            <br />
        </asp:Panel>
    </form>
</body>
</html>
