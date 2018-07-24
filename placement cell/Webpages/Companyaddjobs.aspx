<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Companyaddjobs.aspx.cs" Inherits="placement_cell.Webpages.Companyaddjobs" MasterPageFile="~/Webpages/Company.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<h1>Job Add/Update</h1>
<table id="logintable">

                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Job Id" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtjobid" runat="server" CssClass="textbox_style" ReadOnly="true"></asp:TextBox>         
                       </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Job Title" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txttitle" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                       <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Job Title" ControlToValidate="txttitle"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                        
                     <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Job Description"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtdescription" runat="server" CssClass="textbox_style" MaxLength="300" TextMode="MultiLine" Height="100"></asp:TextBox>
                       <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Job Description" ControlToValidate="txtdescription"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Location"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtlocation" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Job Location" ControlToValidate="txtlocation"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
                        </td>
                    </tr>


                     <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Qualification"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtqualification" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Required Qualification" ControlToValidate="txtqualification"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                      <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Salary Offered"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtsalaryoffered" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Salary Offered" ControlToValidate="txtsalaryoffered"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
                            
                            <asp:RegularExpressionValidator id="RegularExpressionValidator1" ControlToValidate="txtsalaryoffered" ValidationExpression="\d+" Display="Dynamic" EnableClientScript="true" ErrorMessage="Please enter numbers only" runat="server" ValidationGroup="test"/>
                        </td>
                    </tr>

                     <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Required Skills"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtskills" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Required Skills" ControlToValidate="txtskills"  Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                     <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Company Email ID"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtcmpemailid" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                        </td>
                    </tr>

                     <tr>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="Company Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtcmpname" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                        </td>
                    </tr>

                   
                   <tr>
                        <td colspan="2" style="text-align:center;">
                                                 
                           <asp:Label ID="lblerror" runat="server" Text="---" Visible="false" CssClass="Label_style"></asp:Label>
                        </td>
                    </tr>


                    <tr>
                      <td colspan="2">
                            <asp:Button ID="btnedit" runat="server" Text="Edit" CssClass="button_style" 
                        Visible="false" onclick="btnedit_Click"/>     
                   <asp:Button ID="btnsave" runat="server" Text="Save" ValidationGroup="test" 
                        CssClass="button_style" Visible="false" onclick="btnsave_Click"/>   
                    <asp:Button ID="btnupdate" runat="server" Text="Update" ValidationGroup="test" 
        CssClass="button_style" Visible="false" onclick="btnupdate_Click"/>   
 <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="button_style" 
        Visible="false" onclick="btncancel_Click"/>    
 <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="button_style" 
        Visible="false" 
        OnClientClick="javascript:return confirm('Are you sure you want Delete?');" 
                        onclick="btndelete_Click" /> 

                              </td>
                    </tr>
                         
</table>


</asp:Content>