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
    public partial class Studentviewjob : System.Web.UI.Page
    {
        readyclass obj = new readyclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtjobid.Text = Request.QueryString["jobid"];
                pagerefresh();
            }
        }

        private void pagerefresh()
        {

            SqlConnection con = Database.getConnection();
            SqlCommand cmd = new SqlCommand("select * from tbljobs where jobid='" + txtjobid.Text.Trim() + "'", con);
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (dr.Read())
            {
                txtjobid.Text = dr[0].ToString().Trim();
                txttitle.Text = dr[1].ToString().Trim();
                txtdescription.Text = dr[2].ToString().Trim();
                txtlocation.Text = dr[3].ToString().Trim();
                txtqualification.Text = dr[4].ToString().Trim();
                txtsalaryoffered.Text = dr[5].ToString().Trim();
                txtskills.Text = dr[6].ToString().Trim();
                txtcmpemailid.Text = dr[7].ToString().Trim();
                txtcmpname.Text = dr[8].ToString().Trim();
            }
            dr.Close();
            cmd.Dispose();
            con.Close();

            obj.makereadonly(Page.Controls);
        }
    }
}