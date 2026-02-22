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
    public partial class RentBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
            //Session["CodeNo"] = txtCode.Text;
            //Session["Name"] = txtName.Text;
            //Session["Contact"] = txtContact.Text;
            //Session["Email"] = txtEmail.Text;
            //Session["Title"] = txtTitle.Text;
            //Session["Author"] = txtAuthor.Text;
            //Session["Date"] = txtDate.Text;
            //Session["DueDate"] = txtDueDate.Text;
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from BookTable where CodeNo=@c1 and Status = 'Available'", conn);
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
                lblMesg1.Text = "warning:This book is not available right now. ";
                lblMesg.Text = "";
                lblMesg2.Text = "";

            }
            conn.Close();
            dr.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd1 = new SqlCommand("select PaKaPaTa from StudentTable where PaKaPaTa=@p1", conn);
            cmd1.Parameters.AddWithValue("@p1",txtPkpt.Text);
            SqlDataReader reader = cmd1.ExecuteReader();
            if (!reader.Read())
            {
                Response.Write("<script>alert('This student is not a member!')</script>");
                txtCode.Text = "";
                txtName.Text = "";
                txtContact.Text = "";
                txtPkpt.Text = "";
                txtTitle.Text = "";
                txtAuthor.Text = "";
                txtDate.Text = "";
                txtDueDate.Text = "";
                lblMesg.Text = "";
                lblMesg1.Text = "";
                lblMesg2.Text = "";
            }
             
                if (!string.IsNullOrEmpty(txtCode.Text) && !string.IsNullOrEmpty(txtTitle.Text) && !string.IsNullOrEmpty(txtAuthor.Text) && !string.IsNullOrEmpty(txtDate.Text) && !string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtContact.Text) && !string.IsNullOrEmpty(txtPkpt.Text))
                {

                    reader.Close();
                    SqlCommand cmd = new SqlCommand("insert into RentBook (CodeNo, Name, Contact, PaKaPaTa, Title, Author, Borrow_date, Due_date) values(@i1,@i2,@i3,@i4,@i5,@i6,@i7,@i8)", conn);
                    cmd.Parameters.AddWithValue("@i1", txtCode.Text);
                    cmd.Parameters.AddWithValue("@i2", txtName.Text);
                    cmd.Parameters.AddWithValue("@i3", txtContact.Text);
                    cmd.Parameters.AddWithValue("@i4", txtPkpt.Text);
                    cmd.Parameters.AddWithValue("@i5", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@i6", txtAuthor.Text);
                    cmd.Parameters.AddWithValue("@i7", txtDate.Text);
                    cmd.Parameters.AddWithValue("@i8", txtDueDate.Text);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    show();

                    lblMesg.Text = "Successfully saved.";
                    lblMesg1.Text = "";
                    lblMesg2.Text = "";
                    txtCode.Text = "";
                    txtName.Text = "";
                    txtContact.Text = "";
                    txtPkpt.Text = "";
                    txtTitle.Text = "";
                    txtAuthor.Text = "";
                    txtDate.Text = "";
                    txtDueDate.Text = "";
                }
                else
                {
                    lblMesg2.Text = "Please fill required field!";
                    lblMesg.Text = "";
                    return;
                }
        }

        protected void btnReload_Click(object sender, EventArgs e)
        {
            conn.Open();
            String stat1 = "Not Available";
            SqlCommand cmd1 = new SqlCommand("update BookTable set Status = @s1 from BookTable inner join RentBook on BookTable.CodeNo = RentBook.CodeNo", conn);
            cmd1.Parameters.AddWithValue("@s1", stat1);
            cmd1.ExecuteNonQuery();
            conn.Close();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblMesg.Text = "";
            lblMesg1.Text = "";
            lblMesg2.Text = "";
            txtCode.Text = "";
            txtName.Text = "";
            txtContact.Text = "";
            txtPkpt.Text = "";
            txtTitle.Text = "";
            txtAuthor.Text = "";
            txtDate.Text = "";
            txtDueDate.Text = "";
        }

        void show()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from RentBook", conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "bTable");
            conn.Close();
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Update(ds, "bTable");

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnViewList_Click(object sender, EventArgs e)
        {
            Response.Redirect("return_list.aspx");
        }

    }
}