using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace placement_cell.Webpages
{
    public partial class Companyverification : System.Web.UI.Page
    {
        readyclass obj = new readyclass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                txtusername.Text = Session["emailid"].ToString();
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string query = "select * from tblcompanyverification where emailid='" + txtusername.Text.Trim() + "' and password = '" + txtpassword.Text.Trim() + "' and verificationcode = '" + txtverificationcode.Text.Trim() + "'";

            if (obj.checkduplicate(query))
            {
                Response.Redirect("Companyregistration.aspx");
            }
            else
            {
                readyclass.errormessage(lblerror, "Invalid Verification code or Password");
                txtpassword.Focus();
            }
        }
    }
}