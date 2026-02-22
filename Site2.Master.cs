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
    public partial class Site2 : System.Web.UI.MasterPage
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserName = (string)Session["UserName"];
            lblSession.Text = UserName;

            conn.Open();
            SqlCommand cmd5 = new SqlCommand("select count(*) from AdmTable", conn);
            int rowCount5 = (int)cmd5.ExecuteScalar();
            lblAdmShow.Text = Convert.ToString(rowCount5);

            SqlCommand cmd6 = new SqlCommand("select count(*) from StudentTable", conn);
            int rowCount6 = (int)cmd6.ExecuteScalar();
            lblMemShow.Text = Convert.ToString(rowCount6);
        }

        //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        //{
        //    Response.Redirect("AdminLogin.aspx");
        //}
    }
}