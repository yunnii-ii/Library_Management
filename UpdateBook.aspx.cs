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
    public partial class UpdateBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from BookTable where CodeNo=@c1", conn);
                cmd.Parameters.AddWithValue("@c1", txtCode.Text);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtCode.Text = dr["CodeNo"].ToString();
                    txtTitle.Text = dr["Title"].ToString();
                    txtAuthor.Text = dr["Author"].ToString();
                    txtDate.Text = dr["Publication_date"].ToString();
                    txtTotalPage.Text = dr["Total_pages"].ToString();
                    txtPrice.Text = dr["Price"].ToString();
                    ddStatus.SelectedValue = dr["Status"].ToString();
                }
                else
                {
                    lblErrorMesg.Text = "Book not found!";
                }
                dr.Close();
                show();
            }
            catch (Exception ex)
            {
                lblErrorMesg.Text = "Error: " + ex.Message;
            }
            finally 
            {
                conn.Close();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtCode.Text = "";
            txtTitle.Text = "";
            txtAuthor.Text = "";
            txtDate.Text = "";
            txtTotalPage.Text = "";
            txtPrice.Text = "";
            ddStatus.SelectedValue = "Choose Status";
            lblErrorMesg.Text = "";
            lblMesg.Text = "";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //conn.Open();
            //SqlCommand cmd = new SqlCommand("update BookTable set Title=@t1 , Author=@t2 , Publication_date=@t3, Total_pages=@t4, Price=@t5, CodeNo=@t6 where CodeNo=@t7", conn);
            //cmd.Parameters.AddWithValue("@t1", txtTitle.Text);
            //cmd.Parameters.AddWithValue("@t2", txtAuthor.Text);
            //cmd.Parameters.AddWithValue("@t3", txtDate.Text);
            //cmd.Parameters.AddWithValue("@t4", txtTotalPage.Text);
            //cmd.Parameters.AddWithValue("@t5", txtPrice.Text);
            //cmd.Parameters.AddWithValue("@t6", txtCode.Text);
            //cmd.Parameters.AddWithValue("@t7", txtCode.Text);

            //cmd.ExecuteNonQuery();
            //show();

            try
            {
                //int totalPages = Convert.ToInt32(txtTotalPage.Text.Replace(" pages", ""));
                //decimal price = Convert.ToDecimal(txtPrice.Text.Replace(" kyats", ""));

                conn.Open();
                string code = txtCode.Text;
                if (code != "")
                {
                    SqlCommand cmd = new SqlCommand("update BookTable set Title=@t1 , Author=@t2 , Publication_date=@t3, Total_pages=@t4, Price=@t5, CodeNo=@t6, Status=@t7 where CodeNo=@t8", conn);
                    cmd.Parameters.AddWithValue("@t1", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@t2", txtAuthor.Text);
                    cmd.Parameters.AddWithValue("@t3", txtDate.Text);
                    cmd.Parameters.AddWithValue("@t4", txtTotalPage.Text);
                    cmd.Parameters.AddWithValue("@t5", txtPrice.Text);
                    cmd.Parameters.AddWithValue("@t6", txtCode.Text);
                    cmd.Parameters.AddWithValue("@t7", ddStatus.Text);
                    cmd.Parameters.AddWithValue("@t8", txtCode.Text);

                    cmd.ExecuteNonQuery();
                    Response.Write("<script> alert('Update successfully.')</script>");
                    show();
                }
                else 
                {
                    lblErrorMesg.Text = "Please fill the require field!";
                }
            }
            catch (Exception ex)
            {
                lblErrorMesg.Text = "Error: " + ex.Message;
            }
            finally 
            {
                conn.Close();
            }
         }
        void show()
        {
            SqlDataAdapter da = new SqlDataAdapter("select CodeNo,Title,Author,Publication_date,Total_pages,Price,Status from BookTable order by CodeNo asc", conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "bTable");
            conn.Close();
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Update(ds, "bTable");

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}