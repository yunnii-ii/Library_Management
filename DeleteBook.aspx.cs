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
    public partial class DeleteBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void Button1_Click(object sender, EventArgs e)
        {
            conn.Open();
            string code = txtCodeNo.Text;
            if(!string.IsNullOrWhiteSpace(code))
            {
                SqlCommand cmd = new SqlCommand("delete from BookTable where CodeNo=@c1", conn);
                cmd.Parameters.AddWithValue("@c1", txtCodeNo.Text);
                cmd.ExecuteNonQuery();
                txtCodeNo.Text = "";
                show();
            }
            else
            {
                lblMesg1.Text = "Please enter code number.";
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