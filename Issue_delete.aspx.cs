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
    public partial class Issue_delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void btnDel_Click(object sender, EventArgs e)
        {
            conn.Open();
            string code = txtCodeNo.Text;
            if (!string.IsNullOrWhiteSpace(code))
            {
                SqlCommand cmd = new SqlCommand("delete from IssueBook where CodeNo=@c1", conn);
                cmd.Parameters.AddWithValue("@c1", txtCodeNo.Text);
                cmd.ExecuteNonQuery();
                txtCodeNo.Text = "";
                Response.Redirect("IssueBook.aspx");
                //String stat = "Available";
                //SqlCommand cmd2 = new SqlCommand("UPDATE BookTable SET Status = @s1 where CodeNo=@cc1", conn);
                //cmd2.Parameters.AddWithValue("@s1", stat);
                //cmd2.Parameters.AddWithValue("@cc1", txtCodeNo.Text);
                //cmd2.ExecuteNonQuery();
            }

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

        protected void btnQuit_Click(object sender, EventArgs e)
        {
            Response.Redirect("IssueBook.aspx");
        }
    }
}