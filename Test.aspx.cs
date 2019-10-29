using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;
using System.Data;
using System.IO;
using System.Activities;
using System.Text;
using System.Activities.Expressions;

public partial class Test : System.Web.UI.Page
{
    string name = "";
    //protected System.Web.UI.HtmlControls.HtmlInputFile File1;
    //protected System.Web.UI.HtmlControls.HtmlInputButton Submit1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["currentUserID"] == null) || (Session["currentUserRole"].ToString() != "Student"))  //redirect to login if no on is logged in
        { Response.Redirect("Login.aspx"); }

        string tempTableHTML = convertDataTableToHTMLMax2(clsDataLayer.getUserHistory(Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")));
        TablePlaceHolder.Controls.Add(new Literal { Text = tempTableHTML });

        //load code sample dropdown list
        if (codeSamplesDropDownList.SelectedIndex <= 0)
        {
            codeSamplesDropDownList.Items.Clear();
            DataTable tempCodeSampleNames = clsDataLayer.getCodeSampleNames(Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            codeSamplesDropDownList.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            for (int i = 0; i < tempCodeSampleNames.Rows.Count; i++)
            { codeSamplesDropDownList.Items.Add(new ListItem(tempCodeSampleNames.Rows[i][0].ToString())); }
            codeSampleData.InnerText = "";
        }


    }

    protected void existingFileSubmit_click(object sender, EventArgs e)
    {
        if (codeSamplesDropDownList.SelectedIndex == 0)
        { lblMessage.Text = "You must select a test file"; }
        //else if (inputGroupFile02. == "")
        //{ lblMessage.Text = "You must select a test case file to submit"; }
        else
        {
            if ((inputGroupFile02.PostedFile != null) && (inputGroupFile02.PostedFile.ContentLength > 0))
            {
                string filePath = Server.MapPath("~/TempTestCases/") + Path.GetFileName(inputGroupFile02.PostedFile.FileName);
                inputGroupFile02.PostedFile.SaveAs(filePath);

                string testCodeData = "";


                char ch;
                StreamReader reader;
                reader = new StreamReader(filePath);
                while (!reader.EndOfStream)
                {
                    ch = (char)reader.Read();
                    if (ch == '\'')
                    {
                        testCodeData += "\'";
                        testCodeData += ch;
                    }
                    else if (ch == '\"')
                    {
                        testCodeData += "\"";
                        testCodeData += ch;
                    }
                    else
                    { testCodeData += ch; }
                  
                }
                reader.Close();
                reader.Dispose();
                

                Random random = new Random();
                string tempTestCaseID = clsDataLayer.submitTestCase(Session["currentUserID"].ToString(), inputGroupFile02.PostedFile.FileName, testCodeData, DateTime.Now, Server.MapPath("NDSU Testing Tutor Tables.accdb"));
                lblMessage.Text = "Test Case Submitted,";

                string tempTestResultID = clsDataLayer.generateTestResult(Session["currentUserID"].ToString(), DateTime.Now, tempTestCaseID, clsDataLayer.getCodeSampleID(codeSamplesDropDownList.SelectedValue.ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")), random.Next(50, 101) + "%", random.Next(50, 101) + "%", random.Next(50, 101) + "%", Server.MapPath("NDSU Testing Tutor Tables.accdb"));
                lblMessage.Text += "    Test Result ID: " + tempTestResultID;

            }
            else
            { lblMessage.Text = "Please select a valid file"; }
        }    
    }

    protected void codeEditorSubmit_click(object sender, EventArgs e)
    {
        if (codeSamplesDropDownList.SelectedIndex == 0)
        { lblMessage.Text = "You must select a test file"; }
        else if ((codeTextBox.Text == "") || (codeTextBox.Text == "Begin to write your code here"))
        { lblMessage.Text = "You must enter some test code"; }
        else if (testCaseName.Text == "")
        { lblMessage.Text = "You must specify a name"; }
        else
        {
            Random random = new Random();
            string tempTestCaseID = clsDataLayer.submitTestCase(Session["currentUserID"].ToString(), testCaseName.Text, codeTextBox.Text, DateTime.Now, Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            lblMessage.Text = "Test Case Submitted,";

            //currently gives three random scores, file assessment/comparison for grades would happen here before database [Test Result] entry
            string tempTestResultID = clsDataLayer.generateTestResult(Session["currentUserID"].ToString(), DateTime.Now, tempTestCaseID, clsDataLayer.getCodeSampleID(codeSamplesDropDownList.SelectedValue.ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")), random.Next(50, 101) + "%", random.Next(50, 101) + "%", random.Next(50, 101) + "%", Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            lblMessage.Text += "    Test Result ID: " + tempTestResultID;
        }
    }
    public string convertDataTableToHTMLMax2(DataTable dt)
    {
        string html = "";
        //add rows
        for (int i = 0; (i < dt.Rows.Count) && (i < 2); i++)    //generate a max of two rows
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
            html += "</tr>";
        }
        return html;
    }
    protected void codeSamplesDropDownList_Change(object sender, EventArgs e)
    {
        codeSampleData.InnerText = clsDataLayer.getCodeSampleData(codeSamplesDropDownList.SelectedItem.Value.ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
    }
}


