<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Companyjobstatus.aspx.cs" Inherits="placement_cell.Webpages.Companyjobstatus" MasterPageFile="~/Webpages/Company.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h1>Student Status</h1>
<table id="searchtable">
<tr>
<td>
    <asp:Label ID="Label1" runat="server" Text="Company ID"></asp:Label>
</td>
<td>
 <asp:Label ID="lblcmpid" runat="server" Text="---"></asp:Label>
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

</table>
  
   <h1>Assigned Students</h1>

   <asp:GridView ID="grdassignedstudents" runat="server" AllowSorting="True" 
                     AutoGenerateColumns="False"  
        CssClass="gridview" AllowPaging="True" DataKeyNames="studid" 
        onpageindexchanging="grdassignedstudents_PageIndexChanging">
             <Columns>

              <asp:TemplateField HeaderText="Select">
                     <ItemTemplate>
                            <asp:CheckBox ID="chkselect" runat="server" />
                     </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="20px" />
                 </asp:TemplateField>
                
               <asp:BoundField DataField="studid" HeaderText="Stud ID">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                <asp:HyperLinkField DataNavigateUrlFields="studid" 
                     DataNavigateUrlFormatString="Companyviewstudents.aspx?studid={0}" 
                     DataTextField="studname" HeaderText="Student Name">
                </asp:HyperLinkField>

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
        <br />
        <asp:Button ID="btnplace" runat="server" Text="Placed" 
                         ToolTip="Click here to Place" CssClass="button_style" 
        onclick="btnplace_Click" />

            <hr />

             <h1>Placed Students</h1>

   <asp:GridView ID="grdplacedstudents" runat="server" AllowSorting="True" 
                     AutoGenerateColumns="False"  
        CssClass="gridview" AllowPaging="true" PageSize="10" DataKeyNames="studid" 
        onpageindexchanging="grdplacedstudents_PageIndexChanging">
             <Columns>

              <asp:TemplateField HeaderText="Select">
                     <ItemTemplate>
                            <asp:CheckBox ID="chkselect" runat="server" />
                     </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="20px" />
                 </asp:TemplateField>
                
               <asp:BoundField DataField="studid" HeaderText="Stud ID">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                 <asp:HyperLinkField DataNavigateUrlFields="studid" 
                     DataNavigateUrlFormatString="Companyviewstudents.aspx?studid={0}" 
                     DataTextField="studname" HeaderText="Student Name">
                </asp:HyperLinkField>

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
        <br />
        <asp:Button ID="btndelete" runat="server" Text="Delete" 
                         ToolTip="Click here to Delete" CssClass="button_style" 
        onclick="btndelete_Click" />
</asp:Content>