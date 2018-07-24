<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Companyjobslist.aspx.cs" Inherits="placement_cell.Webpages.Companyjobslist" MasterPageFile="~/Webpages/Company.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:Label ID="lblerror" runat="server" Text="---" Visible="false" CssClass="Label_style"></asp:Label>

<h1>Jobs List</h1>
<br />
<asp:GridView ID="grdjobs" runat="server" AllowSorting="True" 
                     AutoGenerateColumns="False"  
        CssClass="gridview" AllowPaging="true" PageSize="10" 
        onpageindexchanging="grdjobs_PageIndexChanging">
             <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="jobid" DataNavigateUrlFormatString="Companyaddjobs.aspx?jobid={0}" DataTextField="title" HeaderText="Job Title" ItemStyle-CssClass="a">
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
        <br />
        <asp:Button ID="btnaddnew" runat="server" Text="Place Job" 
        CssClass="button_style" onclick="btnaddnew_Click"/>

</asp:Content>