using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            // Declares the DataSet
            dsUsers myDataSet = new dsUsers();
            // Fill the dataset with what is returned from the function
            myDataSet = clsDataLayer.GetUsers(Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            // Sets the DataGrid to the DataSource based on the table
            grdViewUsers.DataSource = myDataSet.Tables["Users"];
            // Binds the DataGrid
            grdViewUsers.DataBind();
        }

    }

    protected void grdUsers_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}