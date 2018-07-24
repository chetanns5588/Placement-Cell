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
    public partial class Adminjobsreports : System.Web.UI.Page
    {
        readyclass obj = new readyclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                obj.filllist(lstcmpid, "select cmpid from tblcompany");  
        }

        protected void lststatus_TextChanged(object sender, EventArgs e)
        {
            if (lststatus.SelectedValue != "Select")
            {
                string assigned = "Select * from tblstudents_jobs where status='" + lststatus.SelectedValue + "' and jobid='" + lstjobid.SelectedValue + "'";
                obj.BindGrid(grdstudents, assigned);
            }
        }

        protected void lstcmpid_TextChanged(object sender, EventArgs e)
        {
            if (lstcmpid.SelectedValue != "Select")
            {
                SqlConnection con = Database.getConnection();
                SqlCommand cmd = new SqlCommand("select cmpname,emailid from tblcompany where cmpid='" + lstcmpid.SelectedValue + "'", con);
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.Read())
                {
                    lblcmpname.Text = dr[0].ToString().Trim();
                    lblcmpemailid.Text = dr[1].ToString().Trim();
                }
                obj.filllist(lstjobid, "select jobid from tbljobs where cmpemailid='" + lblcmpemailid.Text.Trim() + "'");
            }
        }

        protected void lstjobid_TextChanged(object sender, EventArgs e)
        {
            if (lstjobid.SelectedValue != "Select")
            {
                SqlConnection con = Database.getConnection();
                SqlCommand cmd = new SqlCommand("select title from tbljobs where jobid='" + lstjobid.SelectedValue + "'", con);
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.Read())
                {
                    lbltitle.Text = dr[0].ToString().Trim();
                }
                dr.Close();
                cmd.Dispose();
                con.Close();
            }
        }
    }
}