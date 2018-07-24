<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Companyregistration.aspx.cs" Inherits="placement_cell.Webpages.Companyregistration" MasterPageFile="~/Webpages/user.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h1>Company Registration Form</h1>
<table id="logintable">

                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Company Name" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtcmpname" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                      <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Company Name" ControlToValidate="txtcmpname"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
                            
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Company Address" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtcmpaddress" runat="server" CssClass="textbox_style" MaxLength="300" TextMode="MultiLine" Height="100"></asp:TextBox>
                       <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Company Address" ControlToValidate="txtcmpaddress"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                        
                     <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Phone Number"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtphoneno" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                       <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Phone No" ControlToValidate="txtphoneno"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="About Company"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtaboutcompany" runat="server" CssClass="textbox_style" MaxLength="500" TextMode="MultiLine" Height="200"></asp:TextBox>
                        </td>
                    </tr>


                     <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Email Id"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtemailid" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                        </td>
                    </tr>
                   
                   <tr>
                        <td colspan="2" style="text-align:center;">
                                                 
                           <asp:Label ID="lblerror1" runat="server" Text="---" Visible="false" CssClass="Label_style"></asp:Label>
                        </td>
                    </tr>


                    <tr>
                      <td colspan="2">
                          <asp:Button ID="btnsave" runat="server" Text="Save" 
                              CssClass="button_style" ValidationGroup="test" onclick="btnsave_Click"/></td>
                    </tr>
                         
</table>

</asp:Content>