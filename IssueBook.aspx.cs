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
    public partial class IssueBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void btnSave_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd1 = new SqlCommand("select CodeNo from IssueBook where CodeNo=@c1", conn);
            cmd1.Parameters.AddWithValue("@c1", txtCode.Text);
            SqlDataReader rdr = cmd1.ExecuteReader();

            if (rdr.Read())
            {
                Response.Write("<script>alert('This Book is already exist!')</script>");
                txtCode.Text = "";
                txtName.Text = "";
                txtContact.Text = "";
                txtEmail.Text = "";
                txtTitle.Text = "";
                txtAuthor.Text = "";
                txtIssueDate.Text = "";
                txtReturnDate.Text = "";
            }
            else 
            {
                string code = txtCode.Text;
                string name = txtName.Text;
                string contact = txtContact.Text;
                string email = txtEmail.Text;
                string title = txtTitle.Text;
                string author = txtAuthor.Text;
                string iDate = txtIssueDate.Text;
                string rDate = txtReturnDate.Text;


                if (code != "" && name != "" && contact != "" && email != "" && title != "" && author != "" && iDate != "" && rDate != "")
                {
                    rdr.Close();
                    SqlCommand cmd = new SqlCommand("insert into IssueBook (CodeNo, Name, Contact, Email, Title, Author, Issue_date, Return_date) values(@i1,@i2,@i3,@i4,@i5,@i6,@i7,@i8)", conn);
                    cmd.Parameters.AddWithValue("@i1", txtCode.Text);
                    cmd.Parameters.AddWithValue("@i2", txtName.Text);
                    cmd.Parameters.AddWithValue("@i3", txtContact.Text);
                    cmd.Parameters.AddWithValue("@i4", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@i5", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@i6", txtAuthor.Text);
                    cmd.Parameters.AddWithValue("@i7", iDate);
                    cmd.Parameters.AddWithValue("@i8", rDate);
                    cmd.ExecuteNonQuery();

                    lblMesg1.Text = "Successfully saved.";
                    lblMesg2.Text = "";
                    show();
                    txtCode.Text = "";
                    txtName.Text = "";
                    txtContact.Text = "";
                    txtEmail.Text = "";
                    txtTitle.Text = "";
                    txtAuthor.Text = "";
                    txtIssueDate.Text = "";
                    txtReturnDate.Text = "";
                }
                else 
                {
                    lblMesg2.Text = "Please fill required field!";
                    lblMesg1.Text = "";
                }
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
        void show() 
        {
            SqlDataAdapter da = new SqlDataAdapter("select CodeNo,Name,Contact,Email,Title,Author,Issue_date,Return_date from IssueBook order by CodeNo asc", conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "bTable");
            conn.Close();
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Update(ds, "bTable");

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Issue_update.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("Issue_delete.aspx");
        }

    }
}