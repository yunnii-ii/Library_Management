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
    public partial class Dashboard : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from BookTable", conn);
            int rowCount = (int)cmd.ExecuteScalar();
            lblGreen.Text = Convert.ToString(rowCount);

            SqlCommand cmd1 = new SqlCommand("select count(*) from BookTable where Status = 'Available'", conn);
            int rowCount1 = (int)cmd1.ExecuteScalar();
            lblBlue.Text = Convert.ToString(rowCount1);

            SqlCommand cmd2 = new SqlCommand("select count(*) from IssueBook", conn);
            int rowCount2 = (int)cmd2.ExecuteScalar();
            lblPurple.Text = Convert.ToString(rowCount2);

            SqlCommand cmd3 = new SqlCommand("select count(*) from RentBook", conn);
            int rowCount3 = (int)cmd3.ExecuteScalar();
            lblGray.Text = Convert.ToString(rowCount3);

            SqlCommand cmd4 = new SqlCommand("select count(*) from ReturnBook", conn);
            int rowCount4 = (int)cmd4.ExecuteScalar();
            lblRed.Text = Convert.ToString(rowCount4);

            SqlCommand cmd5 = new SqlCommand("select count(*) from StudentTable", conn);
            int rowCount5 = (int)cmd5.ExecuteScalar();
            lblLightblue.Text = Convert.ToString(rowCount5);

            
        }

    }
}