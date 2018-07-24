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
    public partial class Adminjobstatuslist : System.Web.UI.Page
    {
        readyclass obj = new readyclass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                obj.filllist(lstcmpid, "select cmpid from tblcompany");  
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

                string assigned = "Select * from tblstudents_jobs where status='Assigned' and jobid='" + lstjobid.SelectedValue + "'";
                obj.BindGrid(grdassignedstudents, assigned);

                string placed = "Select * from tblstudents_jobs where status='Placed' and jobid='" + lstjobid.SelectedValue + "'";
                obj.BindGrid(grdplacedstudents, placed);

                string str = "select s.studid,s.studname,s.course,s.emailid from tblstudents s where NOT EXISTS (select NULL from tblstudents_jobs j where j.studid=s.studid and j.jobid='" + lstjobid.SelectedValue + "')";
                obj.BindGrid(grdnewstudents, str);
            }

        }

      
        protected void btnassigned_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdnewstudents.Rows)
            {
                CheckBox chkStatus = (CheckBox)row.FindControl("chkselect");

                if (chkStatus.Checked)
                {
                    //MessageBox(Convert.ToString(row.Cells[1].Text));
                  
                    string sql = "insert into tblstudents_jobs (jobid,jobtitle,studid,studname,course,studemailid,status) ";
                    sql = sql + "Values('" + lstjobid.SelectedValue + "', '" + lbltitle.Text.Trim() + "', ";
                    sql = sql + "'" + row.Cells[1].Text.ToString().Trim() + "', '" + row.Cells[2].Text.ToString().Trim() + "', ";
                    sql = sql + "'" + row.Cells[3].Text.ToString().Trim() + "', '" + row.Cells[4].Text.ToString().Trim() + "', ";
                    sql = sql + "'Assigned')";
                    Database.executeQuery(sql);

                    string emailsend = row.Cells[4].Text.ToString().Trim();
                    try
                    {
                        MailMessage mail = new MailMessage();
                        SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                        mail.From = new MailAddress("davanagereplacement@gmail.com");
                        mail.To.Add(emailsend);
                        mail.Subject = "Your Resume is selected " + lbltitle.Text.Trim();
                        mail.Body = "You can attend interview check Placement Portal for more details";
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
            foreach (GridViewRow row in grdassignedstudents.Rows)
            {
                CheckBox chkStatus = (CheckBox)row.FindControl("chkselect");

                if (chkStatus.Checked)
                {
                    string str;

                    string sql = "delete from tblstudents_jobs where jobid = '" + lstjobid.SelectedValue + "' and studid = '" + row.Cells[1].Text.ToString().Trim() + "'";
                    Database.executeQuery(sql);
                }
            }
            lstjobid_TextChanged(this, new EventArgs());   
        }

        protected void grdnewstudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdnewstudents.PageIndex = e.NewPageIndex;

            string str = "select s.studid,s.studname,s.course,s.emailid from tblstudents s where NOT EXISTS (select NULL from tblstudents_jobs j where j.studid=s.studid and j.jobid='" + lstjobid.SelectedValue + "')";
            obj.BindGrid(grdnewstudents, str);
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
    }
}