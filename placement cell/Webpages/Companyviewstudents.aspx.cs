using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace placement_cell.Webpages
{
    public partial class Companyviewstudents : System.Web.UI.Page
    {
        readyclass obj = new readyclass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtstudid.Text = Request.QueryString["studid"];

                pagerefresh();
            }
        }

        private void pagerefresh()
        {
            SqlConnection con = Database.getConnection();
            SqlCommand cmd = new SqlCommand("select * from tblstudents where studid='" + txtstudid.Text.Trim() + "'", con);
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (dr.Read())
            {
                txtstudid.Text = dr[0].ToString().Trim();
                txtemailid.Text = dr[1].ToString().Trim();
                txtstudname.Text = dr[2].ToString().Trim();
                txtfather.Text = dr[3].ToString().Trim();
                txtdob.Text = DateTime.Parse(dr[4].ToString().Trim()).ToShortDateString();
                txtgender.Text = dr[5].ToString().Trim();
                txtaddress.Text = dr[6].ToString().Trim();
                txtmobile.Text = dr[7].ToString().Trim();
                txtlandline.Text = dr[8].ToString().Trim();
                txtcollege.Text = dr[9].ToString().Trim();
                txtcourse.Text = dr[10].ToString().Trim();
                txtpercentage.Text = dr[11].ToString().Trim();
                txtsslcperc.Text = dr[12].ToString().Trim();
                txtsslcboard.Text = dr[13].ToString().Trim();
                txtsslcyear.Text = dr[14].ToString().Trim();
                txtpucperc.Text = dr[15].ToString().Trim();
                txtpucboard.Text = dr[16].ToString().Trim();
                txtpucyear.Text = dr[17].ToString().Trim();
            }
            dr.Close();
            cmd.Dispose();
            con.Close();

            obj.makereadonly(Page.Controls);
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Companyjobstatus.aspx");
        }
    }
}