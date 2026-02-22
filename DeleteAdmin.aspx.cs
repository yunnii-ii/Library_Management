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
    public partial class DeleteAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void btnDel_Click(object sender, EventArgs e)
        {
            conn.Open();
            string code = txtNo.Text;
            if (!string.IsNullOrWhiteSpace(code))
            {
                SqlCommand cmd = new SqlCommand("delete from AdmTable where Id=@c1", conn);
                cmd.Parameters.AddWithValue("@c1", txtNo.Text);
                cmd.ExecuteNonQuery();
                txtNo.Text = "";
                show();
                Response.Redirect("AddAdmin.aspx");
            }
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
    }
}