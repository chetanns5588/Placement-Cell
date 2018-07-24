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
    public partial class Companyjobslist : System.Web.UI.Page
    {
        string sql;
        readyclass obj = new readyclass();
        bool flag;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cmpemailid = Session["emailid"].ToString();
                sql = "select * from tbljobs where cmpemailid='" + cmpemailid + "'";
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

        protected void btnaddnew_Click(object sender, EventArgs e)
        {
            Response.Redirect("Companyaddjobs.aspx");
        }

        protected void grdjobs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdjobs.PageIndex = e.NewPageIndex;
            string cmpemailid = Session["emailid"].ToString();
            sql = "select * from tbljobs where cmpemailid='" + cmpemailid + "'";
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
}