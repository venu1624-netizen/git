using System;
using System.Configuration;
using System.Data.SqlClient;

namespace StudentManagementDB
{
    public partial class AddStudent : System.Web.UI.Page
    {
        string cs = ConfigurationManager
            .ConnectionStrings["DBConnection"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int age;

            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtAge.Text) ||
                string.IsNullOrWhiteSpace(txtClass.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblMessage.Text = "Please fill all fields.";
                return;
            }

            if (!int.TryParse(txtAge.Text, out age) ||
                age <= 0 || age > 120)
            {
                lblMessage.Text = "Enter a valid age.";
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"INSERT INTO Students
                    (Name, Age, Class, Email)
                    VALUES
                    (@Name, @Age, @Class, @Email)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Name",
                    txtName.Text.Trim());

                cmd.Parameters.AddWithValue("@Age", age);

                cmd.Parameters.AddWithValue("@Class",
                    txtClass.Text.Trim());

                cmd.Parameters.AddWithValue("@Email",
                    txtEmail.Text.Trim());

                con.Open();

                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    Response.Redirect("StudentList.aspx");
                }
                else
                {
                    lblMessage.Text = "Student not inserted.";
                }
            }
        }
    }
}