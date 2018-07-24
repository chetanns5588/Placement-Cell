<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminjobsreports.aspx.cs" Inherits="placement_cell.Webpages.Adminjobsreports" MasterPageFile="~/Webpages/Admin.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<h1>Report</h1>
<table id="searchtable">
<tr>
<td>
    <asp:Label ID="Label1" runat="server" Text="Company ID"></asp:Label>
</td>
<td>
  <asp:DropDownList ID="lstcmpid" runat="server" AutoPostBack="true" 
        CssClass="textbox_style" ontextchanged="lstcmpid_TextChanged">
    </asp:DropDownList> 
</td>
</tr>

<tr>
<td>
    <asp:Label ID="Label2" runat="server" Text="Company Name"></asp:Label> 
</td>
<td>
 <asp:Label ID="lblcmpname" runat="server" Text="---"></asp:Label>
</td>
</tr>

<tr>
<td>
    <asp:Label ID="Label3" runat="server" Text="Company Email Id"></asp:Label> 
</td>
<td>
<asp:Label ID="lblcmpemailid" runat="server" Text="---"></asp:Label>
</td>
</tr>

<tr>
<td>
    <asp:Label ID="Label4" runat="server" Text="Job ID"></asp:Label>
</td>
<td>
  <asp:DropDownList ID="lstjobid" runat="server" AutoPostBack="true" 
        CssClass="textbox_style" ontextchanged="lstjobid_TextChanged">
    </asp:DropDownList> 
</td>
</tr>

<tr>
<td>
    <asp:Label ID="Label5" runat="server" Text="Job Title"></asp:Label> 
</td>
<td>
 <asp:Label ID="lbltitle" runat="server" Text="---"></asp:Label>
</td>
</tr>

<tr>
<td>
    <asp:Label ID="Label6" runat="server" Text="Status"></asp:Label>
</td>
<td>
  <asp:DropDownList ID="lststatus" runat="server" AutoPostBack="true" 
        CssClass="textbox_style" ontextchanged="lststatus_TextChanged">
        <asp:ListItem>Select</asp:ListItem>
        <asp:ListItem>Assigned</asp:ListItem>
        <asp:ListItem>Placed</asp:ListItem>
    </asp:DropDownList> 
</td>
</tr>
</table>

 <asp:GridView ID="grdstudents" runat="server" AllowSorting="True" 
                     AutoGenerateColumns="False"  
        CssClass="gridview" AllowPaging="true" PageSize="10">
             <Columns>
                
               <asp:BoundField DataField="studid" HeaderText="Stud ID">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                  <asp:BoundField DataField="studname" HeaderText="Student Name">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                  <asp:BoundField DataField="course" HeaderText="Course">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                  <asp:BoundField DataField="studemailid" HeaderText="Email ID">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
            
            </Columns>
            
            <rowstyle cssclass="RowStyle" />
            <alternatingrowstyle cssclass="AlternateRowStyle" />

            <PagerStyle ForeColor="#ffffff" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#330000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#ffffff" BorderColor="black" BorderStyle="Ridge" 
                 ForeColor="#000000" 
                HorizontalAlign="Justify" VerticalAlign="Middle" />
        </asp:GridView>

</asp:Content>