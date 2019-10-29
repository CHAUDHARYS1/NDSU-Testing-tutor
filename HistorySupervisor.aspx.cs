using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HistorySupervisor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["currentUserID"] == null) || (Session["currentUserRole"].ToString() != "Supervisor"))  //redirect to login if no on is logged in
        { Response.Redirect("Login.aspx"); }

        var studentIndex = Request.QueryString.ToString();

        if (studentIndex != "")
        {
            string studentID = clsDataLayer.convertUserIndextoUserID(Int32.Parse(studentIndex), Server.MapPath("NDSU Testing Tutor Tables.accdb"));

            //fill in first and/or last name if there is one in the database for current user
            string nameConcat = "";
            if (clsDataLayer.getUserInfo("FirstName", studentID, Server.MapPath("NDSU Testing Tutor Tables.accdb")) != null)
            { nameConcat += nameConcat = clsDataLayer.getUserInfo("FirstName", studentID, Server.MapPath("NDSU Testing Tutor Tables.accdb")) + " "; }
            if (clsDataLayer.getUserInfo("LastName", studentID, Server.MapPath("NDSU Testing Tutor Tables.accdb")) != null)
            { nameConcat += clsDataLayer.getUserInfo("LastName", studentID, Server.MapPath("NDSU Testing Tutor Tables.accdb")); }
            lblUserName.Text = nameConcat;

            string tempTableHTML = convertDataTableToHTML(clsDataLayer.getUserHistory(studentID, Server.MapPath("NDSU Testing Tutor Tables.accdb")));
            TablePlaceHolder.Controls.Add(new Literal { Text = tempTableHTML });
        }
        else
        {
            //fill in first and/or last name if there is one in the database for current user
            string nameConcat = "";
            if (Session["currentUserFirstName"] != null)
            { nameConcat += nameConcat = Session["currentUserFirstName"].ToString() + " "; }
            if (Session["currentUserLastName"] != null)
            { nameConcat += Session["currentUserLastName"].ToString(); }
            lblUserName.Text = nameConcat;

            string tempTableHTML = convertDataTableToHTML(clsDataLayer.getUserHistory(Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")));
            TablePlaceHolder.Controls.Add(new Literal { Text = tempTableHTML });
        }
    }


    public string convertDataTableToHTML(DataTable dt)
    {
        string html = "";
        //add rows
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            html += "<tr>";
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                if ((j == 1) && (dt.Rows[i][j].ToString() != ""))
                { html += "<td>" + clsDataLayer.getCodeSampleName(Int32.Parse(dt.Rows[i][j].ToString()), Server.MapPath("NDSU Testing Tutor Tables.accdb")) + "</td>"; }
                else if ((j == 2) && (dt.Rows[i][j].ToString() != ""))
                { html += "<td>" + clsDataLayer.getTestCaseName(Int32.Parse(dt.Rows[i][j].ToString()), Server.MapPath("NDSU Testing Tutor Tables.accdb")) + "</td>"; }
                else
                { html += "<td>" + dt.Rows[i][j].ToString() + "</td>"; }
            }
            html += ("<td><a href=\"FeedbackSupervisor.aspx?" + dt.Rows[i][0].ToString() +
                     "\" class=\"btn m-0 p-0\"><i class=\"material-icons icons newTab\">open_in_new</i></a></td>");
            html += "</tr>";
        }
        return html;
    }
}