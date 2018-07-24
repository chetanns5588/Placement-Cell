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
    public partial class Companyaddjobs : System.Web.UI.Page
    {
        readyclass obj = new readyclass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtjobid.Text = Request.QueryString["jobid"];

                if (txtjobid.Text.Trim() != "")
                {
                    pagerefresh();
                    obj.makereadonly(Page.Controls);
                    btnsave.Visible = false;
                    btnupdate.Visible = false;
                    btnedit.Visible = true;
                    btncancel.Visible = true;
                    btndelete.Visible = true;
                }
                else
                {
                    obj.makeeditable(Page.Controls);
                    txtjobid.ReadOnly = true;
                    txtcmpemailid.ReadOnly = true;
                    txtcmpname.ReadOnly = true;

                    btnsave.Visible = true;
                    btnupdate.Visible = false;
                    btnedit.Visible = false;
                    btncancel.Visible = true;
                    btndelete.Visible = false;

                    txtcmpemailid.Text = Session["emailid"].ToString();
                    txtjobid.Text = "JOB-" + obj.getid("tbljobs", "jobid").ToString("0000");
                    SqlConnection con = Database.getConnection();
                    SqlCommand cmd = new SqlCommand("select * from tblcompany where emailid='" + txtcmpemailid.Text.Trim() + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    if (dr.Read())
                    {
                        txtcmpname.Text = dr[1].ToString().Trim();
                    }
                    dr.Close();
                    cmd.Dispose();
                    con.Close();
                }

                btndelete.Attributes.Add("onclick", "return confirm();");
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
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            string sql = "insert into tbljobs(jobid,title,description,location,qualification,salaryoffered,skills,cmpemailid,cmpname) ";
            sql = sql + "Values('" + txtjobid.Text.Trim() + "', '" + txttitle.Text.Trim() + "', ";
            sql = sql + "'" + txtdescription.Text.Trim() + "', '" + txtlocation.Text.Trim() + "', ";
            sql = sql + "'" + txtqualification.Text.Trim() + "', '" + txtsalaryoffered.Text.Trim() + "', '" + txtskills.Text.Trim() + "', '" + txtcmpemailid.Text.Trim() + "', '" + txtcmpname.Text.Trim() + "')";

            Database.executeQuery(sql);

            MessageBox("Data is inserted sucessfully");

            Response.Redirect("Companyjobslist.aspx");
        }

        private void MessageBox(String strMsg)
        {
            try
            {
                String sMessage;
                sMessage = "<SCRIPT language='javascript'>alert('" + strMsg + "') </SCRIPT>";
                ClientScript.RegisterStartupScript(this.GetType(), "Message", sMessage);
            }
            catch
            {
            }
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            obj.makeeditable(Page.Controls);
            txtjobid.ReadOnly = true;
            txtcmpemailid.ReadOnly = true;
            txtcmpname.ReadOnly = true;

            btnedit.Visible = false;
            btnupdate.Visible = true;
            btncancel.Visible = true;
            btnsave.Visible = false;
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string sql = "Update tbljobs SET ";
            sql = sql + "title = '" + txttitle.Text.Trim() + "', description = '" + txtdescription.Text.Trim() + "', ";
            sql = sql + "location ='" + txtlocation.Text.Trim() + "', qualification = '" + txtqualification.Text.Trim() + "', ";
            sql = sql + "salaryoffered = '" + txtsalaryoffered.Text.Trim() + "', ";
            sql = sql + "skills = '" + txtskills.Text.Trim() + "' Where jobid = '" + txtjobid.Text.Trim() + "'";

            Database.executeQuery(sql);

            MessageBox("Data is updated sucessfully");

            Response.Redirect("Companyjobslist.aspx");
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Companyjobslist.aspx");
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            if (txtjobid.Text.Trim() == "")
                readyclass.errormessage(lblerror, "Select jobs to delete");
            else
            {
                string sql = "delete from tbljobs where jobid = '" + txtjobid.Text.Trim() + "'";
                Database.executeQuery(sql);

                MessageBox("Data is deleted successfully");

                Response.Redirect("Companyjobslist.aspx");
            }
        }

    }
}