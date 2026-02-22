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
    public partial class DeleteMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void btnDel_Click(object sender, EventArgs e)
        {
            conn.Open();
            string code = txtPkpt.Text;
            if (!string.IsNullOrWhiteSpace(code))
            {
                SqlCommand cmd = new SqlCommand("delete from StudentTable where PaKaPaTa=@c1", conn);
                cmd.Parameters.AddWithValue("@c1", txtPkpt.Text);
                cmd.ExecuteNonQuery();
                txtPkpt.Text = "";
                Response.Redirect("AddMember.aspx");
            }
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
    }
}