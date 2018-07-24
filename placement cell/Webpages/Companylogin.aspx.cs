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
    public partial class Companylogin : System.Web.UI.Page
    {
        readyclass obj = new readyclass();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = Database.getConnection();

            SqlCommand cmd = new SqlCommand("select * from tblcompanyverification where emailid= '" + txtusername.Text.Trim() + "' and password='" + txtpassword.Text.Trim() + "'", con);
            SqlDataReader rdr1;
            rdr1 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            if (rdr1.Read())
            {
                Session["emailid"] = rdr1[0].ToString();

                rdr1.Close();
                cmd.Dispose();
                con.Close();

                con = Database.getConnection();
                cmd = new SqlCommand("select * from tblcompany where emailid= '" + txtusername.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.Read())
                {
                    Response.Redirect("Companyhome.aspx");
                }
                else
                {
                    Session["emailid"] = txtusername.Text.Trim();
                    readyclass.errormessage(lblerror, "Your Verification code is generated but u r not yet registered. So please regsiter first before login");
                    btnregister.Visible = true;
                }
            }
            else
            {
                readyclass.errormessage(lblerror, "Invalid user name or password");
                rdr1.Close();
                cmd.Dispose();
                con.Close();
            }
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            string query;
            query = "select * from tblcompanyverification where emailid='" + txtemailid.Text.Trim() + "'";

            if (obj.checkduplicate(query))
            {
                readyclass.errormessage(lblerror1, "This Email Id is already exist");
                txtemailid.Focus();
            }
            else
            {
                Random rand = new Random((int)DateTime.Now.Ticks);
                int numIterations = 0;
                numIterations = rand.Next(1, 10000);
                String str = "DU" + numIterations + "PC";

                lblerror.Visible = false;

                string sql = "insert into tblcompanyverification(emailid,password,verificationcode) ";
                sql = sql + "Values('" + txtemailid.Text.Trim() + "', '" + txtrpassword.Text.Trim() + "', ";
                sql = sql + "'" + str + "')";
                Database.executeQuery(sql);

                try
                {
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                    mail.From = new MailAddress("davanagereplacement@gmail.com");
                    mail.To.Add(txtemailid.Text.Trim());
                    mail.Subject = "Verification ID from - Placement Cell";
                    mail.Body = "Verification Number is " + str;
                    SmtpServer.Port = 25;
                    SmtpServer.Credentials = new System.Net.NetworkCredential("praveen@gmail.com", "11111111");
                    SmtpServer.EnableSsl = true;
                    SmtpServer.Send(mail);
                }
                catch
                {

                }
                Session["emailid"] = txtemailid.Text.Trim();
                Response.Redirect("Companyverification.aspx");
            }
        }

        protected void btnregister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Companyverification.aspx");
        }
    }
}