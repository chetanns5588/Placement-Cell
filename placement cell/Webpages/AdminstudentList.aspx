<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminstudentList.aspx.cs" Inherits="placement_cell.Webpages.AdminstudentList" MasterPageFile="~/Webpages/Admin.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<asp:Label ID="lblerror" runat="server" Text="---" Visible="false" CssClass="Label_style"></asp:Label>

<h1>Students List</h1>
<br />
<asp:GridView ID="grdstudents" runat="server" AllowSorting="True" 
                     AutoGenerateColumns="False"  
        CssClass="gridview" AllowPaging="true" PageSize="10" 
        onpageindexchanging="grdstudents_PageIndexChanging" 
    DataKeyNames="studid" onrowdatabound="grdstudents_RowDataBound" 
    onrowdeleting="grdstudents_RowDeleting">
             <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="studid" DataNavigateUrlFormatString="Adminviewstudent.aspx?studid={0}" DataTextField="studname" HeaderText="Student Name" ItemStyle-CssClass="a">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:HyperLinkField>
                
               <asp:BoundField DataField="mobile" HeaderText="Mobile">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                  <asp:BoundField DataField="course" HeaderText="Course">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                  <asp:BoundField DataField="emailid" HeaderText="Email ID">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:CommandField ShowDeleteButton="True" ControlStyle-Font-Bold="true"/>  
            </Columns>
            
            <rowstyle cssclass="RowStyle" />
            <alternatingrowstyle cssclass="AlternateRowStyle" />

            <PagerStyle ForeColor="#ffffff" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#330000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#ffffff" BorderColor="black" BorderStyle="Ridge" 
                 ForeColor="#000000" 
                HorizontalAlign="Justify" VerticalAlign="Middle" />
        </asp:GridView>

        <asp:Label ID="lblemailid" runat="server" Text="---" Visible="false" CssClass="Label_style"></asp:Label>

</asp:Content>