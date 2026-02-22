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
    public partial class UpdateAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void txtId_TextChanged(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from AdmTable where Id=@c1", conn);
                cmd.Parameters.AddWithValue("@c1", txtId.Text);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtId.Text = dr["Id"].ToString();
                    txtName.Text = dr["Name"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtPhone.Text = dr["Phone_no"].ToString();
                    txtPassword.Attributes["value"] = dr["Password"].ToString();
                    txtCfPassword.Attributes["value"] = dr["Password"].ToString();
                }
                else
                {
                    lblMesg.Text = "User not found!";
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                lblMesg.Text = "Error: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
                conn.Open();
                if (!string.IsNullOrEmpty(txtId.Text))
                {
                    SqlCommand cmd = new SqlCommand("update AdmTable set Name=@t1 , Email=@t2 , Phone_no=@t3, Password=@t4 where Id=@t5", conn);
                    cmd.Parameters.AddWithValue("@t1", txtName.Text);
                    cmd.Parameters.AddWithValue("@t2", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@t3", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@t4", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@t5", txtId.Text);

                    cmd.ExecuteNonQuery();
                    Response.Redirect("AddAdmin.aspx");
                }
                else
                {
                    lblMesg.Text = "Please fill the require field!";
                }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtId.Text = "";
            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtPassword.Attributes["value"] = "";
            txtCfPassword.Attributes["value"] = "";
            lblMesg.Text = "";
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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddAdmin.aspx");
        }
    }
}