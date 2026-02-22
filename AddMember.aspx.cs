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
    public partial class AddMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void btnSave_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd1 = new SqlCommand("select PaKaPaTa from StudentTable where PaKaPaTa=@e1", conn);
            cmd1.Parameters.AddWithValue("@e1", txtPkpt.Text);
            SqlDataReader rdr = cmd1.ExecuteReader();

            if (rdr.Read())
            {
                Response.Write("<script>alert('This student is already exist!')</script>");
                txtName.Text = "";
                txtPkpt.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                ddSem.SelectedValue = "";
                ddDept.SelectedValue = "";
                ddSec.SelectedValue = "";
                txtAddress.Text = "";
            }

            else
            {

                if (!string.IsNullOrEmpty(txtPkpt.Text) && !string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtEmail.Text) && !string.IsNullOrEmpty(txtPhone.Text) && !string.IsNullOrEmpty(ddSem.SelectedValue) && !string.IsNullOrEmpty(ddSem.SelectedValue) && !string.IsNullOrEmpty(ddDept.SelectedValue) && !string.IsNullOrEmpty(ddSec.SelectedValue) && !string.IsNullOrEmpty(txtAddress.Text))
                {
                    rdr.Close();
                    SqlCommand cmd = new SqlCommand("insert into StudentTable(Name,PaKaPaTa,Email,PhoneNo,Semester,Department,Section,Address) values(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8)", conn);
                    cmd.Parameters.AddWithValue("@p1", txtName.Text);
                    cmd.Parameters.AddWithValue("@p2", txtPkpt.Text);
                    cmd.Parameters.AddWithValue("@p3", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@p4", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@p5", ddSem.SelectedValue);
                    cmd.Parameters.AddWithValue("@p6", ddDept.SelectedValue);
                    cmd.Parameters.AddWithValue("@p7", ddSec.SelectedValue);
                    cmd.Parameters.AddWithValue("@p8", txtAddress.Text);
                    cmd.ExecuteNonQuery();

                    //lblMesg2.Text = "Successfully added to table!";
                    Response.Write("<script>alert('Successfully added to table!')</script>");
                    show();
                    txtName.Text = "";
                    txtPkpt.Text = "";
                    txtEmail.Text = "";
                    txtPhone.Text = "";
                    ddSem.SelectedValue = "";
                    ddDept.SelectedValue = "";
                    ddSec.SelectedValue = "";
                    txtAddress.Text = "";
                }
                else
                {
                    lblMesg.Text = "Please fill the require field!";
                }
            }
        }

        void show()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from StudentTable", conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "bTable");
            conn.Close();
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Update(ds, "bTable");

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            lblMesg.Text = "";
            txtName.Text = "";
            txtPkpt.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            ddSem.SelectedIndex = 0;
            ddDept.SelectedIndex = 0;
            ddSec.SelectedIndex = 0;
            txtAddress.Text = "";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateMember.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteMember.aspx");
        }

    }
}