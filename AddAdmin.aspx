<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AddAdmin.aspx.cs" Inherits="Mini_LibraryManagementSystem.AddAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 112px;
        }
        .small-font {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menu">
        <div class="title">
            <h3>Add new admin | </h3>
        </div>
        <div class="container_admin">
              <div class="add_admin">
                  <table class="auto-style1">
                    <tr>
                        <td class="auto-style3 pt-4 pb-2" colspan="2">
                            <h5><b>Add new admin here!</b></h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
                        </td>
                        <td><asp:TextBox ID="txtName" CssClass="txtbox" placeholder="" runat="server" Width="300px" Height="33px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
                        </td>
                        <td><asp:TextBox ID="txtEmail" CssClass="txtbox" placeholder=" @gmail.com" runat="server" TextMode="Email" Width="300px" Height="33px"></asp:TextBox></td>
                    </tr>
                      <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label5" runat="server" Text="Phone no:"></asp:Label>
                        </td>
                        <td><asp:TextBox ID="txtPhone" CssClass="txtbox" placeholder=" 09-*********" runat="server" Width="300px" MaxLength="11" Height="33px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" CssClass="txtbox" placeholder=" 8 characters or numbers" runat="server" Height="33px" TextMode="Password" Width="300px" autocomplete="new-password" MaxLength="8"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label4" runat="server" Text="Re_Password:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCfPassword" CssClass="txtbox" placeholder=" Confirm your password." runat="server" Height="33px" TextMode="Password" Width="300px" autocomplete="new-password" MaxLength="8"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" colspan="2" align="center">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password and confirm password must be the same." ControlToCompare="txtCfPassword" ControlToValidate="txtPassword" ForeColor="Red" Height="15px"></asp:CompareValidator><br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblMesg" runat="server" class="ms-5" ForeColor="Red" Height="15px" Text=""></asp:Label>
                            <asp:CheckBox ID="chkShowPassword" class="float-end" runat="server" Height="15px" Text="&nbsp;show password" />
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3 pt-3" colspan="2" align="center">
                
                            <div class="btn-group">
                                <asp:Button ID="btnSign" class="btn btn-md btn-outline-success" runat="server" width="100px" Text="Save" OnClick="btnSign_Click"/>
                                <asp:Button ID="btnClear" class="btn btn-md btn-outline-success" runat="server" Text="Clear" Width="100px" OnClick="btnClear_Click" />
                                <asp:Button ID="btnUpdate" class="btn btn-md btn-outline-success" runat="server" Text="Update" Width="100px" OnClick="btnUpdate_Click" />
                                <asp:Button ID="btnDelete" class="btn btn-md btn-danger" runat="server" Text="Delete" Width="100px" OnClick="btnDelete_Click" />
                            </div>
                
                        </td>
                    </tr>
                </table>
              </div>
                <div class="adm_gridview" >

                    <asp:GridView ID="GridView1" runat="server" Height="165px" Width="100%" CellPadding="4" GridLines="None" ForeColor="#333333">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>

                </div>
                
            </div>
        <div class="footer">
            <h5>University of Computer Studies, Pyay</h5>
        </div>
    </div>

    <script type="text/javascript">

        function togglePasswordVisibility() {
            var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            var CpasswordField = document.getElementById('<%= txtCfPassword.ClientID %>');
            var checkbox = document.getElementById('<%= chkShowPassword.ClientID %>');

            if (checkbox.checked) {
                passwordField.type = "text";
                CpasswordField.type = "text";
            }
            else {
                passwordField.type = "password";
                CpasswordField.type = "password";
            }
        }

        // Attach the function to the checkbox's change event
        document.getElementById('<%= chkShowPassword.ClientID %>').addEventListener('change', togglePasswordVisibility);
</script>
</asp:Content>
