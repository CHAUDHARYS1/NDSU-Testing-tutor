using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string userID = txtUsername.Text;
        string Password = SHA512(txtPassword.Text);     

        bool success = clsDataLayer.login(userID, Password, Server.MapPath("NDSU Testing Tutor Tables.accdb"));        

        if (success)
        {
            Session["currentUserID"] = txtUsername.Text;
            Session["currentUserRole"] = clsDataLayer.getUserInfo("UserRole", userID, Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            Session["currentUserFirstName"] = clsDataLayer.getUserInfo("FirstName", userID, Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            Session["currentUserLastName"] = clsDataLayer.getUserInfo("LastName", userID, Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            clsDataLayer.logCurrentLoginTime(DateTime.Now, Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));

            Session["groupManageSupervisorTempRow"] = "";
            Session["groupManageStudentTempRow"] = "";

            if (Session["currentUserRole"].ToString() == "Supervisor")
            { Response.Redirect("IndexSupervisor.aspx"); }
            else 
            Response.Redirect("Index.aspx");
        }
        else lblMessage.Text = "Login failed";
    }

    protected void btnCreateAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }

    public static string SHA512(string input)
    {
        var bytes = System.Text.Encoding.UTF8.GetBytes(input);
        using (var hash = System.Security.Cryptography.SHA512.Create())
        {
            var hashedInputBytes = hash.ComputeHash(bytes);

            // Convert to text
            // StringBuilder Capacity is 128, because 512 bits / 8 bits in byte * 2 symbols for byte 
            var hashedInputStringBuilder = new System.Text.StringBuilder(128);
            foreach (var b in hashedInputBytes)
                hashedInputStringBuilder.Append(b.ToString("X2"));
            return hashedInputStringBuilder.ToString();
        }
    }
}