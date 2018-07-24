<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminviewjobs.aspx.cs" Inherits="placement_cell.Webpages.Adminviewjobs" MasterPageFile="~/Webpages/Admin.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h1>Job Details</h1>
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
                      
                        </td>
                    </tr>
                        
                     <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Job Description"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtdescription" runat="server" CssClass="textbox_style" MaxLength="300" TextMode="MultiLine" Height="100"></asp:TextBox>
                       
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Location"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtlocation" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                           
                        </td>
                    </tr>


                     <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Qualification"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtqualification" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                           
                        </td>
                    </tr>

                      <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Salary Offered"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtsalaryoffered" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                            
                        </td>
                    </tr>

                     <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Required Skills"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtskills" runat="server" CssClass="textbox_style" MaxLength="100"></asp:TextBox>
                            
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
                            <asp:Button ID="btnback" runat="server" Text="Back" CssClass="button_style" 
                                onclick="btnback_Click" />     
                       </td>
                    </tr>
                         
</table>



</asp:Content>