<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Studentnewjobslist.aspx.cs" Inherits="placement_cell.Webpages.Studentnewjobslist" MasterPageFile="~/Webpages/Student.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h1>Jobs List</h1>
<br />
<asp:GridView ID="grdjobs" runat="server" AllowSorting="True" 
                     AutoGenerateColumns="False"  
        CssClass="gridview" AllowPaging="true" PageSize="10" 
        onpageindexchanging="grdjobs_PageIndexChanging">
             <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="jobid" DataNavigateUrlFormatString="Studentviewjob.aspx?jobid={0}" DataTextField="jobtitle" HeaderText="Job Title" ItemStyle-CssClass="a">
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

    <asp:Label ID="lblerror" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>