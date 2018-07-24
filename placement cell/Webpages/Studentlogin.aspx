<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Studentlogin.aspx.cs" Inherits="placement_cell.Webpages.Studentlogin" MasterPageFile="~/Webpages/user.Master" %>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Registered User Login</h1>
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
                        <td colspan="2" style="text-align:center;">
                                                 
                           <asp:Label ID="lblerror" runat="server" Text="---" Visible="false" CssClass="Label_style"></asp:Label>

                           <br />
                           <asp:Button ID="btnregister" runat="server" Text="Verfiy" 
                              CssClass="button_style" Visible="false" onclick="btnregister_Click" />
                        </td>
                    </tr>


                    <tr>
                      <td colspan="2">
                          <asp:Button ID="btnlogin" runat="server" Text="Login" 
                              CssClass="button_style" onclick="btnlogin_Click" ValidationGroup="test" /></td>
                    </tr>
                         
            </table>


            <h1>New Student Registration</h1>
            <ol>
                <li>Enter e-mail address in the box at the botton of this page. </li>
                <li>Provide the validation code sent to you on the email address you provided in "Step 1".</li>
                <li>Fill the online Registration form and click submit.</li>
            </ol>
<h3>Please provide a valid email id, an email verificaiton code will be sent to your email id. </h3>
<table id="logintable">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Enter Email Id" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtemailid" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                       <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Email Id" ControlToValidate="txtemailid"  Display="Dynamic" ValidationGroup="test1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display = "Dynamic" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  
                    ControlToValidate="txtemailid" ErrorMessage="Input valid email address!" ValidationGroup="test1" ></asp:RegularExpressionValidator>     </td>                
                    </tr>
                        
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Password" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtrpassword" runat="server" TextMode="Password" 
                                CssClass="textbox_style"></asp:TextBox>
                      <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtrpassword"  Display="Dynamic" ValidationGroup="test1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtrpassword" ID="RegularExpressionValidator2" ValidationExpression = "^[\s\S]{4,8}$" runat="server" ErrorMessage="Minimum 4 and Maximum 8 characters allowed." ValidationGroup="test1"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                   
                   <tr>
                        <td colspan="2" style="text-align:center;">
                                                 
                           <asp:Label ID="lblerror1" runat="server" Text="---" Visible="false" CssClass="Label_style"></asp:Label>
                        </td>
                    </tr>


                    <tr>
                      <td colspan="2">
                          <asp:Button ID="btnnext" runat="server" Text="Next" ValidationGroup="test1" 
                              CssClass="button_style" onclick="btnnext_Click"/></td>
                    </tr>
                         
            </table>
</asp:Content>