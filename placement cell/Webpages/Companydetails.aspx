<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Companydetails.aspx.cs" Inherits="placement_cell.Webpages.Companydetails" MasterPageFile="~/Webpages/Company.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h1>Company Details Form</h1>
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
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtpassword" runat="server" CssClass="textbox_style" MaxLength="8" TextMode="Password"></asp:TextBox>
                             <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtpassword"  Display="Dynamic" ValidationGroup="test1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtpassword" ID="RegularExpressionValidator2" ValidationExpression = "^[\s\S]{4,8}$" runat="server" ErrorMessage="Minimum 4 and Maximum 8 characters allowed." ValidationGroup="test"></asp:RegularExpressionValidator>
                        </td>
                    </tr>

                     <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Confirm Password"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtcnfrmpassword" runat="server" CssClass="textbox_style" MaxLength="8" TextMode="Password"></asp:TextBox>
                            <br />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Confirm Password" ControlToValidate="txtcnfrmpassword"  Display="Dynamic" ValidationGroup="test1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtcnfrmpassword" ID="RegularExpressionValidator1" ValidationExpression = "^[\s\S]{4,8}$" runat="server" ErrorMessage="Minimum 4 and Maximum 8 characters allowed." ValidationGroup="test"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                   
                   <tr>
                        <td colspan="2" style="text-align:center;">
                                                 
                           <asp:Label ID="lblerror" runat="server" Text="---" Visible="false" CssClass="Label_style"></asp:Label>
                        </td>
                    </tr>


                    <tr>
                      <td colspan="2">
                         <asp:Button ID="btnedit" runat="server" Text="Edit" 
                              CssClass="button_style" onclick="btnedit_Click" ValidationGroup="test"/>
                         
                          <asp:Button ID="btnupdate" runat="server" Text="Update" 
                              CssClass="button_style" Visible="false" onclick="btnupdate_Click"/>     
                           
                           <asp:Button ID="btncancel" runat="server" Text="Cancel" 
                              CssClass="button_style" Visible="false" onclick="btncancel_Click"/>
                              </td>
                    </tr>
                         
</table>


</asp:Content>