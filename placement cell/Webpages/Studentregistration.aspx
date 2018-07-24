<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Studentregistration.aspx.cs" Inherits="placement_cell.Webpages.Studentregistration" MasterPageFile="~/Webpages/user.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <h1>Student Registration</h1>
<table id="logintable">

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
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Student Name" ControlToValidate="txtstudname"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
        </td>
    </tr>
    
      <tr>
        <td>
           <asp:Label ID="Label1" runat="server" Text="Father Name"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtfather" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Father Name" ControlToValidate="txtfather"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
        </td>
    </tr>

    <tr>
        <td>
           <asp:Label ID="Label2" runat="server" Text="Date of Birth"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtdob" runat="server" CssClass="textbox_style" MaxLength="20"></asp:TextBox>
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Date of Birth" ControlToValidate="txtdob"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>

          <asp:CompareValidator ID="DateValidator" runat="server" Operator="DataTypeCheck"
        Type="Date" ControlToValidate="txtdob" ErrorMessage="Enter MM/DD/YYYY format" />
        </td>
    </tr>
    
     <tr>
        <td>
           <asp:Label ID="Label3" runat="server" Text="Gender"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="lstgender" runat="server" CssClass="textbox_style">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>

     <tr>
        <td>
           <asp:Label ID="Label5" runat="server" Text="Address"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtaddress" runat="server" CssClass="textbox_style" MaxLength="300" TextMode="MultiLine" Height="100"></asp:TextBox>
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Address" ControlToValidate="txtaddress"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
        </td>
    </tr>

       <tr>
        <td>
           <asp:Label ID="Label6" runat="server" Text="Mobile No."></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtmobile" runat="server" CssClass="textbox_style" MaxLength="15" Text="91-"></asp:TextBox>
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Mobile" ControlToValidate="txtmobile"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtmobile" ID="RegularExpressionValidator5" ValidationExpression = "^\d{2}-\d{10}$" runat="server" ErrorMessage="Enter 10 digits number with country code." ValidationGroup="test"></asp:RegularExpressionValidator>
        </td>
    </tr>

     <tr>
        <td>
           <asp:Label ID="Label7" runat="server" Text="Land Line"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtlandline" runat="server" CssClass="textbox_style" MaxLength="15"></asp:TextBox>
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Land Line" ControlToValidate="txtlandline"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator  Display="Dynamic" ControlToValidate = "txtlandline" ID="RegularExpressionValidator4" ValidationExpression = "^[\d]{10,11}$" runat="server" ErrorMessage="Minimum 10 and Maximum 12 digits allowed." ValidationGroup="test"></asp:RegularExpressionValidator>
        </td>
    </tr>

    <tr>
        <td>
           <asp:Label ID="Label4" runat="server" Text="Current College"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtcollege" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter College Name" ControlToValidate="txtcollege"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
        </td>
    </tr>

     <tr>
        <td>
           <asp:Label ID="Label8" runat="server" Text="Current Course"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtcourse" runat="server" CssClass="textbox_style" MaxLength="50"></asp:TextBox>
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Course Name" ControlToValidate="txtcourse"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
        </td>
    </tr>

      <tr>
        <td>
           <asp:Label ID="Label9" runat="server" Text="Current Percentage"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="txtpercentage" runat="server" CssClass="textbox_style" MaxLength="10"></asp:TextBox>
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter Percentage" ControlToValidate="txtpercentage"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtpercentage" ID="RegularExpressionValidator1" ValidationExpression = "^\d{2}.\d{2}$" runat="server" ErrorMessage="Enter 00.00 perc." ValidationGroup="test"></asp:RegularExpressionValidator>
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
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Enter SSLC Percentage" ControlToValidate="txtsslcperc"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtsslcperc" ID="RegularExpressionValidator2" ValidationExpression = "^\d{2}.\d{2}$" runat="server" ErrorMessage="Enter 00.00 perc." ValidationGroup="test"></asp:RegularExpressionValidator>
        </td>
    </tr>
     <tr>
        <td colspan="2">
          <asp:TextBox ID="txtsslcboard" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Enter SSLC Board" ControlToValidate="txtsslcboard"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
        </td>
    </tr>

     <tr>
        <td colspan="2">
          <asp:TextBox ID="txtsslcyear" runat="server" CssClass="textbox_style" MaxLength="4"></asp:TextBox>
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Enter SSLC Year" ControlToValidate="txtsslcyear"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtsslcyear" ID="RegularExpressionValidator3" ValidationExpression = "^\d{4}$" runat="server" ErrorMessage="Enter 0000 year format." ValidationGroup="test"></asp:RegularExpressionValidator>
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
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Enter PUC Percentage" ControlToValidate="txtpucperc"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtpucperc" ID="RegularExpressionValidator6" ValidationExpression = "^\d{2}.\d{2}$" runat="server" ErrorMessage="Enter 00.00 perc." ValidationGroup="test"></asp:RegularExpressionValidator>
        </td>
    </tr>
     <tr>
        <td colspan="2">
          <asp:TextBox ID="txtpucboard" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Enter PUC Board" ControlToValidate="txtpucboard"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
        </td>
    </tr>

     <tr>
        <td colspan="2">
          <asp:TextBox ID="txtpucyear" runat="server" CssClass="textbox_style" MaxLength="4"></asp:TextBox>
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Enter PUC Year" ControlToValidate="txtpucyear"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtpucyear" ID="RegularExpressionValidator7" ValidationExpression = "^\d{4}$" runat="server" ErrorMessage="Enter 0000 year format." ValidationGroup="test"></asp:RegularExpressionValidator>
        </td>
    </tr>

    <tr>
                      <td colspan="2">
                          <asp:Button ID="btnsave" runat="server" Text="Save" 
                              CssClass="button_style" ValidationGroup="test" onclick="btnsave_Click" /></td>
                    </tr>
</table>
</asp:Content>