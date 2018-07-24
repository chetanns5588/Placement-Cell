<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Companyverification.aspx.cs" Inherits="placement_cell.Webpages.Companyverification" MasterPageFile="~/Webpages/user.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <h1>Company Verification</h1>
<table id="logintable">
                    <tr>
                        <td>
                            <asp:Label ID="uname" runat="server" Text="User Name" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtusername" runat="server" CssClass="textbox_style"></asp:TextBox>
                       <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter User Name" ControlToValidate="txtusername"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator></td>
                    </tr>
                        
                    <tr>
                        <td>
                            <asp:Label ID="pwd" runat="server" Text="Password" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" 
                                CssClass="textbox_style"></asp:TextBox>
                      <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtpassword"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                   
                   <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Verification Code" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtverificationcode" runat="server" TextMode="Password" 
                                CssClass="textbox_style"></asp:TextBox>
                      <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter verification code" ControlToValidate="txtverificationcode"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                   <tr>
                        <td colspan="2" style="text-align:center;">
                                                 
                           <asp:Label ID="lblerror" runat="server" Text="---" Visible="false" CssClass="Label_style"></asp:Label>
                        </td>
                    </tr>


                    <tr>
                      <td colspan="2">
                          <asp:Button ID="btnlogin" runat="server" Text="Login" 
                              CssClass="button_style" onclick="btnlogin_Click" ValidationGroup="test" /></td>
                    </tr>
                         
            </table>

</asp:Content>