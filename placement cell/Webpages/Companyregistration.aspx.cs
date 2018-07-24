using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace placement_cell.Webpages
{
    public partial class Companyregistration : System.Web.UI.Page
    {
        readyclass obj = new readyclass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtemailid.Text = Session["emailid"].ToString();
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            string cmpid;
            cmpid = "CMP-" + obj.getid("tblcompany", "cmpid").ToString("0000");
           
            string sql = "insert into tblcompany (cmpid,cmpname,cmpaddress,phoneno,aboutcompany, ";
            sql = sql + "emailid) Values('" + cmpid + "', ";
            sql = sql + "'" + txtcmpname.Text.Trim() + "', '" + txtcmpaddress.Text.Trim() + "', ";
            sql = sql + "'" + txtphoneno.Text.Trim() + "', '" + txtaboutcompany.Text.Trim() + "', ";
            sql = sql + "'" + txtemailid.Text.Trim() + "')";

            Database.executeQuery(sql);

            MessageBox("Data is inserted sucessfully");

            Response.Redirect("Companylogin.aspx");
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
    }
}