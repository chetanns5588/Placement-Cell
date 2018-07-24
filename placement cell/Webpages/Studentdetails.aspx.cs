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
    public partial class Studentdetails : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("select * from tblstudents where emailid='" + txtemailid.Text.Trim() + "'", con);
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (dr.Read())
            {
                txtstudid.Text = dr[0].ToString().Trim();
                txtemailid.Text = dr[1].ToString().Trim();
                txtstudname.Text = dr[2].ToString().Trim();
                txtfather.Text = dr[3].ToString().Trim();
                txtdob.Text = DateTime.Parse(dr[4].ToString().Trim()).ToShortDateString();
                lstgender.SelectedValue = dr[5].ToString().Trim();
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

            con = Database.getConnection();
            cmd = new SqlCommand("Select * from tblverification where emailid ='" + txtemailid.Text.Trim() + "'", con);
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
            txtstudid.ReadOnly = true;
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
                string sql = "Update tblstudents SET ";
                sql = sql + "studname = '" + txtstudname.Text.Trim() + "', ";
                sql = sql + "father = '" + txtfather.Text.Trim() + "', ";
                sql = sql + "dob = '" + txtdob.Text.Trim() + "', ";
                sql = sql + "gender = '" + lstgender.SelectedValue + "', ";
                sql = sql + "address = '" + txtaddress.Text.Trim() + "', ";
                sql = sql + "mobile = '" + txtmobile.Text.Trim() + "', ";
                sql = sql + "landline = '" + txtlandline.Text.Trim() + "', ";
                sql = sql + "college = '" + txtcollege.Text.Trim() + "', ";
                sql = sql + "course = '" + txtcourse.Text.Trim() + "', ";
                sql = sql + "percentage = '" + txtpercentage.Text.Trim() + "', ";
                sql = sql + "sslcperc = '" + txtsslcperc.Text.Trim() + "', ";
                sql = sql + "sslcboard = '" + txtsslcboard.Text.Trim() + "', ";
                sql = sql + "sslcyear = '" + txtsslcyear.Text.Trim() + "', ";
                sql = sql + "pucperc = '" + txtpucperc.Text.Trim() + "', ";
                sql = sql + "pucboard = '" + txtpucboard.Text.Trim() + "', ";
                sql = sql + "pucyear = '" + txtpucyear.Text.Trim() + "' ";
                sql = sql + "Where emailid = '" + txtemailid.Text.Trim() + "'";

                Database.executeQuery(sql);

                string sql1 = "Update tblverification SET ";
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