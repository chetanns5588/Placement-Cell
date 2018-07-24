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
    public partial class Adminjobslist : System.Web.UI.Page
    {
        string sql;
        readyclass obj = new readyclass();
        bool flag;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sql = "select cmpid from tblcompany";
                obj.filllist(lstcmpid, sql);
            }           
        }

        protected void lstcmpid_TextChanged(object sender, EventArgs e)
        {
            if (lstcmpid.SelectedValue != "Select")
            {
                SqlConnection con = Database.getConnection();
                SqlCommand cmd = new SqlCommand("select * from tblcompany where cmpid='" + lstcmpid.SelectedValue + "'", con);
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.Read())
                {
                    lblcmpname.Text = dr[1].ToString().Trim();
                    lblcmpemailid.Text = dr[5].ToString().Trim();
                }
                dr.Close();
                cmd.Dispose();
                con.Close();

                sql = "select * from tbljobs where cmpemailid='" + lblcmpemailid.Text.Trim() + "'";
                flag = obj.BindGrid(grdjobs, sql);

                if (flag == false)
                {
                    readyclass.errormessage(lblerror, "Records not found");
                }
                else
                {
                    lblerror.Text = "";
                }
            }
        
        }
        
        protected void grdjobs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            e.NewPageIndex = grdjobs.PageIndex;
            lstcmpid_TextChanged(this, new EventArgs());
        }
    }
}