using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoinGroup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["currentUserID"] == null) || (Session["currentUserRole"].ToString() != "Student"))  //redirect to login if no on is logged in
        { Response.Redirect("Login.aspx"); }

        string tempTableHTML = convertDataTableToHTML(clsDataLayer.getPublicGroups(Server.MapPath("NDSU Testing Tutor Tables.accdb")));
        TablePlaceHolder.Controls.Add(new Literal { Text = tempTableHTML });
    }

    protected void btnJoin_ServerClick(object sender, EventArgs e)
    {
        if (clsDataLayer.checkGroupIDExists(codeText.Text, Server.MapPath("NDSU Testing Tutor Tables.accdb")))
        {
            if(clsDataLayer.studentGroupRegister(Session["currentUserID"].ToString(), codeText.Text, Server.MapPath("NDSU Testing Tutor Tables.accdb")))
            { lblMessage.Text = "Group Registration Succesful"; return; }
            else
            { lblMessage.Text = "Already Registered To This Group"; return; }
        }
        else
        { lblMessage.Text = "No Matching Group Found"; return; }
    }

    public static string convertDataTableToHTML(DataTable dt)
    {
        string html = "";
        //add rows
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            html += "<tr>";
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                if (j == 1) //combine first and lat name
                { html += "<td>" + dt.Rows[i][j].ToString() + " " + dt.Rows[i][(j+1)].ToString() + "</td>"; j++; }
                else
                { html += "<td>" + dt.Rows[i][j].ToString() + "</td>"; } 
            }
            html += "</tr>";
        }
        return html;
    }
}