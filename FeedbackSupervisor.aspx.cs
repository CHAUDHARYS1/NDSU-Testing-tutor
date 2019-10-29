using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FeedbackSupervisor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["currentUserID"] == null) || (Session["currentUserRole"].ToString() != "Supervisor"))  //redirect to login if no on is logged in
        { Response.Redirect("Login.aspx"); }

        if (Request.QueryString.ToString().Length > 0)
        {
            var testResultID = Request.QueryString;
            DataTable tempTable = clsDataLayer.getTestResult(Int32.Parse(testResultID.ToString()), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            testResultTitle.InnerText = "Test ID: " + testResultID.ToString() + ", Date Submitted: " + tempTable.Rows[0][0].ToString();
            if (tempTable.Rows[0][1].ToString() != "")
            {
                codeSampleName.InnerText = clsDataLayer.getCodeSampleName(Int32.Parse(tempTable.Rows[0][1].ToString()), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
                codeSampleData.InnerText = clsDataLayer.getCodeSampleDataByID(Int32.Parse(tempTable.Rows[0][1].ToString()), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            }
            if (tempTable.Rows[0][2].ToString() != "")
            {
                testCaseName.InnerText = clsDataLayer.getTestCaseName(Int32.Parse(tempTable.Rows[0][2].ToString()), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
                testCaseData.InnerText = clsDataLayer.getTestCaseDataByID(Int32.Parse(tempTable.Rows[0][2].ToString()), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            }
            statementCoverageLabel.InnerText = tempTable.Rows[0][3].ToString();
            conditionalCoverageLabel.InnerText = tempTable.Rows[0][4].ToString();
            branchCoverageLabel.InnerText = tempTable.Rows[0][5].ToString();
        }
    }
}