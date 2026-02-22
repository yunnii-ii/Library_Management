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
    public partial class AddAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void btnSign_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd1 = new SqlCommand("select Email from AdmTable where Email=@e1", conn);
            cmd1.Parameters.AddWithValue("@e1", txtEmail.Text);
            SqlDataReader rdr = cmd1.ExecuteReader();

            if (rdr.Read())
            {
                Response.Write("<script>alert('This user is already exist!')</script>");
                txtName.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                txtPassword.Text = "";
            }

            else
            {
                rdr.Close();
                if (!string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtEmail.Text) && !string.IsNullOrEmpty(txtPhone.Text) && !string.IsNullOrEmpty(txtPassword.Text))
                {
                    SqlCommand cmd = new SqlCommand("insert into AdmTable(Name,Email,Phone_no,Password) values(@p1,@p2,@p3,@p4)", conn);
                    cmd.Parameters.AddWithValue("@p1", txtName.Text);
                    cmd.Parameters.AddWithValue("@p2", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@p3", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@p4", txtPassword.Text);
                    cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Insert Successfully!')</script>");
                    show();
                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtPhone.Text = "";
                    txtPassword.Text = "";
                    txtCfPassword.Text = "";
                }
                else
                {
                    lblMesg.Text = "Please fill require field.";
                }
            }
        }
        void show() 
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from AdmTable", conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "bTable");
            conn.Close();
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Update(ds, "bTable");

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtPassword.Text = "";
            txtCfPassword.Text = "";
            lblMesg.Text = "";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateAdmin.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteAdmin.aspx");
        }
    }
}