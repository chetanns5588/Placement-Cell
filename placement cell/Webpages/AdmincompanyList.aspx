<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdmincompanyList.aspx.cs" Inherits="placement_cell.Webpages.AdmincompanyList" MasterPageFile="~/Webpages/Admin.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<h1>Companies List</h1>
<br />
<asp:Label ID="lblerror" runat="server" Text="---" Visible="false" CssClass="Label_style"></asp:Label>

<asp:GridView ID="grdcompanies" runat="server" AllowSorting="True" 
                     AutoGenerateColumns="False"  
        CssClass="gridview1" AllowPaging="true" PageSize="10" 
    DataKeyNames="cmpid" onpageindexchanging="grdcompanies_PageIndexChanging" 
        onrowdatabound="grdcompanies_RowDataBound" 
        onrowdeleting="grdcompanies_RowDeleting">
             <Columns>               
               <asp:BoundField DataField="cmpname" HeaderText="Company Name">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                  <asp:BoundField DataField="cmpaddress" HeaderText="Address">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                 <asp:BoundField DataField="phoneno" HeaderText="Phone No.">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                  <asp:BoundField DataField="aboutcompany" HeaderText="About Company">
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

        <asp:Label ID="lblcmpemailid" runat="server" Text="---" CssClass="Label_style" Visible="false"></asp:Label>
</asp:Content>