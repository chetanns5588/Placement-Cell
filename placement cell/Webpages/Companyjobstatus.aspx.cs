using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;

namespace placement_cell.Webpages
{
    public partial class Companyjobstatus : System.Web.UI.Page
    {
        readyclass obj = new readyclass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cmpemailid = Session["emailid"].ToString();
                lblcmpemailid.Text = cmpemailid;
                SqlConnection con = Database.getConnection();
                SqlCommand cmd = new SqlCommand("select cmpid,cmpname from tblcompany where emailid='" + cmpemailid + "'", con);
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.Read())
                {
                    lblcmpid.Text = dr[0].ToString().Trim();
                    lblcmpname.Text = dr[1].ToString().Trim();
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

                string assigned = "Select * from tblstudents_jobs where status='Assigned' and jobid='" + lstjobid.SelectedValue + "'";
                obj.BindGrid(grdassignedstudents, assigned);

                string placed = "Select * from tblstudents_jobs where status='Placed' and jobid='" + lstjobid.SelectedValue + "'";
                obj.BindGrid(grdplacedstudents, placed);
            }
        }

        protected void grdassignedstudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdassignedstudents.PageIndex = e.NewPageIndex;
            string assigned = "Select * from tblstudents_jobs where status='Assigned' and jobid='" + lstjobid.SelectedValue + "'";
            obj.BindGrid(grdassignedstudents, assigned);
        }

        protected void grdplacedstudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdplacedstudents.PageIndex = e.NewPageIndex;
            string placed = "Select * from tblstudents_jobs where status='Placed' and jobid='" + lstjobid.SelectedValue + "'";
            obj.BindGrid(grdplacedstudents, placed);
        }

        protected void btnplace_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdassignedstudents.Rows)
            {
                CheckBox chkStatus = (CheckBox)row.FindControl("chkselect");

                if (chkStatus.Checked)
                {
                    //MessageBox(Convert.ToString(row.Cells[1].Text));

                    string sql = "Update tblstudents_jobs SET status = 'Placed' where jobid='" + lstjobid.SelectedValue + "' and studid='" + row.Cells[1].Text.ToString().Trim() + "'";
         
                    Database.executeQuery(sql);

                    string emailsend = row.Cells[4].Text.ToString().Trim();
                    try
                    {
                        MailMessage mail = new MailMessage();
                        SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                        mail.From = new MailAddress("davanagereplacement@gmail.com");
                        mail.To.Add(emailsend);
                        mail.Subject = "Your Placed for " + lbltitle.Text.Trim();
                        mail.Body = "You Have selected in Company" + lblcmpname.Text.Trim();
                        SmtpServer.Port = 25;
                        SmtpServer.Credentials = new System.Net.NetworkCredential("davanagereplacement@gmail.com", "cell1985@@");
                        SmtpServer.EnableSsl = true;
                        SmtpServer.Send(mail);
                    }
                    catch
                    {

                    }
                }
            }
            lstjobid_TextChanged(this, new EventArgs());
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdplacedstudents.Rows)
            {
                CheckBox chkStatus = (CheckBox)row.FindControl("chkselect");

                if (chkStatus.Checked)
                {
                    //MessageBox(Convert.ToString(row.Cells[1].Text));

                    string sql = "Update tblstudents_jobs SET status = 'Assigned' where jobid='" + lstjobid.SelectedValue + "' and studid='" + row.Cells[1].Text.ToString().Trim() + "'";

                    Database.executeQuery(sql);
                  
                }
            }
            lstjobid_TextChanged(this, new EventArgs());
        }
    }
}