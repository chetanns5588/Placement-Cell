<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Companyviewstudents.aspx.cs" Inherits="placement_cell.Webpages.Companyviewstudents" MasterPageFile="~/Webpages/Company.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <h1>Student Details</h1>
<table id="logintable">

<tr>
        <td>
           <asp:Label ID="Label11" runat="server" Text="Student ID"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtstudid" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
        </td>
    </tr>

 <tr>
        <td>
           <asp:Label ID="Label10" runat="server" Text="Email ID"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtemailid" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
        </td>
    </tr>

    <tr>
        <td>
           <asp:Label ID="uname" runat="server" Text="Student Name"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtstudname" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
        
        </td>
    </tr>
    
      <tr>
        <td>
           <asp:Label ID="Label1" runat="server" Text="Father Name"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtfather" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
         
        </td>
    </tr>

    <tr>
        <td>
           <asp:Label ID="Label2" runat="server" Text="Date of Birth"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtdob" runat="server" CssClass="textbox_style" MaxLength="20"></asp:TextBox>
        </td>
    </tr>
    
     <tr>
        <td>
           <asp:Label ID="Label3" runat="server" Text="Gender"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtgender" runat="server" CssClass="textbox_style" MaxLength="20"></asp:TextBox>
        </td>
    </tr>

     <tr>
        <td>
           <asp:Label ID="Label5" runat="server" Text="Address"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtaddress" runat="server" CssClass="textbox_style" MaxLength="300" TextMode="MultiLine" Height="100"></asp:TextBox>
        
        </td>
    </tr>

       <tr>
        <td>
           <asp:Label ID="Label6" runat="server" Text="Mobile No."></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtmobile" runat="server" CssClass="textbox_style" MaxLength="15" Text="91-"></asp:TextBox>
       
        </td>
    </tr>

     <tr>
        <td>
           <asp:Label ID="Label7" runat="server" Text="Land Line"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtlandline" runat="server" CssClass="textbox_style" MaxLength="15"></asp:TextBox>
          
        </td>
    </tr>

    <tr>
        <td>
           <asp:Label ID="Label4" runat="server" Text="Current College"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtcollege" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
          
        </td>
    </tr>

     <tr>
        <td>
           <asp:Label ID="Label8" runat="server" Text="Current Course"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtcourse" runat="server" CssClass="textbox_style" MaxLength="50"></asp:TextBox>
          
        </td>
    </tr>

      <tr>
        <td>
           <asp:Label ID="Label9" runat="server" Text="Current Percentage"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtpercentage" runat="server" CssClass="textbox_style" MaxLength="10"></asp:TextBox>
          
        </td>
    </tr>


    <tr>
        <td colspan="2">
           <h2>SSLC (Perc, Board and Year) Details</h2>
        </td>
    </tr>
    <tr>
        <td colspan="2">
          <asp:TextBox ID="txtsslcperc" runat="server" CssClass="textbox_style" MaxLength="5"></asp:TextBox>
          
        </td>
    </tr>
     <tr>
        <td colspan="2">
          <asp:TextBox ID="txtsslcboard" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
          
        </td>
    </tr>

     <tr>
        <td colspan="2">
          <asp:TextBox ID="txtsslcyear" runat="server" CssClass="textbox_style" MaxLength="4"></asp:TextBox>
          
        </td>
    </tr>

    <tr>
        <td colspan="2">
           <h2>PUC (Perc, Board and Year) Details</h2>
        </td>
    </tr>
    <tr>
        <td colspan="2">
          <asp:TextBox ID="txtpucperc" runat="server" CssClass="textbox_style" MaxLength="5"></asp:TextBox>
         
        </td>
    </tr>
     <tr>
        <td colspan="2">
          <asp:TextBox ID="txtpucboard" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
          
        </td>
    </tr>

     <tr>
        <td colspan="2">
          <asp:TextBox ID="txtpucyear" runat="server" CssClass="textbox_style" MaxLength="4"></asp:TextBox>
         
        </td>
    </tr>

    <tr>
                      <td colspan="2">
                          <asp:Button ID="btnback" runat="server" Text="Back" 
                              CssClass="button_style" ValidationGroup="test" onclick="btnback_Click" /></td>
                    </tr>
</table>

</asp:Content>