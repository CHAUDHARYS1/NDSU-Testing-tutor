using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GroupCodesSupervisor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["currentUserID"] == null) || (Session["currentUserRole"].ToString() != "Supervisor"))  //redirect to login if no on is logged in
        { Response.Redirect("Login.aspx"); }
    }

    protected void btnCreateGroup_Click(object sender, EventArgs e)
    {
        if (groupName.Text != "")
        {
            if (clsDataLayer.checkSupervisorGroupNameExists(Session["currentUserID"].ToString(), groupName.Text, Server.MapPath("NDSU Testing Tutor Tables.accdb")))
            { lblMessage.Text = "You alread have a group with that name"; }
            else
            {
                string tempCode;
                do
                {
                    Random random = new Random();
                    tempCode = "C";
                    tempCode += random.Next(9999, 100000);
                }
                while (clsDataLayer.checkSupervisorGroupCodeExists(tempCode, Server.MapPath("NDSU Testing Tutor Tables.accdb")));

                groupCode.Text = clsDataLayer.createGroupSupervisor(tempCode, Session["currentUserID"].ToString(), groupName.Text, DateTime.Now, RadioButtonList1.SelectedValue.ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
                lblMessage.Text = "Group created";
            }
        }
        else
        { lblMessage.Text = "Please enter a name"; }
    }
}