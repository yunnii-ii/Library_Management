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
    public partial class return_list : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("select top 1 * from RentBook order by Id desc", conn);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblDueDate.Text = dr["Due_date"].ToString();
                lblCode.Text = dr["CodeNo"].ToString();
                lblId.Text = dr["PaKaPaTa"].ToString();
                lblTitle.Text = dr["Title"].ToString();
                lblAuthor.Text = dr["Author"].ToString();
                lblDate.Text = dr["Borrow_date"].ToString();
            }
            //string code = (string)Session["Code"];
            //lblCode.Text = code;
            //string username = (string)Session["Name"];
            
            //string contact = (string)Session["Contact"];
            
            //string email = (string)Session["Email"];
            //string title = (string)Session["Title"];
            //lblTitle.Text = title;
            //string author = (string)Session["Author"];
            //lblAuthor.Text = author;
            //string date = (string)Session["Date"];
            //lblDate.Text = date;
            //string duedate = (string)Session["DueDate"];
            //lblDueDate.Text = duedate;
        }

        protected void btnQuit_Click(object sender, EventArgs e)
        {
            Response.Redirect("RentBook.aspx");
        }
    }
}