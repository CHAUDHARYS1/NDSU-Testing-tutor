using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["currentUserID"] == null) || (Session["currentUserRole"].ToString() != "Student"))  //redirect to login if no on is logged in
        { Response.Redirect("Login.aspx"); }

        updateFields();
    }
    protected void btnSaveProfile_Click(object sender, EventArgs e)
    {
        profileLabel.Text = "NOTE: IF YOU DO NOT PRESS SAVE AFTER CHANGING YOUR INFORMATION, IT WILL NOT SAVE.";

        if (firstNameBox.Text != clsDataLayer.getUserInfo("FirstName", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")))
        {
            clsDataLayer.updateUserInfo("FirstName", firstNameBox.Text, Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            profileLabel.Text = "Profile Saved";
        }
        if (lastNameBox.Text != clsDataLayer.getUserInfo("LastName", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")))
        {
            clsDataLayer.updateUserInfo("Lastname", lastNameBox.Text, Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            profileLabel.Text = "Profile Saved";
        }
        if (emailBox.Text != clsDataLayer.getUserInfo("UserID", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")))
        {
            clsDataLayer.updateUserInfo("UserID", emailBox.Text, Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            profileLabel.Text = "Profile Saved";
        }
        if (streetAddressBox.Text != clsDataLayer.getUserInfo("StreetAddress", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")))
        {
            clsDataLayer.updateUserInfo("StreetAddress", streetAddressBox.Text, Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            profileLabel.Text = "Profile Saved";
        }
        if (cityBox.Text != clsDataLayer.getUserInfo("City", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")))
        {
            clsDataLayer.updateUserInfo("City", cityBox.Text, Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            profileLabel.Text = "Profile Saved";
        }
        if (stateBox.Text != clsDataLayer.getUserInfo("State", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")))
        {
            clsDataLayer.updateUserInfo("State", stateBox.Text, Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            profileLabel.Text = "Profile Saved";
        }
        if (zipcodeBox.Text != clsDataLayer.getUserInfo("Zipcode", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")))
        {
            clsDataLayer.updateUserInfo("Zipcode", zipcodeBox.Text, Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            profileLabel.Text = "Profile Saved";
        }
        if (phoneNumberBox.Text != clsDataLayer.getUserInfo("TelNumber", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")))
        {
            clsDataLayer.updateUserInfo("TelNumber", phoneNumberBox.Text, Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            profileLabel.Text = "Profile Saved";
        }
        updateFields();
    }

    protected void btnPasswordChange_Click(object sender, EventArgs e)
    {
        string currentPassword = SHA512(currentPasswordBox.Text);

        if (currentPassword == clsDataLayer.getUserInfo("UserPassword", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb")))
        {
            if ((newPasswordBox.Text == retypeNewPasswordBox.Text) && (newPasswordBox.Text != currentPasswordBox.Text))
            {
                //if password is less than 8 characters, then don't create user
                if (newPasswordBox.Text.Length < 8)
                { passwordLabel.Text = "Password must be at least 8 characters"; return; }

                //if password doesn't contain a capital letter, then don't create user
                bool capCheck = false;
                char cap = 'A'; //start at ASCII 65 which is capital A
                while (!capCheck && cap <= 'Z')    //end at ASCII 90 which is capital Z
                {
                    if (newPasswordBox.Text.Contains(cap))
                    { capCheck = true; }
                    cap++;
                }
                if (!capCheck)
                { passwordLabel.Text = "Password must contain a capital letter"; return; }

                //if password doesn't contain a lowercase letter, then don't create user
                bool lowCheck = false;
                char low = 'a'; //start at ASCII 97 which is lowercase a
                while (!lowCheck && low <= 'z')    //end at ASCII 122 which is lowercase z
                {
                    if (newPasswordBox.Text.Contains(low))
                    { lowCheck = true; }
                    low++;
                }
                if (!lowCheck)
                { passwordLabel.Text = "Password must contain a lowercase letter"; return; }

                //if password doesn't contain a number character, then don't create user
                bool numCheck = false;
                char num = '0'; //start at ASCII 48 which is Zero
                while (!numCheck && num <= 57)    //end at ASCII 57 which is 9
                {
                    if (newPasswordBox.Text.Contains(num))
                    { numCheck = true; }
                    num++;
                }
                if (!numCheck)
                { passwordLabel.Text = "Password must contain a number character"; return; }

                //if password doesn't contain a special character, then don't create user
                bool spcCheck = false;
                char spc = '!'; //start at ASCII 33 which is !
                while (!spcCheck && spc <= '~')    //end at ASCII 126 which is ~
                {
                    if (newPasswordBox.Text.Contains(spc))
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
                { passwordLabel.Text = "Password must contain a special character"; return; }
                
                string newPassword = SHA512(newPasswordBox.Text);
                string retypeNewPassword = SHA512(retypeNewPasswordBox.Text);

                clsDataLayer.updateUserInfo("UserPassword", newPassword, Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
                passwordLabel.Text = "Password Changed";
                currentPasswordBox.Text = "";
                newPasswordBox.Text = "";
                retypeNewPasswordBox.Text = "";
            }
            else if (newPasswordBox.Text != retypeNewPasswordBox.Text)
            { passwordLabel.Text = "New Passwords Don't Match"; }
            else
            { passwordLabel.Text = "New Password Matches Old Password"; }
        }
        else
        { passwordLabel.Text = "Wrong Current Password"; }


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

    public void updateFields()
    {
        if (!IsPostBack)
        {
            firstNameBox.Text = clsDataLayer.getUserInfo("FirstName", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            lastNameBox.Text = clsDataLayer.getUserInfo("LastName", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            emailBox.Text = clsDataLayer.getUserInfo("UserID", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            streetAddressBox.Text = clsDataLayer.getUserInfo("StreetAddress", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            cityBox.Text = clsDataLayer.getUserInfo("City", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            stateBox.Text = clsDataLayer.getUserInfo("State", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            zipcodeBox.Text = clsDataLayer.getUserInfo("Zipcode", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
            phoneNumberBox.Text = clsDataLayer.getUserInfo("TelNumber", Session["currentUserID"].ToString(), Server.MapPath("NDSU Testing Tutor Tables.accdb"));
        }
    }
}