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
    public partial class AdmincompanyList : System.Web.UI.Page
    {
        string sql;
        readyclass obj = new readyclass();
        bool flag;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                sql = "select * from tblcompany";
                flag = obj.BindGrid(grdcompanies, sql);

                if (flag == false)
                {
                    readyclass.errormessage(lblerror, "Records not found");
                }
                else
                {
                    lblerror.Text = "";
                }

            }
        }

        protected void grdcompanies_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcompanies.PageIndex = e.NewPageIndex;

            sql = "select * from tblcompany";
            flag = obj.BindGrid(grdcompanies, sql);

            if (flag == false)
            {
                readyclass.errormessage(lblerror, "Records not found");
            }
            else
            {
                lblerror.Text = "";
            }
        }

        protected void grdcompanies_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string cmpid;
            cmpid = grdcompanies.DataKeys[e.RowIndex].Values[0].ToString();
           
            SqlConnection con = Database.getConnection();
            SqlCommand cmd = new SqlCommand("select emailid from tblcompany where cmpid='" + cmpid + "'", con);
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (dr.Read())
            {
                lblcmpemailid.Text = dr[0].ToString().Trim();   
            }
            dr.Close();
            cmd.Dispose();
            con.Close();

            string sql = "delete from tblcompany where cmpid='" + cmpid + "'";
            Database.executeQuery(sql);

            sql = "delete from tblcompanyverification where emailid='" + lblcmpemailid.Text.Trim() + "'";
            Database.executeQuery(sql);

            sql = "select * from tblcompany";
            flag = obj.BindGrid(grdcompanies, sql);

            if (flag == false)
            {
                readyclass.errormessage(lblerror, "Records not found");
            }
            else
            {
                lblerror.Text = "";
            }
        }

        protected void grdcompanies_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // reference the Delete LinkButton
                LinkButton db = (LinkButton)e.Row.Cells[5].Controls[0];

                db.OnClientClick = "return confirm('Are you sure you want to delete this?');";
            }
        }
    }
}