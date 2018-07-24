using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace placement_cell.Webpages
{
    public partial class Studentregistration : System.Web.UI.Page
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
            string studid;
            studid = "STUD-" + obj.getid("tblstudents", "studid").ToString("0000");
            
            string sql = "insert into tblstudents (studid,emailid,studname,father,dob,gender,address,mobile,landline,college, ";
            sql = sql + "course,percentage,sslcperc,sslcboard,sslcyear,pucperc,pucboard,pucyear) Values('" + studid + "', ";
            sql = sql + "'" + txtemailid.Text.Trim() + "', '" + txtstudname.Text.Trim() + "', ";
            sql = sql + "'" + txtfather.Text.Trim() + "', '" + txtdob.Text.Trim() + "', ";
            sql = sql + "'" + lstgender.SelectedValue + "', '" + txtaddress.Text.Trim() + "', ";
            sql = sql + "'" + txtmobile.Text.Trim() + "', '" + txtlandline.Text.Trim() + "', ";
            sql = sql + "'" + txtcollege.Text.Trim() + "', '" + txtcourse.Text.Trim() + "', ";
            sql = sql + "" + txtpercentage.Text.Trim() + ", " + txtsslcperc.Text.Trim() + ", ";
            sql = sql + "'" + txtsslcboard.Text.Trim() + "', " + txtsslcyear.Text.Trim() + ", ";
            sql = sql + "" + txtpucperc.Text.Trim() + ", '" + txtpucboard.Text.Trim() + "', ";
            sql = sql + "" + txtpucyear.Text.Trim() + ")";

            Database.executeQuery(sql);

            MessageBox("Data is inserted sucessfully");

            Response.Redirect("Studentlogin.aspx");
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