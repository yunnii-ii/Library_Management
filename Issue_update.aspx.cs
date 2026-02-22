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
    public partial class Issue_update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from IssueBook where CodeNo=@c1", conn);
                cmd.Parameters.AddWithValue("@c1", txtCode.Text);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtCode.Text = dr["CodeNo"].ToString();
                    txtName.Text = dr["Name"].ToString();
                    txtContact.Text = dr["Contact"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtTitle.Text = dr["Title"].ToString();
                    txtAuthor.Text = dr["Author"].ToString();
                    txtIssueDate.Text = dr["Issue_date"].ToString();
                    txtReturnDate.Text = dr["Return_date"].ToString();

                }
                else
                {
                    lblMesg2.Text = "Book not found!";
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                lblMesg2.Text = "Error: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        void show()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from IssueBook", conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "bTable");
            conn.Close();
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Update(ds, "bTable");

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                string code = txtCode.Text;
                if (code != "")
                {
                    SqlCommand cmd = new SqlCommand("update IssueBook set CodeNo=@t1 , Name=@t2 , Contact=@t3, Email=@t4, Title=@t5, Author=@t6, Issue_date=@t7, Return_date=@t8 where CodeNo=@t9", conn);
                    cmd.Parameters.AddWithValue("@t1", txtCode.Text);
                    cmd.Parameters.AddWithValue("@t2", txtName.Text);
                    cmd.Parameters.AddWithValue("@t3", txtContact.Text);
                    cmd.Parameters.AddWithValue("@t4", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@t5", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@t6", txtAuthor.Text);
                    cmd.Parameters.AddWithValue("@t7", txtIssueDate.Text);
                    cmd.Parameters.AddWithValue("@t8", txtReturnDate.Text);
                    cmd.Parameters.AddWithValue("@t9", txtCode.Text);

                    cmd.ExecuteNonQuery();
                    Response.Redirect("IssueBook.aspx");
                }
                else
                {
                    lblMesg2.Text = "Please fill require field!";
                }
            }
            catch (Exception ex)
            {
                lblMesg2.Text = "Error: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtCode.Text = "";
            txtName.Text = "";
            txtContact.Text = "";
            txtEmail.Text = "";
            txtTitle.Text = "";
            txtAuthor.Text = "";
            txtIssueDate.Text = "";
            txtReturnDate.Text = "";
            lblMesg1.Text = "";
            lblMesg2.Text = "";
        }

        protected void btnQuit_Click(object sender, EventArgs e)
        {
            
        }
    }
}