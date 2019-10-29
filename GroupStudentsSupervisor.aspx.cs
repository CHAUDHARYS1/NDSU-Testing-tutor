using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GroupStudentsSupervisor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["currentUserID"] == null) || (Session["currentUserRole"].ToString() != "Supervisor"))  //redirect to login if no on is logged in
        { Response.Redirect("Login.aspx"); }

        var groupCode = Request.QueryString;
        lblGroupID.Text = ("Group Code: " + groupCode.ToString() + "  -  " + clsDataLayer.getGroupName(groupCode.ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")).ToString());

        string tempTableHTML = convertDataTableToHTML(clsDataLayer.getStudentLists(groupCode.ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")));
        TablePlaceHolder.Controls.Add(new Literal { Text = tempTableHTML });
    }


    public string convertDataTableToHTML(DataTable dt)
    {
        string html = "";
        //add rows
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            html += "<tr>";
            for (int j = 0; j < (dt.Columns.Count -1) ; j++)
            {
                if (j == 0)
                { html += "<td>" + dt.Rows[i][j].ToString() + ", " + dt.Rows[i][j+1].ToString() + "</td>"; j++; }
                else
                { html += "<td>" + dt.Rows[i][j].ToString() + "</td>"; }
            }
            string tempTestResultID = "";
            string tempTestCaseID = "";
            if (dt.Rows[i][2].ToString() != "")
            {
                tempTestResultID = clsDataLayer.getMostRecentSubmission(dt.Rows[i][2].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
                tempTestCaseID = clsDataLayer.getTestCaseIDByTestResultID(Int32.Parse(tempTestResultID), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
                if (tempTestCaseID != "")
                { html += "<td>" + clsDataLayer.getTestCaseName(Int32.Parse(tempTestCaseID), Server.MapPath("NDSU Testing Tutor Tables.accdb")); }
                else
                { html += "<td>"; }
            }
            else
            { html += "<td>"; }
            html += "<a href=\"FeedbackSupervisor.aspx?" + tempTestResultID + "\"><i class=\"material-icons icons newTab\">open_in_new</i>" +
                    "</a><a href=\"HistorySupervisor.aspx?" + dt.Rows[i][dt.Columns.Count - 1].ToString() + "\"><i class=\"material-icons icons allFile\">call_to_action</i></a></td>";
            int counter = clsDataLayer.getUserHistory(dt.Rows[i][2].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")).Rows.Count;
            html += ("<td>" + counter + "</td>");
            html += "</tr>";
        }
        return html;
    }
}