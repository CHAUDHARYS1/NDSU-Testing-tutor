using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageGroup : System.Web.UI.Page
{
    DataTable pageTableData;

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["currentUserID"] == null) || (Session["currentUserRole"].ToString() != "Student"))  //redirect to login if no on is logged in
        { Response.Redirect("Login.aspx"); }

        //fill in first and/or last name if there is one in the database for current user
        string nameConcat = "";
        if (Session["currentUserFirstName"] != null)
        { nameConcat += nameConcat = Session["currentUserFirstName"].ToString() + " "; }
        if (Session["currentUserLastName"] != null)
        { nameConcat += Session["currentUserLastName"].ToString(); }
        lblUserName.Text = nameConcat;

        //get table data from database
        pageTableData = clsDataLayer.getStudentGroups(Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
        convertDataTableToHTML(pageTableData);
    }

    public void convertDataTableToHTML(DataTable dt)
    {
        string html = "";
        //add rows
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            html += "<tr>";
            for (int j = 0; j < dt.Columns.Count; j++)
            { html += "<td>" + dt.Rows[i][j].ToString() + "</td>"; }
            int counter = clsDataLayer.getStudentLists(dt.Rows[i][0].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")).Rows.Count;
            html += ("<td>" + counter + "</td><td>");
            TablePlaceHolder.Controls.Add(new Literal { Text = html });

            Button deleteGroupButton = new Button();
            deleteGroupButton.Text = "X";
            deleteGroupButton.CssClass = "deleteBtn";
            deleteGroupButton.ID = dt.Rows[i][0].ToString();
            deleteGroupButton.Click += new EventHandler(deleteIconClick);
            TablePlaceHolder.Controls.Add(deleteGroupButton);
          
            html = "</td></tr>";
            TablePlaceHolder.Controls.Add(new Literal { Text = html });
        }
    }
    protected void deleteIconClick(object sender, EventArgs e)
    {
        Button button = (Button)sender;
        Session["groupManageStudentTempRow"] = button.ID.ToString();
        deleteModalMessage.InnerText = "Leave group " + Session["groupManageStudentTempRow"].ToString() + ", " + clsDataLayer.getGroupName(Session["groupManageStudentTempRow"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")) + "?";
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
    }
    protected void deleteSave_Click(object sender, EventArgs e)
    {
        clsDataLayer.leaveGroupStudent(Session["currentUserID"].ToString(), Session["groupManageStudentTempRow"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
        Session["groupManageStudentTempRow"] = "";
        Page.Response.Redirect(Page.Request.Url.ToString(), true);
    }
    protected void closeSave_Click(object sender, EventArgs e)
    {
        Session["groupManageStudentTempRow"] = "";
    }
}