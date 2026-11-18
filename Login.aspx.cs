using System;
using System.Configuration;
using System.Data.SqlClient;

namespace StudentManagementDB
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager
            .ConnectionStrings["DBConnection"]
            .ConnectionString;

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT UserID, UserName, Role
                                 FROM Users
                                 WHERE UserName = @username
                                 AND Password = @password
                                 AND Role = 'Admin'";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@username", txtUserName.Text.Trim());

                cmd.Parameters.AddWithValue(
                    "@password", txtPassword.Text);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Session["UserID"] = dr["UserID"];
                    Session["UserName"] = dr["UserName"];

                    Response.Redirect("StudentList.aspx");
                }
                else
                {
                    lblMessage.Text =
                        "Invalid Username or Password!";
                }

                dr.Close();
            }
        }
    }
}