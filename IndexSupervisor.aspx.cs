using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IndexSupervisor : System.Web.UI.Page
{
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
    }
}