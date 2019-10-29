using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class _register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string Password = txtPassword.Text;
        string Confirm = txtConfirm.Text;

        //if passwords don't match, then don't create user
        if (Password != Confirm)    
        {lblMessage.Text = "Passwords do not match"; return;}

        //if password is less than 8 characters, then don't create user
        if (Password.Length < 8)    
        {lblMessage.Text = "Password must be at least 8 characters"; return; }

        //if password doesn't contain a capital letter, then don't create user
        bool capCheck = false;
        char cap = 'A'; //start at ASCII 65 which is capital A
        while (!capCheck && cap <= 'Z')    //end at ASCII 90 which is capital Z
        {
            if (Password.Contains(cap))
            {capCheck = true;}
            cap++;
        }
        if(!capCheck)
        { lblMessage.Text = "Password must contain a capital letter"; return; }

        //if password doesn't contain a lowercase letter, then don't create user
        bool lowCheck = false;
        char low = 'a'; //start at ASCII 97 which is lowercase a
        while (!lowCheck && low <= 'z')    //end at ASCII 122 which is lowercase z
        {
            if (Password.Contains(low))
            { lowCheck = true; }
            low++;
        }
        if (!lowCheck)
        { lblMessage.Text = "Password must contain a lowercase letter"; return; }

        //if password doesn't contain a number character, then don't create user
        bool numCheck = false;
        char num = '0'; //start at ASCII 48 which is Zero
        while (!numCheck && num <= 57)    //end at ASCII 57 which is 9
        {
            if (Password.Contains(num))
            { numCheck = true; }
            num++;
        }
        if (!numCheck)
        { lblMessage.Text = "Password must contain a number character"; return; }

        //if password doesn't contain a special character, then don't create user
        bool spcCheck = false;
        char spc = '!'; //start at ASCII 33 which is !
        while (!spcCheck && spc <= '~')    //end at ASCII 126 which is ~
        {
            if (Password.Contains(spc))
            { spcCheck = true; }
            spc++;
            if ((spc >= '0') && (spc <= '9'))         //skip 48-57, number characters
            { spc = ':'; }
            else if ((spc >= 'A') && (spc <= 'Z'))    //skip 65-90, capital letters
            { spc = '['; }
            else if ((spc >= 'a') && (spc <= 'z'))    //skip 97-122, lowercase letters
            { spc = '{'; }
        }
        if (!spcCheck)
        { lblMessage.Text = "Password must contain a special character"; return; }

        if (clsDataLayer.checkUserIDExists(txtEmail.Text, Server.MapPath("NDSU Testing Tutor Tables.accdb")))
        { lblMessage.Text = "Email address already registered"; return; }

        Password = SHA512(Password);
        
        string FirstName = txtFirstName.Text;
        string LastName = txtLastName.Text;

        string StreetAddress = txtStreetAddress.Text;
        string City = txtCity.Text;
        string State = txtState.Text;
        string Zipcode = txtZipcode.Text;
        string Organization = txtOrganization.Text;
        string TelNumber = txtPhoneNum.Text;
        string UserRole = roleDropDownList.Text;
        
        string UserID = txtEmail.Text;

        bool success = clsDataLayer.register(Server.MapPath("NDSU Testing Tutor Tables.accdb"), FirstName, LastName, Password, UserID, StreetAddress, City, State, Zipcode, Organization, TelNumber, UserRole);

        if (success)
        {
            lblMessage.Text = "Registration successful,\nPlease go to log-in page";
        }
        else lblMessage.Text = "Registration failed";

    }
    public static string SHA512(string input)
    {
        var bytes = System.Text.Encoding.UTF8.GetBytes(input);
        using (var hash = System.Security.Cryptography.SHA512.Create())
        {
            var hashedInputBytes = hash.ComputeHash(bytes);

            // Convert to text
            // StringBuilder Capacity is 128, because 512 bits / 8 bits in byte * 2 symbols for byte 
            var hashedInputStringBuilder = new System.Text.StringBuilder(128);
            foreach (var b in hashedInputBytes)
                hashedInputStringBuilder.Append(b.ToString("X2"));
            return hashedInputStringBuilder.ToString();
        }
    }
}
