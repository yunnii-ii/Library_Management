using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Mini_LibraryManagementSystem
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserName"] = txtName.Text;
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void txtLogin_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from AdmTable where Email=@e1 and Password=@p2", conn);
                cmd.Parameters.AddWithValue("@e1", txtEmail.Text);
                cmd.Parameters.AddWithValue("@p2", txtPassword.Text);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Session["Email"] = txtEmail.Text;
                    Response.Write("<script>alert('Login successfully!')</script>");
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Write("<script> alert('Unsuccessful login!')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('An error occured: " + ex.Message + "')</script>");
            }
            finally
            {
                if (conn.State == System.Data.ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            //txtPassword.PasswordChar = CheckBox1.Checked ? '\0' : '*';
        }
    }
}