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
    public partial class UpdateMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void txtPkpt_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            conn.Open();
            if (!string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtPkpt.Text) && !string.IsNullOrEmpty(txtEmail.Text) && !string.IsNullOrEmpty(txtPhone.Text) && ddSem.SelectedIndex!=0 && ddDept.SelectedIndex != 0 && ddSec.SelectedIndex != 0)
            {
                SqlCommand cmd = new SqlCommand("update StudentTable set Name=@t1 , PaKaPaTa=@t2 , Email=@t3, PhoneNo=@t4, Semester=@t5, Department= @t6, Section=@t7, Address=@t8 where PaKaPaTa=@t9", conn);
                cmd.Parameters.AddWithValue("@t1", txtName.Text);
                cmd.Parameters.AddWithValue("@t2", txtPkpt.Text);
                cmd.Parameters.AddWithValue("@t3", txtEmail.Text);
                cmd.Parameters.AddWithValue("@t4", txtPhone.Text);
                cmd.Parameters.AddWithValue("@t5", ddSem.SelectedValue);
                cmd.Parameters.AddWithValue("@t6", ddDept.SelectedValue);
                cmd.Parameters.AddWithValue("@t7", ddSec.SelectedValue);
                cmd.Parameters.AddWithValue("@t8", txtAddress.Text);
                cmd.Parameters.AddWithValue("@t9", txtPkpt.Text);

                cmd.ExecuteNonQuery();
                Response.Redirect("AddMember.aspx");
            }
            else 
            {
                lblMesg.Text = "Please fill require field.";
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtPkpt.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            ddSem.SelectedIndex = 0;
            ddDept.SelectedIndex = 0;
            ddSec.SelectedIndex = 0;
            txtAddress.Text = "";
            lblMesg.Text = "";
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

        protected void txtPkpt_TextChanged1(object sender, EventArgs e)
        {
            
        }

        protected void txtPkpt_TextChanged2(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from StudentTable where PaKaPaTa=@c1", conn);
                cmd.Parameters.AddWithValue("@c1", txtPkpt.Text);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtName.Text = dr["Name"].ToString();
                    txtPkpt.Text = dr["PaKaPaTa"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtPhone.Text = dr["PhoneNo"].ToString();
                    ddSem.SelectedValue = dr["Semester"].ToString();
                    ddDept.SelectedValue = dr["Department"].ToString();
                    ddSec.SelectedValue = dr["Section"].ToString();
                    txtAddress.Text = dr["Address"].ToString();

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

        
    }
}