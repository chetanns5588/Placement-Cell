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
    public partial class Companydetails : System.Web.UI.Page
    {
        readyclass obj = new readyclass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtemailid.Text = Session["emailid"].ToString();
                pagerefresh();
            }
        }

        private void pagerefresh()
        {
            SqlConnection con = Database.getConnection();
            SqlCommand cmd = new SqlCommand("Select * from tblcompany where emailid ='" + txtemailid.Text.Trim() + "'", con);
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            if (dr.Read())
            {
                txtcmpname.Text = dr[1].ToString().Trim();
                txtcmpaddress.Text = dr[2].ToString().Trim();
                txtphoneno.Text = dr[3].ToString().Trim();
                txtaboutcompany.Text = dr[4].ToString().Trim();
                txtemailid.Text = dr[5].ToString().Trim();
            }
            dr.Close();
            cmd.Dispose();
            con.Close();

            con = Database.getConnection();
            cmd = new SqlCommand("Select * from tblcompanyverification where emailid ='" + txtemailid.Text.Trim() + "'", con);
            dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            if (dr.Read())
            {
                txtpassword.Attributes.Add("value", dr[1].ToString().Trim());
                txtcnfrmpassword.Attributes.Add("value", dr[1].ToString().Trim());
            }
            dr.Close();
            cmd.Dispose();
            con.Close();

            obj.makereadonly(Page.Controls);
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            obj.makeeditable(Page.Controls);
            btnupdate.Visible = true;
            btncancel.Visible = true;
            btnedit.Visible = false;
            txtemailid.ReadOnly = true;
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            if (txtpassword.Text.Trim() != txtcnfrmpassword.Text.Trim())
            {
                readyclass.errormessage(lblerror, "Password and Confirm Password should be same");
                txtcnfrmpassword.Focus();
            }
            else
            {
                string sql = "Update tblcompany SET ";
                sql = sql + "cmpname = '" + txtcmpname.Text.Trim() + "', ";
                sql = sql + "cmpaddress = '" + txtcmpaddress.Text.Trim() + "', ";
                sql = sql + "phoneno = '" + txtphoneno.Text.Trim() + "', ";
                sql = sql + "aboutcompany = '" + txtaboutcompany.Text.Trim() + "' Where emailid = '" + txtemailid.Text.Trim() + "'";

                Database.executeQuery(sql);

                string sql1 = "Update tblcompanyverification SET ";
                sql1 = sql1 + "password='" + txtpassword.Text.Trim() + "' where emailid='" + txtemailid.Text.Trim() + "'";
                Database.executeQuery(sql1);

                readyclass.errormessage(lblerror, "Data is Updated sucessfully");

                btnupdate.Visible = false;
                btncancel.Visible = false;
                btnedit.Visible = true;
                obj.makereadonly(Page.Controls);
                
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            pagerefresh();
            btnupdate.Visible = false;
            btncancel.Visible = false;
            btnedit.Visible = true;
        }
    }
}