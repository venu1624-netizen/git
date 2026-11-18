using System;
using System.Configuration;
using System.Data.SqlClient;

namespace StudentManagementDB
{
    public partial class EditStudent : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                {
                    Response.Redirect("StudentList.aspx");
                    return;
                }

                int id;

                if (!int.TryParse(Request.QueryString["id"], out id))
                {
                    Response.Redirect("StudentList.aspx");
                    return;
                }

                LoadStudent(id);
            }
        }

        private void LoadStudent(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query =
                    "SELECT * FROM Students WHERE StudentID = @id";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@id", id);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    hfStudentID.Value = dr["StudentID"].ToString();

                    txtName.Text = dr["Name"].ToString();

                    txtAge.Text = dr["Age"].ToString();

                    txtClass.Text = dr["Class"].ToString();

                    txtEmail.Text = dr["Email"].ToString();
                }
                else
                {
                    Response.Redirect("StudentList.aspx");
                }

                dr.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int age;
            int id;

            if (!int.TryParse(hfStudentID.Value, out id) ||
                !int.TryParse(txtAge.Text, out age) ||
                age <= 0 || age > 120)
            {
                lblMessage.Text = "Enter valid student details.";
                return;
            }

            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtClass.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblMessage.Text = "Please fill all fields.";
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"UPDATE Students
                    SET Name = @Name,
                        Age = @Age,
                        Class = @Class,
                        Email = @Email
                    WHERE StudentID = @id";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Name",
                    txtName.Text.Trim());

                cmd.Parameters.AddWithValue("@Age", age);

                cmd.Parameters.AddWithValue("@Class",
                    txtClass.Text.Trim());

                cmd.Parameters.AddWithValue("@Email",
                    txtEmail.Text.Trim());

                cmd.Parameters.AddWithValue("@id", id);

                con.Open();

                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    Response.Redirect("StudentList.aspx");
                }
                else
                {
                    lblMessage.Text = "Student not updated.";
                }
            }
        }
    }
}