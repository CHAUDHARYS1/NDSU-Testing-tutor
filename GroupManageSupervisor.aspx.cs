using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GroupManageSupervisor : System.Web.UI.Page
{
    DataTable pageTableData;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["currentUserID"] == null) || (Session["currentUserRole"].ToString() != "Supervisor"))  //redirect to login if no on is logged in
        { Response.Redirect("Login.aspx"); }

        //fill in first and/or last name if there is one in the database for current user
        string nameConcat = "";
        if (Session["currentUserFirstName"] != null)
        { nameConcat += nameConcat = Session["currentUserFirstName"].ToString() + " "; }
        if (Session["currentUserLastName"] != null)
        { nameConcat += Session["currentUserLastName"].ToString(); }
        lblUserName.Text = nameConcat;

        pageTableData = clsDataLayer.getSupervisorGroups(Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
        convertDataTableToHTMLTable(pageTableData);
    }

    public void convertDataTableToHTMLTable(DataTable dt)
    {   
        string html = "";
        //add rows
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            html += "<tr>";
            for (int j = 0; j < dt.Columns.Count; j++)
            { html += "<td>" + dt.Rows[i][j].ToString() + "</td>"; }
            int counter = clsDataLayer.getStudentLists(dt.Rows[i][0].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")).Rows.Count;
            html += ("<td>" + counter + "</td>");
            html += ("<td><a href=\"GroupStudentsSupervisor.aspx?" + dt.Rows[i][0].ToString() +
                     "\" class=\"btn m-0 p-0\"><i class=\"material-icons icons newTab\">open_in_new</i></a></td><td>");
            TablePlaceHolder.Controls.Add(new Literal { Text = html });

            Button deleteGroupButton = new Button();
            deleteGroupButton.Text = "X";
            deleteGroupButton.CssClass = "deleteBtn";
            deleteGroupButton.ID = dt.Rows[i][0].ToString();
            deleteGroupButton.Click += new EventHandler(deleteIconClick);
            TablePlaceHolder.Controls.Add(deleteGroupButton);
            /*
            html += ("<td><button runat=\"server\" type= \"button\" class=\"btn m-0 p-0\" data-toggle=\"modal\" data-target=\"#deleteGroup\">" +
                     "<i class=\"material-icons icons text-danger deleteIcon\">delete</i></button></td>");
            */
            html = "</td></tr>";
            TablePlaceHolder.Controls.Add(new Literal { Text = html });
        }
    }

    protected void deleteIconClick(object sender, EventArgs e)
    {
        Button button = (Button)sender;
        Session["groupManageSupervisorTempRow"] = button.ID.ToString();
        deleteModalMessage.InnerText = "Delete group " + Session["groupManageSupervisorTempRow"].ToString() + ", " + clsDataLayer.getGroupName(Session["groupManageSupervisorTempRow"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")) + "?";
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
    }
    protected void deleteSave_Click(object sender, EventArgs e)
    {
        clsDataLayer.deleteGroupSupervisor(Session["groupManageSupervisorTempRow"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
        Session["groupManageSupervisorTempRow"] = "";
        Page.Response.Redirect(Page.Request.Url.ToString(), true);
    }
    protected void cancelSave_Click(object sender, EventArgs e)
    {
        Session["groupManageSupervisorTempRow"] = "";   
    }
  
}