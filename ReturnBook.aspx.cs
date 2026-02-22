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
    public partial class ReturnBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from RentBook where CodeNo=@c1", conn);
                cmd.Parameters.AddWithValue("@c1", txtCode.Text);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtCode.Text = dr["CodeNo"].ToString();
                    txtTitle.Text = dr["Title"].ToString();
                    txtAuthor.Text = dr["Author"].ToString();
                    txtContact.Text = dr["Contact"].ToString();
                    txtName.Text = dr["Name"].ToString();
                    txtPkpt.Text = dr["PaKaPaTa"].ToString();
                    txtBorrowDate.Text = dr["Borrow_date"].ToString();
                }
                else
                {
                    lblMesg1.Text = "Book not found!";
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                lblMesg1.Text = "Error: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string contact = txtContact.Text;
            string pkpt = txtPkpt.Text;
            string bDate = txtBorrowDate.Text;
            string rDate = txtReturnDate.Text;

            if (name != "" && contact != "" && pkpt != "" && bDate != "" && rDate != "")
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("insert into ReturnBook (CodeNo, Name, Contact, PaKaPaTa, Title, Author, Borrow_date, Return_date) values(@i1,@i2,@i3,@i4,@i5,@i6,@i7,@i8)", conn);
                cmd.Parameters.AddWithValue("@i1", txtCode.Text);
                cmd.Parameters.AddWithValue("@i2", txtName.Text);
                cmd.Parameters.AddWithValue("@i3", txtContact.Text);
                cmd.Parameters.AddWithValue("@i4", txtPkpt.Text);
                cmd.Parameters.AddWithValue("@i5", txtTitle.Text);
                cmd.Parameters.AddWithValue("@i6", txtAuthor.Text);
                cmd.Parameters.AddWithValue("@i7", bDate);
                cmd.Parameters.AddWithValue("@i8", rDate);
                cmd.ExecuteNonQuery();

                SqlCommand cmd1 = new SqlCommand("delete from RentBook where CodeNo=@c1", conn);
                cmd1.Parameters.AddWithValue("@c1", txtCode.Text);
                cmd1.ExecuteNonQuery();

                lblMesg.Text = "Successfully saved.";
                lblMesg1.Text = "";
                lblMesg2.Text = "";
                show();
                txtCode.Text = "";
                txtName.Text = "";
                txtContact.Text = "";
                txtPkpt.Text = "";
                txtTitle.Text = "";
                txtAuthor.Text = "";
                txtBorrowDate.Text = "";
                txtReturnDate.Text = "";
            }
            else
            {
                lblMesg2.Text = "Please fill required field!";
                lblMesg.Text = "";
            }
        }

        void show()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from ReturnBook", conn);
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
            txtName.Text = "";
            txtContact.Text = "";
            txtPkpt.Text = "";
            txtTitle.Text = "";
            txtAuthor.Text = "";
            txtReturnDate.Text = "";
            lblMesg.Text = "";
            lblMesg1.Text = "";
            lblMesg2.Text = "";
        }

        protected void btnReload_Click(object sender, EventArgs e)
        {
            conn.Open();
            //string stat1 = Session["SelectedValue"].ToString();
            //stat1 = "Not Available";

            //string stat2 = Session["SelectedValue"].ToString();
            //stat2 = "Available";
            String stat1 = "Not Available";
            String stat2 = "Available";
            SqlCommand cmd1 = new SqlCommand("update BookTable set Status = @s1 from BookTable inner join IssueBook on BookTable.CodeNo = IssueBook.CodeNo", conn);
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

            //SqlCommand cmd4 = new SqlCommand("UPDATE BookTable SET Status = @s4 WHERE NOT EXISTS (SELECT 1 FROM ReturnBook WHERE ReturnBook.CodeNo = BookTable.CodeNo)", conn);
            //cmd4.Parameters.AddWithValue("@s4", stat1);
            //cmd4.ExecuteNonQuery();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd5 = new SqlCommand("delete from ReturnBook", conn);
            //cmd2.Parameters.AddWithValue("@c1", txtCode.Text);
            cmd5.ExecuteNonQuery();
        }
    }
}