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
    public partial class AdminstudentList : System.Web.UI.Page
    {
        string sql;
        readyclass obj = new readyclass();
        bool flag;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                sql = "select * from tblstudents";
                flag = obj.BindGrid(grdstudents, sql);

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

        protected void grdstudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdstudents.PageIndex = e.NewPageIndex;

            sql = "select * from tblstudents";
            flag = obj.BindGrid(grdstudents, sql);

            if (flag == false)
            {
                readyclass.errormessage(lblerror, "Records not found");
            }
            else
            {
                lblerror.Text = "";
            }
        }

        protected void grdstudents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string studid;
            studid = grdstudents.DataKeys[e.RowIndex].Values[0].ToString();

            SqlConnection con = Database.getConnection();
            SqlCommand cmd = new SqlCommand("select emailid from tblstudents where studid='" + studid + "'", con);
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (dr.Read())
            {
                lblemailid.Text = dr[0].ToString().Trim();
            }
            dr.Close();
            cmd.Dispose();
            con.Close();

            string sql = "delete from tblstudents where studid='" + studid + "'";
            Database.executeQuery(sql);

            sql = "delete from tblverification where emailid='" + lblemailid.Text.Trim() + "'";
            Database.executeQuery(sql);

            sql = "select * from tblstudents";
            flag = obj.BindGrid(grdstudents, sql);

            if (flag == false)
            {
                readyclass.errormessage(lblerror, "Records not found");
            }
            else
            {
                lblerror.Text = "";
            }
        }

        protected void grdstudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // reference the Delete LinkButton
                LinkButton db = (LinkButton)e.Row.Cells[4].Controls[0];

                db.OnClientClick = "return confirm('Are you sure you want to delete this?');";
            }
        }
    }
}