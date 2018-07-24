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
    public partial class Studentplacedlist : System.Web.UI.Page
    {
        string sql;
        readyclass obj = new readyclass();
        bool flag;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string studemailid = Session["emailid"].ToString();
                sql = "select * from tblstudents_jobs s,tbljobs j where s.studemailid='" + studemailid + "' and s.status='Placed' and s.jobid=j.jobid";
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
}