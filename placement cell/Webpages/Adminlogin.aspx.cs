using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace placement_cell.Webpages
{
    public partial class Adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                txtusername.Focus();
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (txtusername.Text.Trim() == "admin" && txtpassword.Text.Trim() == "admin")
            {
                Response.Redirect("Adminhome.aspx");
            }
            else
            {
                readyclass.errormessage(lblerror, "Invalid User Name or Password");
                txtpassword.Focus();
            }
        }
    }
}