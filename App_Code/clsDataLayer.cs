using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//include namespaces to enable database access.
using System.Data.OleDb;
using System.Net;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for clsDataLayer
/// </summary>
public class clsDataLayer
{ 
    public static dsUsers GetUsers(string Database)
    {
        // Add your comments here
        dsUsers DS;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;
        // Add your comments here
        sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Database);
        // Add your comments here
        sqlDA = new OleDbDataAdapter("select * from Users", sqlConn);
        // Add your comments here
        DS = new dsUsers();
        // Add your comments here
        sqlDA.Fill(DS.Users);
       //dd your comments here
        return DS;
    }
   
    public static bool checkUserIDExists(string userID, string database)
    {
        bool success;
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        conn.Open();
        OleDbCommand command = conn.CreateCommand();
        string strSQL;
        strSQL = "select * from Users where UserID = '" + userID + "'";
        command.CommandType = CommandType.Text;
        command.CommandText = strSQL;
        OleDbDataReader reader = command.ExecuteReader();
        if (reader.HasRows)
            success = true;
        else
            success = false;

        conn.Close();
        return success;
    }

    public static bool login(string userID, string password, string database)
    {
        bool success;
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;
            strSQL = "SELECT * FROM Users WHERE (UserID = '" + userID + "') AND (StrComp(UserPassword, '" + password + "', 0) = 0)";
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            OleDbDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            { success = true; }
            else
            { success = false; }
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();

            success = false;
        }
        
        return success;
    }

    public static bool logCurrentLoginTime(DateTime currentTime, string userID, string database)
    {
        bool success;

        //creating a transaction object
        OleDbTransaction myTransaction = null;

        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;

            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;

            strSQL = "UPDATE Users SET LastLogin = '" + currentTime + "' WHERE UserID = '" + userID + "'";
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            command.ExecuteNonQuery();
         

            myTransaction.Commit();
            conn.Close();
            success = true;
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();

            success = false;
        }
        return success;
    }

    public static string getUserInfo(string desiredField, string userID, string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        conn.Open();
        OleDbCommand command = conn.CreateCommand();
        command.CommandType = CommandType.Text;
        command.CommandText = "SELECT "+ desiredField + " FROM Users WHERE UserID = '" + userID + "'";
        OleDbDataReader reader = command.ExecuteReader();
        reader.Read();
        string returnField = reader[desiredField].ToString();
        conn.Close();
        return returnField;
    }

    public static string convertUserIndextoUserID(int userIndex, string database)
    {
        string returnField = "";
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT UserID FROM Users WHERE UserIndex = " + userIndex + "";
            OleDbDataReader reader = command.ExecuteReader();
            reader.Read();
            returnField = reader["UserID"].ToString();
            conn.Close();
            return returnField;
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return returnField;
    }

    public static bool updateUserInfo(string desiredField, string newValue, string userID, string database)
    {
        bool success;
        //creating a transaction object
        OleDbTransaction myTransaction = null;

        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;

            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;

            strSQL = "UPDATE Users SET " + desiredField + " = '" + newValue + "' WHERE UserID = '" + userID + "'";
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            command.ExecuteNonQuery();

            myTransaction.Commit();
            conn.Close();
            success = true;
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();

            success = false;
        }
        return success; 
    }

    public static DataTable getUserHistory(string userID, string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        DataTable dt = new DataTable();
        conn.Open();
        OleDbCommand command = conn.CreateCommand();
        command.CommandType = CommandType.Text;
        command.CommandText = string.Format("SELECT [Test_Result_ID], [Code_Sample_ID], [Test_Case_ID], TestDate, StatementCoverageScore, ConditionCoverageScore, BranchCoverageScore FROM [Test Results] WHERE UserID = '{0}' ORDER BY Test_Result_ID DESC", userID);
        OleDbDataAdapter da = new OleDbDataAdapter(command);
        da.Fill(dt);
        conn.Close();

        return dt;
    }

    public static DataTable getStudentGroups(string userID, string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = string.Format("SELECT G.GroupID, G.SupervisorID, G.GroupName, G.DateCreated FROM [Groups] G INNER JOIN [Student Groups] S ON G.GroupID = S.GroupID WHERE S.StudentID = '{0}' ORDER BY DateCreated DESC", userID);
            OleDbDataAdapter da = new OleDbDataAdapter(command);
            da.Fill(dt);
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return dt;
    }


    public static DataTable getStudentLists(string groupID, string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = string.Format("SELECT U.LastName, U.FirstName, U.UserID, U.LastLogin, U.UserIndex FROM [Users] U INNER JOIN [Student Groups] S ON U.UserID = S.StudentID WHERE S.GroupID = '" + groupID + "'");
            OleDbDataAdapter da = new OleDbDataAdapter(command);
            da.Fill(dt);
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return dt;
    }
    public static DataTable getAllStudents(string supervisorID, string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = string.Format("SELECT DISTINCT U.FirstName, U.LastName, U.UserID, U.LastLogin, U.UserIndex FROM ([Users] U INNER JOIN [Student Groups] S ON U.UserID = S.StudentID) INNER JOIN [Groups] G ON S.GroupID = G.GroupID WHERE G.SupervisorID = '" + supervisorID + "'");
            OleDbDataAdapter da = new OleDbDataAdapter(command);
            da.Fill(dt);
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return dt;
    }

    public static DataTable getAllMatchingStudentGroups(string supervisorID, string studentID,  string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = string.Format("SELECT G.GroupName FROM ([Groups] G INNER JOIN [Student Groups] S ON G.GroupID = S.GroupID) WHERE (G.SupervisorID = '" + supervisorID + "') AND (S.StudentID = '" + studentID + "')");
            OleDbDataAdapter da = new OleDbDataAdapter(command);
            da.Fill(dt);
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return dt;
    }

    public static DataTable getPublicGroups(string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = string.Format("SELECT G.GroupName, U.FirstName, U.LastName, G.GroupID FROM [Groups] G INNER JOIN [Users] U ON G.SupervisorID = U.UserID WHERE G.GroupVisibility = \"Public\"");
            OleDbDataAdapter da = new OleDbDataAdapter(command);
            da.Fill(dt);
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return dt;
    }

    public static DataTable getSupervisorGroups(string userID, string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = string.Format("SELECT G.GroupID, G.GroupName, G.DateCreated, G.GroupVisibility FROM [Groups] G WHERE G.SupervisorID = '{0}' ORDER BY DateCreated DESC", userID);
            OleDbDataAdapter da = new OleDbDataAdapter(command);
            da.Fill(dt);
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return dt;
    }

    public static DataTable getCodeSampleNames(string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = string.Format("SELECT CodeSampleName FROM [Code Samples]");
            OleDbDataAdapter da = new OleDbDataAdapter(command);
            da.Fill(dt);
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return dt;
    }

    public static string getGroupName(string groupID, string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        string returnField = "";
        try
        {
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT GroupName FROM [Groups] WHERE groupID = '" + groupID + "'";
            OleDbDataReader reader = command.ExecuteReader();
            reader.Read();
            returnField = reader["GroupName"].ToString();
            conn.Close();
            return returnField;
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return returnField;
    }

    public static string getMostRecentSubmission(string userID, string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        string returnField = "";
        try
        {
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT [Test_Result_ID] FROM [Test Results] WHERE UserID = '" + userID + "' ORDER BY TestDate DESC";
            OleDbDataReader reader = command.ExecuteReader();
            reader.Read();
            returnField = reader["Test_Result_ID"].ToString();
            conn.Close();
            return returnField;
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return returnField;
    }

    public static bool register(string database, string FirstName, string LastName, string Password, string UserID, string StreetAddress, string City, string State, string Zipcode, string Organization, string TelNumber, string UserRole)
    {
        bool success;

        //creating a transaction object
        OleDbTransaction myTransaction = null;
         
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;

      myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
                
            strSQL = "Insert into Users(UserID, UserPassword, FirstName, LastName, StreetAddress, City, State, Zipcode, Organization, TelNumber, UserRole)" + "values ('" + UserID + "', '" + Password + "', '" +  FirstName + "', '" + LastName + "', '" + StreetAddress + "', '" + City + "', '" + State + "', '" + Zipcode + "', '" + Organization + "', '" + TelNumber + "', '" + UserRole + "')";
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            command.ExecuteNonQuery();
            //strSQL = "Update Users  set UserPassword='" + Password + "' Where UserID='" + UserID + "'";     
            //command.CommandType = CommandType.Text;
            //command.CommandText = strSQL;
           // command.ExecuteNonQuery();

        myTransaction.Commit();
            conn.Close();
            success = true;
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();

            success = false;
        }
        return success;
    }

    public static bool checkGroupIDExists(string groupID, string database)
    {
        bool success;
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        conn.Open();
        OleDbCommand command = conn.CreateCommand();
        string strSQL;
        strSQL = "SELECT * FROM Groups WHERE GroupID = '" + groupID + "'";
        command.CommandType = CommandType.Text;
        command.CommandText = strSQL;
        OleDbDataReader reader = command.ExecuteReader();
        if (reader.HasRows)
            success = true;
        else
            success = false;

        conn.Close();
        return success;
    }

    public static bool studentGroupRegister(string StudentID, string groupID, string database)
    {
        bool success;
        //creating a transaction object
        OleDbTransaction myTransaction = null;
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;

            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;

            strSQL = "Insert into [Student Groups] " + "(StudentID, GroupID )" + "values ('" + StudentID + "', '" + groupID + "')";
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            command.ExecuteNonQuery();
            myTransaction.Commit();
            conn.Close();
            success = true;
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();

            success = false;
        }
        return success;
    }
    public static string createGroupSupervisor(string groupID, string supervisorID, string groupName, DateTime currentTime, string groupVisibility, string database)
    {
        string groupCode = "";
        //creating a transaction object
        OleDbTransaction myTransaction = null;
        //createGroup
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
   

            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            command.CommandType = CommandType.Text;
            command.CommandText = "INSERT into Groups (GroupID, SupervisorID, DateCreated, GroupName, GroupVisibility)" + "values ('" + groupID + "', '" + supervisorID + "', '" + currentTime + "', '" + groupName + "', '" + groupVisibility + "')";
            command.ExecuteNonQuery();
            myTransaction.Commit();

            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        //find generated group code
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT GroupID FROM [Groups] WHERE (SupervisorID = '" + supervisorID + "') AND (GroupName = '" + groupName + "')";
            OleDbDataReader reader = command.ExecuteReader();
            reader.Read();
            groupCode = reader["GroupID"].ToString();
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return groupCode;
    }

    public static void deleteGroupSupervisor(string groupID, string database)
    {
        //creating a transaction object
        OleDbTransaction myTransaction = null;
        //createGroup
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            command.CommandType = CommandType.Text;
            command.CommandText = "DELETE * FROM Groups WHERE GroupID = '" + groupID + "'";
            command.ExecuteNonQuery();
            myTransaction.Commit();
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        //find generated group code
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            command.CommandType = CommandType.Text;
            command.CommandText = "DELETE * FROM [Student Groups] WHERE GroupID = '" + groupID + "'";
            command.ExecuteNonQuery();
            myTransaction.Commit();
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
    }

    public static void leaveGroupStudent(string studentID, string groupID, string database)
    {
        //creating a transaction object
        OleDbTransaction myTransaction = null;
        //createGroup
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            command.CommandType = CommandType.Text;
            command.CommandText = "DELETE * FROM [Student Groups] WHERE StudentID = '" + studentID + "' AND GroupID = '" + groupID + "'";
            command.ExecuteNonQuery();
            myTransaction.Commit();
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
    }
    public static bool checkSupervisorGroupNameExists(string supervisorID, string groupName , string database)
    {
        bool success = false;

        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;
            strSQL = "SELECT * FROM [Groups] WHERE (SupervisorID = '" + supervisorID + "') AND (GroupName = '" + groupName + "')";
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            OleDbDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
                success = true;
            else
                success = false;

            conn.Close();    
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return success;
    }

    public static bool checkSupervisorGroupCodeExists(string groupID, string database)
    {
        bool success = false;

        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;
            strSQL = "SELECT * FROM [Groups] WHERE GroupID = '" + groupID + "'";
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            OleDbDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
                success = true;
            else
                success = false;

            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return success;
    }

    public static string submitTestCase(string userID, string testCaseName, string testCaseData, DateTime submitTime, string database)
    {
        string testCaseID = "";
        //creating a transaction object
        OleDbTransaction myTransaction = null;
        //createGroup
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();

            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            command.CommandType = CommandType.Text;
            command.CommandText = "INSERT into [Test Cases] (UserID, TestCaseName, TestCaseData, SubmitTime)" + "values ('" + userID + "', '" + testCaseName + "', '" + testCaseData + "', '" + submitTime + "')";
            command.ExecuteNonQuery();
            myTransaction.Commit();

            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }     
        //find generated Test_Case_ID
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT [Test_Case_ID] FROM [Test Cases] WHERE (UserID = '" + userID + "') AND (TestCaseName = '" + testCaseName + "')";
            OleDbDataReader reader = command.ExecuteReader();
            reader.Read();
            testCaseID = reader["Test_Case_ID"].ToString();
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
      
        return testCaseID;
    }

    public static string generateTestResult(string userID, DateTime testDate, string testCaseID, string codeSampleID, string statementCoverageScore, string conditionCoverageScore, string branchCoverageScore, string database)
    {
        string testResultID = "";
        //creating a transaction object
        OleDbTransaction myTransaction = null;
        //createGroup
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();

            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            command.CommandType = CommandType.Text;
            command.CommandText = "INSERT into [Test Results] (UserID, TestDate, [Test_Case_ID], [Code_Sample_ID], StatementCoverageScore, ConditionCoverageScore, BranchCoverageScore)" + "values ('" + userID + "', '" + testDate + "', '" + testCaseID + "', '" + codeSampleID + "', '" + statementCoverageScore + "', '" + conditionCoverageScore + "', '" + branchCoverageScore + "')";
            command.ExecuteNonQuery();
            myTransaction.Commit();

            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        //find generated test result code
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT [Test_Result_ID] FROM [Test Results] WHERE (UserID = '" + userID + "') AND (TestDate = #" + testDate + "#)";
            OleDbDataReader reader = command.ExecuteReader();
            reader.Read();
            testResultID = reader["Test_Result_ID"].ToString();
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return testResultID;
    }

    public static string getCodeSampleID(string codeSampleName, string database)
    {
        string codeSampleID = "";
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT [Code_Sample_ID] FROM [Code Samples] WHERE (CodeSampleName = '" + codeSampleName + "')";
            OleDbDataReader reader = command.ExecuteReader();
            reader.Read();
            codeSampleID = reader["Code_Sample_ID"].ToString();
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return codeSampleID;
    }

    public static string getCodeSampleName(int codeSampleID, string database)
    {
        string codeSampleName = "";
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT [CodeSampleName] FROM [Code Samples] WHERE ([Code_Sample_ID] = " + codeSampleID + ")";
            OleDbDataReader reader = command.ExecuteReader();
            reader.Read();
            codeSampleName = reader["CodeSampleName"].ToString();
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return codeSampleName;
    }
    public static string getTestCaseName(int testCaseID, string database)
    {
        string testCaseName = "";
        try
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT [TestCaseName] FROM [Test Cases] WHERE ([Test_Case_ID] = " + testCaseID + ")";
            OleDbDataReader reader = command.ExecuteReader();
            reader.Read();
            testCaseName = reader["TestCaseName"].ToString();
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return testCaseName;
    }

    public static DataTable getTestResult(int testResultID, string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = string.Format("SELECT TestDate, [Code_Sample_ID], [Test_Case_ID], StatementCoverageScore, ConditionCoverageScore, BranchCoverageScore FROM [Test Results] WHERE [Test_Result_ID] = " + testResultID);
            OleDbDataAdapter da = new OleDbDataAdapter(command);
            da.Fill(dt);
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return dt;
    }

    public static string getCodeSampleData(string codeSampleName, string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        string CodeSampleData = "";
        try
        {
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT CodeSampleData FROM [Code Samples] WHERE CodeSampleName = '" + codeSampleName + "'";
            OleDbDataReader reader = command.ExecuteReader();
            reader.Read();
            CodeSampleData = reader["CodeSampleData"].ToString();
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return CodeSampleData;
    }

    public static string getCodeSampleDataByID(int codeSampleID, string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        string CodeSampleData = "";
        try
        {
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT CodeSampleData FROM [Code Samples] WHERE [Code_Sample_ID] = " + codeSampleID;
            OleDbDataReader reader = command.ExecuteReader();
            reader.Read();
            CodeSampleData = reader["CodeSampleData"].ToString();
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return CodeSampleData;
    }

    public static string getTestCaseDataByID(int testCaseID, string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        string TestCodeData = "";
        try
        {
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT TestCaseData FROM [Test Cases] WHERE [Test_Case_ID] = " + testCaseID;
            OleDbDataReader reader = command.ExecuteReader();
            reader.Read();
            TestCodeData = reader["TestCaseData"].ToString();
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return TestCodeData;
    }

    public static string getTestCaseIDByTestResultID(int testResultID, string database)
    {
        OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + database);
        string testCaseID = "";
        try
        {
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT [Test_Case_ID] FROM [Test Results] WHERE [Test_Result_ID] = " + testResultID;
            OleDbDataReader reader = command.ExecuteReader();
            reader.Read();
            testCaseID = reader["Test_Case_ID"].ToString();
            conn.Close();
        }
        catch (Exception ex)
        {
            string temp = ex.ToString();
        }
        return testCaseID;
    }
}