using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.IO;

public class readyclass
{

    public Int32 autoid(string tablename, string fieldname)
    {
        SqlConnection con = Database.getConnection();
        SqlCommand cmd = new SqlCommand("select " + fieldname + " from " + tablename + " order by 1 desc", con);
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        int id;

        if (dr.Read() == true)
        {
            id = Convert.ToInt32(dr[0].ToString());
            id += 1;
        }
        else
        {
            id = 1;
        }
        return id;
    }

    public Int32 getid(string tablename, string fieldname)
    {
        SqlConnection con = Database.getConnection();
        SqlCommand cmd = new SqlCommand("select top 1 " + fieldname + " from " + tablename + " Order by 1 Desc", con);
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        int id;

        if (dr.Read())
        {
            id = Convert.ToInt32(dr[0].ToString().Substring(Math.Max(0, dr[0].ToString().Length - 4)));
            id += 1;
        }
        else
        {
            id = 1;
        }
        return id;
    }

    public bool CheckEmail(string EmailAddress)
    {
        string strPattern = "^([0-9a-zA-Z]([-.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$";
        if (System.Text.RegularExpressions.Regex.IsMatch(EmailAddress, strPattern))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public bool BindGrid(GridView grd, string sql)
    {

        DataTable dt;
        grd.DataSource = null;

        dt = Database.executeselect(sql);

        if (dt.Rows.Count > 0)
        {
            grd.DataSource = dt;
            grd.DataBind();
            return true;
        }
        else
        {
            grd.DataBind();
            return false;
        }
    }

    public bool checkduplicate(string str)
    {

        SqlConnection con = Database.getConnection();
        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        if (dr.Read())
        {
            dr.Close();
            cmd.Dispose();
            con.Close();
            return true;
        }
        else
        {
            dr.Close();
            cmd.Dispose();
            con.Close();
            return false;
        }
    }

    public static void errormessage(Label l, string str)
    {
        l.Text = str;
        l.Visible = true;
    }

    public void filllist(DropDownList d, string str)
    {
        d.Items.Clear();
        d.Items.Insert(0, "Select");
        SqlConnection con = Database.getConnection();
        SqlCommand cmd = new SqlCommand(str, con);

        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        int i = 1;
        while (dr.Read())
        {
            d.Items.Insert(i, dr[0].ToString().Trim());
            i++;
        }
        dr.Close();
        cmd.Dispose();
        con.Close();
    }


    public void makereadonly(ControlCollection cntrl)
    {
        foreach (Control item in cntrl)
        {
            if (item is TextBox)
                ((TextBox)item).ReadOnly = true;
            else if (item is DropDownList)
                ((DropDownList)item).Enabled = false;
            makereadonly(item.Controls);
        }
    }

    public void makeeditable(ControlCollection cntrl)
    {
        foreach (Control item in cntrl)
        {
            if (item is TextBox)
                ((TextBox)item).ReadOnly = false;
            else if (item is DropDownList)
                ((DropDownList)item).Enabled = true;
            makeeditable(item.Controls);
        }
    }

    public void cleartext(ControlCollection cntrl)
    {
        foreach (Control item in cntrl)
        {
            if (item is TextBox)
                ((TextBox)item).Text = "";
            else if (item is DropDownList)
                ((DropDownList)item).ClearSelection();
            cleartext(item.Controls);
        }
    }
}