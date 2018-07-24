<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminjobslist.aspx.cs" Inherits="placement_cell.Webpages.Adminjobslist" MasterPageFile="~/Webpages/Admin.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h1>Jobs List</h1>

<table id="searchtable">
<tr>
<td>
Company ID:
</td>
<td>
  <asp:DropDownList ID="lstcmpid" runat="server" AutoPostBack="true" 
        CssClass="textbox_style" ontextchanged="lstcmpid_TextChanged">
    </asp:DropDownList> 
</td>
</tr>

<tr>
<td>
 Company Name : <asp:Label ID="lblcmpname" runat="server" Text="---"></asp:Label>
</td>
<td>
 Company Email ID : <asp:Label ID="lblcmpemailid" runat="server" Text="---"></asp:Label>
</td>
</tr>
</table>
   
   
   <asp:Label ID="lblerror" runat="server" Text="---" Visible="false" CssClass="Label_style"></asp:Label>
    

    <hr />
<br />
<asp:GridView ID="grdjobs" runat="server" AllowSorting="True" 
                     AutoGenerateColumns="False"  
        CssClass="gridview1" AllowPaging="true" PageSize="10" 
        onpageindexchanging="grdjobs_PageIndexChanging">
             <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="jobid" DataNavigateUrlFormatString="Adminviewjobs.aspx?jobid={0}" DataTextField="title" HeaderText="Job Title" ItemStyle-CssClass="a">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:HyperLinkField>
                
               <asp:BoundField DataField="location" HeaderText="Location">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                  <asp:BoundField DataField="qualification" HeaderText="Qualification">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                  <asp:BoundField DataField="salaryoffered" HeaderText="Salary Offered">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                <asp:BoundField DataField="cmpname" HeaderText="Company Name">
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