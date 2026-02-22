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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["SelectedValue"] = ddStatus.SelectedValue;
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd1 = new SqlCommand("select CodeNo from BookTable where CodeNo=@c1",conn);
            cmd1.Parameters.AddWithValue("@c1", txtCode.Text);
            SqlDataReader rdr = cmd1.ExecuteReader();

            if (rdr.Read())
            {
                Response.Write("<script>alert('This Book is already exist!')</script>");
                txtTitle.Text = "";
                txtAuthor.Text = "";
                txtDate.Text = "";
                txtTotalPage.Text = "";
                txtPrice.Text = "";
                txtCode.Text = "";
                //ddStatus.SelectedValue = "Choose Status";
                ddStatus.SelectedIndex = 0;
            }

            else
            {
                string code = txtCode.Text;
                string title = txtTitle.Text;
                string author = txtAuthor.Text;
                string date = txtDate.Text;
                string page = txtTotalPage.Text;
                string price = txtPrice.Text;
                string status = ddStatus.Text;
                if (code != "" && title != "" && author != "" && date != "" && page != "" && price != "" && status != "")
                {
                    rdr.Close();
                    SqlCommand cmd = new SqlCommand("insert into BookTable(Title,Author,Publication_date,Total_pages,Price,CodeNo,Status) values(@p1,@p2,@p3,@p4,@p5,@p6,@p7)", conn);
                    cmd.Parameters.AddWithValue("@p1", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@p2", txtAuthor.Text);
                    cmd.Parameters.AddWithValue("@p3", txtDate.Text);
                    cmd.Parameters.AddWithValue("@p4", txtTotalPage.Text);
                    cmd.Parameters.AddWithValue("@p5", txtPrice.Text);
                    cmd.Parameters.AddWithValue("@p6", txtCode.Text);
                    cmd.Parameters.AddWithValue("@p7", ddStatus.Text);
                    cmd.ExecuteNonQuery();
                    show();
                    lblMesg2.Text = "Successfully added to table!";
                    lblMesg.Text = "";
                    //Response.Write("<script>alert('Successfully added to table!')</script>");
                    show();
                    txtCode.Text = "";
                    txtTitle.Text = "";
                    txtAuthor.Text = "";
                    txtDate.Text = "";
                    txtTotalPage.Text = "";
                    txtPrice.Text = "";
                    //ddStatus.SelectedValue = "Choose Status";
                    ddStatus.SelectedIndex = 0;
                }
                else 
                {
                    lblMesg.Text = "Please fill the require field!";
                    lblMesg2.Text = "";
                }
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

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtCode.Text = "";
            txtTitle.Text = "";
            txtAuthor.Text = "";
            txtDate.Text = "";
            txtTotalPage.Text = "";
            txtPrice.Text = "";
            ddStatus.SelectedIndex = 0;
            //ddStatus.Items.Remove(ddStatus.SelectedValue);
            lblMesg.Text = "";
            lblMesg2.Text = "";
        }


        protected void btnReload_Click(object sender, EventArgs e)
        {
            conn.Open();
            string stat1 = ddStatus.SelectedValue;
            stat1 = "Not Available";

            string stat2 = ddStatus.SelectedValue;
            stat2 = "Available";

            SqlCommand cmd1 = new SqlCommand("update BookTable set Status = @s1 from BookTable inner join IssueBook on BookTable.CodeNo = IssueBook.CodeNo",conn);
            cmd1.Parameters.AddWithValue("@s1", stat1);
            cmd1.ExecuteNonQuery();

            SqlCommand cmd2 = new SqlCommand("UPDATE BookTable SET Status = @s1 WHERE NOT EXISTS (SELECT 1 FROM IssueBook WHERE IssueBook.CodeNo = BookTable.CodeNo)", conn);
            cmd2.Parameters.AddWithValue("@s1", stat2);
            cmd2.ExecuteNonQuery();

            SqlCommand cmd3 = new SqlCommand("update BookTable set Status = @s3 from BookTable inner join RentBook on BookTable.CodeNo = RentBook.CodeNo", conn);
            cmd3.Parameters.AddWithValue("@s3", stat1);
            cmd3.ExecuteNonQuery();

            SqlCommand cmd4 = new SqlCommand("update BookTable set Status = @s4 from BookTable inner join ReturnBook on BookTable.CodeNo = ReturnBook.CodeNo", conn);
            cmd3.Parameters.AddWithValue("@s4", stat2);
            cmd3.ExecuteNonQuery();

            //SqlCommand cmd3 = new SqlCommand("update BookTable set Status = @s3 from BookTable inner join ReturnBook on BookTable.CodeNo = ReturnBook.CodeNo", conn);
            //cmd3.Parameters.AddWithValue("@s3", stat1);
            //cmd3.ExecuteNonQuery();

            //SqlCommand cmd4 = new SqlCommand("UPDATE BookTable SET Status = @s4 WHERE NOT EXISTS (SELECT 1 FROM ReturnBook WHERE ReturnBook.CodeNo = BookTable.CodeNo)", conn);
            //cmd4.Parameters.AddWithValue("@s4", stat2);
            //cmd4.ExecuteNonQuery();

            show();
        }

        
        //protected void txtSearchBox_TextChanged(object sender, EventArgs e)
        //{
            //if (txtCode.Text != "")
            //{
            //    conn.Open();
            //    SqlCommand cmd = new SqlCommand("select * from BookTable where CodeNo LIKE '" + txtSearchBox.Text + "%'", conn);
            //    SqlDataAdapter da = new SqlDataAdapter(cmd);
            //    DataSet ds = new DataSet();
            //    da.Fill(ds);
            //    conn.Close();

            //    searchView.DataSource = ds.Tables[0];
            //    searchView.DataBind();

            //}
            //else
            //{
            //    conn.Open();
            //    SqlCommand cmd = new SqlCommand("select * from BookTable where CodeNo=@c1", conn);
            //    cmd.Parameters.AddWithValue("@c1", txtSearchBox.Text);
            //    SqlDataAdapter da = new SqlDataAdapter(cmd);
            //    DataSet ds = new DataSet();
            //    da.Fill(ds);
            //    conn.Close();

            //    searchView.DataSource = ds.Tables[0];

            //}
        //}

        
    }
}
